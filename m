From: <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH 0/6] STM32F4 Add RTC & QSPI clocks
Date: Fri, 30 Sep 2016 16:25:03 +0200
Message-ID: <1475245509-6487-1-git-send-email-gabriel.fernandez@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gabriel.fernandez-qxv4g6HH51o@public.gmane.org, ludovic.barre-qxv4g6HH51o@public.gmane.org, olivier.bideau-qxv4g6HH51o@public.gmane.org, amelie.delaunay-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Gabriel Fernandez <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>

This patch-set introduce RTC and QSPI clocks for STM32F4 socs
RTC clock has 3 parents clock oscillators (lsi/lse/hse_rtc)

example to use rtc clock:

		rtc: rtc@40002800 {
			compatible = "st,stm32-rtc";
			reg = <0x40002800 0x400>;
			...
			clocks = <&rcc 1 CLK_RTC>;

			assigned-clocks =  <&rcc 1 CLK_RTC>;
			assigned-clock-parents = <&rcc 1 CLK_LSE>;
			...
		};

Gabriel Fernandez (6):
  clk: stm32f4: Add LSI & LSE clocks
  ARM: dts: stm32f429: add LSI and LSE clocks
  arm: stmf32: Enable SYSCON
  clk: stm32f4: Add RTC clock
  clk: stm32f469: Add QSPI clock
  ARM: dts: stm32f429: Add QSPI clock

 .../devicetree/bindings/clock/st,stm32-rcc.txt     |   4 +-
 arch/arm/boot/dts/stm32f429.dtsi                   |  18 +
 arch/arm/boot/dts/stm32f469-disco.dts              |   4 +
 arch/arm/configs/stm32_defconfig                   |   1 +
 drivers/clk/clk-stm32f4.c                          | 450 ++++++++++++++++++++-
 5 files changed, 455 insertions(+), 22 deletions(-)

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
