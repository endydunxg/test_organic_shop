import type { FormEvent } from "react";
import { Leaf, LogOut, Search, ShoppingBag, UserRound } from "lucide-react";
import { Link, NavLink } from "react-router-dom";

type AppHeaderProps = {
  keyword: string;
  onKeywordChange: (value: string) => void;
  onSearch: (event: FormEvent<HTMLFormElement>) => void;
  token: string;
  isAdmin: boolean;
  onLogout: () => void;
  cartCount: number;
};

export function AppHeader({
  keyword,
  onKeywordChange,
  onSearch,
  token,
  isAdmin,
  onLogout,
  cartCount,
}: AppHeaderProps) {
  return (
    <header className="shell pt-4 sm:pt-6">
      <div className="panel flex flex-col gap-4 px-4 py-4 sm:px-5 lg:flex-row lg:items-center lg:justify-between">
        <Link to="/" className="flex min-w-0 items-center gap-3">
          <div className="rounded-2xl bg-leaf/10 p-3 text-leaf">
            <Leaf className="h-6 w-6" />
          </div>
          <div className="min-w-0">
            <p className="truncate font-heading text-lg font-bold text-moss sm:text-xl">Organic Shop</p>
            <p className="text-xs uppercase tracking-[0.3em] text-slate-500">Tuoi. Sach. Minh bach.</p>
          </div>
        </Link>

        <form
          onSubmit={onSearch}
          className="flex w-full flex-1 items-center gap-3 rounded-full bg-mist px-4 py-3 lg:max-w-xl"
        >
          <Search className="h-4 w-4 text-slate-400" />
          <input
            value={keyword}
            onChange={(event) => onKeywordChange(event.target.value)}
            placeholder="Tim rau cu, trai cay, thuc pham huu co..."
            className="w-full bg-transparent text-sm outline-none"
          />
        </form>

        <nav className="flex items-center gap-2 overflow-x-auto pb-1 text-sm font-medium">
          {[
            ["/products", "San pham"],
            ["/journal", "Bai viet"],
            ["/cart", "Gio hang"],
            ["/profile", "Ca nhan"],
            ...(isAdmin ? [["/admin", "Quan tri"]] : []),
          ].map(([href, label]) => (
            <NavLink
              key={href}
              to={href}
              className={({ isActive }) =>
                `whitespace-nowrap rounded-full px-4 py-2 transition ${isActive ? "bg-leaf text-white" : "text-slate-600 hover:text-moss"}`
              }
            >
              {label}
            </NavLink>
          ))}
          {token ? (
            <button onClick={onLogout} className="button-secondary shrink-0 gap-2 whitespace-nowrap">
              <LogOut className="h-4 w-4" />
              Dang xuat
            </button>
          ) : (
            <Link to="/authenticate" className="button-primary shrink-0 gap-2 whitespace-nowrap">
              <UserRound className="h-4 w-4" />
              Dang nhap
            </Link>
          )}
          <Link to="/cart" className="relative shrink-0 rounded-full bg-moss px-4 py-3 text-white">
            <ShoppingBag className="h-4 w-4" />
            <span className="absolute -right-1 -top-1 rounded-full bg-sage px-1.5 text-[10px] font-bold text-moss">
              {cartCount}
            </span>
          </Link>
        </nav>
      </div>
    </header>
  );
}
