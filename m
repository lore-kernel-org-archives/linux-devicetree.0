From: Gabriel Fernandez <gabriel.fernandez-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 0/9] clk: ST clock fixes
Date: Tue, 23 Jun 2015 16:09:18 +0200
Message-ID: <1435068567-30995-1-git-send-email-gabriel.fernandez@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>, Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Gabriel Fernandez <gabriel.fernandez-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Pankaj Dev <pankaj.dev-qxv4g6HH51o@public.gmane.org>, Olivier Bideau <olivier.bideau-qxv4g6HH51o@public.gmane.org>, Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Fabian Frederick <fabf-AgBVmzD5pcezQB+pC5nmwQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This first patch-set contains various clock fixes for ST SoC.

Gabriel Fernandez (7):
  drivers: clk: st: Incorrect clocks status
  drivers: clk: st: Incorrect register offset used for lock_status
  drivers: clk: st: Remove unused code
  drivers: clk: st: Fix FSYN channel values
  drivers: clk: st: Fix mux bit-setting for Cortex A9 clocks
  drivers: clk: st: Rename st_pll3200c32_407_c0_x into
    st_pll3200c32_cx_x
  ARM: STi: DT: Rename st_pll3200c32_407_c0_x into st_pll3200c32_cx_x

Giuseppe Cavallaro (1):
  drivers: clk: st: Fix flexgen lock init

Pankaj Dev (1):
  drivers: clk: st: Add CLK_GET_RATE_NOCACHE flag to clocks

 .../devicetree/bindings/clock/st/st,clkgen-pll.txt |  4 ++--
 arch/arm/boot/dts/stih407-clock.dtsi               |  4 ++--
 arch/arm/boot/dts/stih410-clock.dtsi               |  4 ++--
 arch/arm/boot/dts/stih418-clock.dtsi               |  4 ++--
 drivers/clk/st/clk-flexgen.c                       |  4 +++-
 drivers/clk/st/clkgen-fsyn.c                       | 20 +++++++----------
 drivers/clk/st/clkgen-mux.c                        | 25 +++++++++++++---------
 drivers/clk/st/clkgen-pll.c                        | 14 ++++++------
 8 files changed, 41 insertions(+), 38 deletions(-)

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
