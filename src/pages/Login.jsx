 import { useState } from "react";
import { useNavigate } from "react-router-dom";

export default function Login() {
  const navigate = useNavigate();
  const [form, setForm] = useState({ username: "", password: "" });
  const [error, setError] = useState("");
  const [loading, setLoading] = useState(false);

  const handleChange = (e) => {
    setForm((prev) => ({ ...prev, [e.target.name]: e.target.value }));
    setError("");
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    if (!form.username || !form.password) {
      setError("Please fill in all fields.");
      return;
    }
    setLoading(true);
    // Simulate async auth call
    await new Promise((r) => setTimeout(r, 800));
    setLoading(false);
    navigate("/dashboard");
  };

  return (
    <div className="min-h-screen flex items-center justify-center bg-slate-100 font-sans px-4">
      <div className="flex w-full max-w-3xl rounded-2xl overflow-hidden shadow-xl">

        {/* ── Left panel ── */}
        <div className="hidden md:flex flex-col justify-between bg-[#0f172a] text-white p-10 w-2/5 relative overflow-hidden">
          {/* decorative blobs */}
          <div className="absolute -top-16 -right-16 w-64 h-64 rounded-full bg-indigo-600 opacity-20 blur-3xl pointer-events-none" />
          <div className="absolute -bottom-12 -left-12 w-48 h-48 rounded-full bg-emerald-500 opacity-20 blur-3xl pointer-events-none" />

          {/* Logo */}
          <div className="flex items-center gap-3 z-10">
            <div className="w-8 h-8 rounded-lg bg-gradient-to-br from-indigo-500 to-emerald-400 flex items-center justify-center">
              <svg viewBox="0 0 16 16" className="w-4 h-4" fill="none">
                <path d="M8 2L14 13H2L8 2Z" fill="white" fillOpacity="0.9" />
              </svg>
            </div>
            <span className="text-sm font-medium tracking-wide">ABC BANK</span>
          </div>

          {/* Quote */}
          <div className="z-10">
          </div>
        </div>

        {/* ── Right panel ── */}
        <div className="flex-1 bg-white flex flex-col justify-center px-8 py-10">
          <h1 className="text-xl font-semibold text-slate-800 mb-1">Welcome back</h1>
          <p className="text-sm text-slate-400 mb-7">Sign in to your account</p>

          <form onSubmit={handleSubmit} className="space-y-4">
            {/* Username */}
            <div className="flex flex-col gap-1">
              <label className="text-[11px] font-medium uppercase tracking-widest text-slate-400">
                Username
              </label>
              <input
                type="text"
                name="username"
                value={form.username}
                onChange={handleChange}
                placeholder="you@example.com"
                className="w-full rounded-lg bg-slate-50 border border-slate-200 px-3 py-2.5 text-sm text-slate-800 placeholder:text-slate-300 focus:outline-none focus:ring-2 focus:ring-indigo-500/40 focus:border-indigo-400 transition"
              />
            </div>

            {/* Password */}
            <div className="flex flex-col gap-1">
              <label className="text-[11px] font-medium uppercase tracking-widest text-slate-400">
                Password
              </label>
              <input
                type="password"
                name="password"
                value={form.password}
                onChange={handleChange}
                placeholder="••••••••"
                className="w-full rounded-lg bg-slate-50 border border-slate-200 px-3 py-2.5 text-sm text-slate-800 placeholder:text-slate-300 focus:outline-none focus:ring-2 focus:ring-indigo-500/40 focus:border-indigo-400 transition"
              />
            </div>

            {/* Forgot */}
            <div className="text-right -mt-1">
              <a href="#" className="text-xs text-indigo-500 hover:underline">
                Forgot password?
              </a>
            </div>

            {/* Error */}
            {error && (
              <p className="text-xs text-red-500 bg-red-50 border border-red-100 rounded-lg px-3 py-2">
                {error}
              </p>
            )}

            {/* Submit */}
            <button
              type="submit"
              disabled={loading}
              className="w-full bg-[#0f172a] hover:bg-slate-700 active:scale-[0.98] text-white text-sm font-medium py-2.5 rounded-lg transition disabled:opacity-60"
            >
              {loading ? "Signing in…" : "Sign in"}
            </button>
          </form>

          {/* Divider */}
          <div className="flex items-center gap-3 my-5">
            <div className="flex-1 h-px bg-slate-100" />
            <span className="text-xs text-slate-300">or</span>
            <div className="flex-1 h-px bg-slate-100" />
          </div>

          {/* OAuth buttons */}
          <div className="space-y-2">
            <button className="w-full flex items-center justify-center gap-2 bg-slate-50 hover:bg-slate-100 border border-slate-200 text-slate-700 text-sm py-2.5 rounded-lg transition">
              <svg className="w-4 h-4" viewBox="0 0 16 16">
                <path d="M15.545 6.558a9.42 9.42 0 0 1 .139 1.626c0 2.434-.87 4.492-2.384 5.885C11.978 15.292 10.158 16 8 16A8 8 0 1 1 8 0a7.689 7.689 0 0 1 5.352 2.082l-2.284 2.284A4.347 4.347 0 0 0 8 3.166c-2.087 0-3.86 1.408-4.492 3.304a4.792 4.792 0 0 0 0 3.063c.635 1.893 2.405 3.301 4.492 3.301 1.078 0 2.004-.276 2.722-.764a3.702 3.702 0 0 0 1.599-2.431H8v-3.08h7.545z" fill="#4285F4" />
              </svg>
              Continue with Google
            </button>

          </div>

          <p className="text-center text-xs text-slate-400 mt-6">
            Don't have an account?{" "}
            <a href="#" className="text-indigo-500 hover:underline">
              Sign up free
            </a>
          </p>
        </div>
      </div>
    </div>
  );
}