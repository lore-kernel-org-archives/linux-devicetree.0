From: Yixun Lan <yixun.lan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v2 0/5] ARM64: dts: meson-axg: UART DT updates
Date: Sat, 6 Jan 2018 08:10:39 +0800
Message-ID: <20180106001044.108163-1-yixun.lan@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, Yixun Lan <yixun.lan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

HI Kevin
 These are the UART DT updates for the Meson-AXG platform.

 The patch 1 is a general fix.
Other patches are about adding clock & pinctrl info, then using them.
Last patch enable UART_A which connect to a BT module on the S400 board.

Note: 
This series depend on previous UART_AO clock switch patch[1]
also, these patch request clocks, so they need the
tag:meson-clk-for-v4.16-2 from clk-meson's tree in order to compile.

Changes since v1 at [2]:
  -- fix address range for all platform
  -- squash patch 1, 3 (drop compatible & add clock)
  -- fix typo in pinctrl info
  -- add Jerome's Ack

[1] 
 http://lkml.kernel.org/r/20171215141741.175985-1-yixun.lan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org

[2]
 http://lkml.kernel.org/r/20180105095621.196472-1-yixun.lan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org


Yixun Lan (5):
  ARM64: dts: meson: uart: fix address space range
  ARM64: dts: meson-axg: uart: drop legacy compatible name from EE UART
  ARM64: dts: meson-axg: uart: Add the pinctrl info description
  ARM64: dts: meson-axg: complete the pinctrl info for UART_AO_A
  ARM64: dts: meson-axg: enable the UART_A controller

 arch/arm64/boot/dts/amlogic/meson-axg-s400.dts |   9 ++
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi     | 109 ++++++++++++++++++++++++-
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi      |  10 +--
 3 files changed, 119 insertions(+), 9 deletions(-)

-- 
2.15.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
