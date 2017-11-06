From: Manivannan Sadhasivam <manivannan.sadhasivam-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 0/3] Add clock driver for Actions S900 SoC
Date: Tue,  7 Nov 2017 01:15:49 +0530
Message-ID: <1509997552-29718-1-git-send-email-manivannan.sadhasivam@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, afaerber-l3A5Bk7waGM@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: liuwei-/sSyCTpAT0ql5r2w9Jh5Rg@public.gmane.org, mp-cs-/sSyCTpAT0ql5r2w9Jh5Rg@public.gmane.org, 96boards-Ty1hIZOCd2XuufBYgWm87A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, amit.kucheria-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, manivannanece23-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Manivannan Sadhasivam <manivannan.sadhasivam-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patchset adds clock driver for Actions Semi OWL series
S900 SoC with relevant clock bindings and device tree data.

This series also addresses the review comments from previous
submission happened last year.

https://patchwork.kernel.org/patch/9254471/

Driver has been validated on Bubblegum-96 board.

Thanks,
Mani

Manivannan Sadhasivam (3):
  dt-bindings: clock: Add Actions S900 clock bindings
  arm64: dts: actions: Add S900 clock management unit nodes
  clk: actions: Add clock driver for Actions S900 SoC

 .../devicetree/bindings/clock/actions,s900-cmu.txt |  47 ++
 MAINTAINERS                                        |   8 +
 arch/arm64/boot/dts/actions/s900.dtsi              |  20 +
 drivers/clk/Kconfig                                |   1 +
 drivers/clk/Makefile                               |   1 +
 drivers/clk/actions/Kconfig                        |   6 +
 drivers/clk/actions/Makefile                       |   2 +
 drivers/clk/actions/owl-clk.c                      | 316 +++++++++++
 drivers/clk/actions/owl-clk.h                      | 298 +++++++++++
 drivers/clk/actions/owl-factor.c                   | 268 ++++++++++
 drivers/clk/actions/owl-pll.c                      | 344 ++++++++++++
 drivers/clk/actions/owl-s900.c                     | 585 +++++++++++++++++++++
 include/dt-bindings/clock/actions,s900-cmu.h       | 139 +++++
 13 files changed, 2035 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/actions,s900-cmu.txt
 create mode 100644 drivers/clk/actions/Kconfig
 create mode 100644 drivers/clk/actions/Makefile
 create mode 100644 drivers/clk/actions/owl-clk.c
 create mode 100644 drivers/clk/actions/owl-clk.h
 create mode 100644 drivers/clk/actions/owl-factor.c
 create mode 100644 drivers/clk/actions/owl-pll.c
 create mode 100644 drivers/clk/actions/owl-s900.c
 create mode 100644 include/dt-bindings/clock/actions,s900-cmu.h

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
