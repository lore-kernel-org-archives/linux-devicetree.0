From: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH v3 0/3] watchdog: dw_wdt: add reset lines
Date: Thu, 18 May 2017 10:42:35 +0200
Message-ID: <cover.9d687e41ad8d91c267143a43d703f656f7d5689c.1495096910.git-series.s.trumtrar@pengutronix.de>
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi!

This series adds support for the reset line that is (potentially) holding
the watchdog in reset.

As the watchdog is useless if this happens, it needs to be deasserted in
the probe function.

Tested on a Socrates board.

Regards,
Steffen

Changes since v2:

  - use optional reset functions
  - add Acked-by to devicetree bindings

Changes since v1:

  - remove reset-names property
  - remove warning if reset property is missing

Steffen Trumtrar (3):
  watchdog: bindings: dw_wdt: add reset lines
  watchdog: dw_wdt: get reset lines from dt
  ARM: socfpga: dtsi: add dw-wdt reset lines

 Documentation/devicetree/bindings/watchdog/dw_wdt.txt |  3 +++
 arch/arm/boot/dts/socfpga.dtsi                        |  2 ++
 drivers/watchdog/dw_wdt.c                             |  9 +++++++++
 3 files changed, 14 insertions(+)

base-commit: 2ea659a9ef488125eb46da6eb571de5eae5c43f6
-- 
git-series 0.9.1
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
