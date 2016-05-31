From: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH 0/3] ARM: dts: Use generic uart-has-rtscts DT property
Date: Tue, 31 May 2016 16:31:49 +0200
Message-ID: <1464705112-21609-1-git-send-email-geert+renesas@glider.be>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Barry Song <baohua-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

	Hi Shawn, Sascha, Barry,

As of v4.7-rc1, the Freescale MXS AUART and IMX UART drivers, and the
SiRF UART driver, recognize the generic "uart-has-rtscts" DT property,
deprecating the vendor-specific "<vendor>,uart-has-rtscts" DT
properties.  This series updates all DTS files to replace the latter by
the former.

Thanks for applying!

Geert Uytterhoeven (3):
  ARM: dts: imx28: Use generic uart-has-rtscts DT property
  ARM: dts: imx: Use generic uart-has-rtscts DT property
  ARM: dts: atlas7: Use generic uart-has-rtscts DT property

 arch/arm/boot/dts/atlas7-evb.dts                       | 2 +-
 arch/arm/boot/dts/imx1-ads.dts                         | 4 ++--
 arch/arm/boot/dts/imx1-apf9328.dts                     | 4 ++--
 arch/arm/boot/dts/imx25-eukrea-mbimxsd25-baseboard.dts | 4 ++--
 arch/arm/boot/dts/imx25-pdk.dts                        | 2 +-
 arch/arm/boot/dts/imx27-eukrea-cpuimx27.dtsi           | 2 +-
 arch/arm/boot/dts/imx27-eukrea-mbimxsd27-baseboard.dts | 6 +++---
 arch/arm/boot/dts/imx27-pdk.dts                        | 2 +-
 arch/arm/boot/dts/imx27-phytec-phycard-s-rdk.dts       | 6 +++---
 arch/arm/boot/dts/imx27-phytec-phycore-rdk.dts         | 4 ++--
 arch/arm/boot/dts/imx28-apf28dev.dts                   | 2 +-
 arch/arm/boot/dts/imx28-evk.dts                        | 2 +-
 arch/arm/boot/dts/imx31-bug.dts                        | 2 +-
 arch/arm/boot/dts/imx35-eukrea-mbimxsd35-baseboard.dts | 4 ++--
 arch/arm/boot/dts/imx35-pdk.dts                        | 2 +-
 arch/arm/boot/dts/imx51-babbage.dts                    | 4 ++--
 arch/arm/boot/dts/imx51-eukrea-mbimxsd51-baseboard.dts | 4 ++--
 arch/arm/boot/dts/imx53-smd.dts                        | 2 +-
 arch/arm/boot/dts/imx53-tqma53.dtsi                    | 2 +-
 arch/arm/boot/dts/imx53-tx53.dtsi                      | 6 +++---
 arch/arm/boot/dts/imx6q-arm2.dts                       | 2 +-
 arch/arm/boot/dts/imx6q-ba16.dtsi                      | 2 +-
 arch/arm/boot/dts/imx6qdl-apalis.dtsi                  | 4 ++--
 arch/arm/boot/dts/imx6qdl-apf6dev.dtsi                 | 2 +-
 arch/arm/boot/dts/imx6qdl-aristainetos.dtsi            | 4 ++--
 arch/arm/boot/dts/imx6qdl-aristainetos2.dtsi           | 4 ++--
 arch/arm/boot/dts/imx6qdl-microsom.dtsi                | 2 +-
 arch/arm/boot/dts/imx6qdl-nit6xlite.dtsi               | 2 +-
 arch/arm/boot/dts/imx6qdl-tx6.dtsi                     | 6 +++---
 arch/arm/boot/dts/imx6qdl-wandboard.dtsi               | 2 +-
 arch/arm/boot/dts/imx6sl-warp.dts                      | 2 +-
 arch/arm/boot/dts/imx6sx-nitrogen6sx.dts               | 2 +-
 arch/arm/boot/dts/imx6sx-sdb.dtsi                      | 2 +-
 arch/arm/boot/dts/imx6ul-14x14-evk.dts                 | 2 +-
 arch/arm/boot/dts/imx6ul-pico-hobbit.dts               | 2 +-
 arch/arm/boot/dts/imx6ul-tx6ul-mainboard.dts           | 4 ++--
 arch/arm/boot/dts/imx6ul-tx6ul.dtsi                    | 6 +++---
 arch/arm/boot/dts/imx7d-nitrogen7.dts                  | 2 +-
 38 files changed, 59 insertions(+), 59 deletions(-)

-- 
1.9.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
