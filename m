From: Gabriel Fernandez <gabriel.fernandez-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 5/9] drivers: clk: st: Fix flexgen lock init
Date: Tue, 23 Jun 2015 16:09:23 +0200
Message-ID: <1435068567-30995-6-git-send-email-gabriel.fernandez@linaro.org>
References: <1435068567-30995-1-git-send-email-gabriel.fernandez@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1435068567-30995-1-git-send-email-gabriel.fernandez-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>, Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Gabriel Fernandez <gabriel.fernandez-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Pankaj Dev <pankaj.dev-qxv4g6HH51o@public.gmane.org>, Olivier Bideau <olivier.bideau-qxv4g6HH51o@public.gmane.org>, Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Fabian Frederick <fabf-AgBVmzD5pcezQB+pC5nmwQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Giuseppe Cavallaro <peppe.cavallaro-qxv4g6HH51o@public.gmane.org>

While proving lock, the following warning happens
and it is fixed after initializing lock in the setup
function

INFO: trying to register non-static key.
the code is fine but needs lockdep annotation.
turning off the locking correctness validator.
CPU: 0 PID: 0 Comm: swapper/0 Not tainted 3.10.27-02861-g39df285-dirty #33
[<c00154ac>] (unwind_backtrace+0x0/0xf4) from [<c0011b50>] (show_stack+0x10/0x14)
[<c0011b50>] (show_stack+0x10/0x14) from [<c00689ac>] (__lock_acquire+0x900/0xb14)
[<c00689ac>] (__lock_acquire+0x900/0xb14) from [<c0069394>] (lock_acquire+0x68/0x7c)
[<c0069394>] (lock_acquire+0x68/0x7c) from [<c04958f8>] (_raw_spin_lock_irqsave+0x48/0x5c)
[<c04958f8>] (_raw_spin_lock_irqsave+0x48/0x5c) from [<c0381e6c>] (clk_gate_endisable+0x28/0x88)
[<c0381e6c>] (clk_gate_endisable+0x28/0x88) from [<c0381ee0>] (clk_gate_enable+0xc/0x14)
[<c0381ee0>] (clk_gate_enable+0xc/0x14) from [<c0386c68>] (flexgen_enable+0x28/0x40)
[<c0386c68>] (flexgen_enable+0x28/0x40) from [<c037f260>] (__clk_enable+0x5c/0x9c)
[<c037f260>] (__clk_enable+0x5c/0x9c) from [<c037f558>] (clk_enable+0x18/0x2c)
[<c037f558>] (clk_enable+0x18/0x2c) from [<c064a1dc>] (st_lpc_of_register+0xc0/0x248)
[<c064a1dc>] (st_lpc_of_register+0xc0/0x248) from [<c0649e44>] (clocksource_of_init+0x34/0x58)
[<c0649e44>] (clocksource_of_init+0x34/0x58) from [<c0637ddc>] (sti_timer_init+0x10/0x18)
[<c0637ddc>] (sti_timer_init+0x10/0x18) from [<c06343f8>] (time_init+0x20/0x30)
[<c06343f8>] (time_init+0x20/0x30) from [<c0632984>] (start_kernel+0x20c/0x2e8)
[<c0632984>] (start_kernel+0x20c/0x2e8) from [<40008074>] (0x40008074)

Signed-off-by: Giuseppe Cavallaro <peppe.cavallaro-qxv4g6HH51o@public.gmane.org>
Signed-off-by: Gabriel Fernandez <gabriel.fernandez-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/clk/st/clk-flexgen.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/st/clk-flexgen.c b/drivers/clk/st/clk-flexgen.c
index 657ca14..be06d2a 100644
--- a/drivers/clk/st/clk-flexgen.c
+++ b/drivers/clk/st/clk-flexgen.c
@@ -303,6 +303,8 @@ static void __init st_of_flexgen_setup(struct device_node *np)
 	if (!rlock)
 		goto err;
 
+	spin_lock_init(rlock);
+
 	for (i = 0; i < clk_data->clk_num; i++) {
 		struct clk *clk;
 		const char *clk_name;
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
