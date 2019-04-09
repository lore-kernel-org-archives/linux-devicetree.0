From: megous via linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Subject: [PATCH v2 00/13] Add support for Orange Pi 3
Date: Tue,  9 Apr 2019 02:24:39 +0200
Message-ID: <20190409002452.14551-1-megous@megous.com>
Reply-To: megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDXLF6FR5INBBWWMV7SQKGQE7UWWADI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Giuseppe Cavallaro <peppe.cavallaro-qxv4g6HH51o@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Jose Abreu <joabreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arend van Spriel <arend.vanspriel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Franky Lin <franky.lin-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Hante Meuleman <hante.meuleman-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Chi-Hsien Lin <chi-hsien.lin-+wT8y+m8/X5BDgjK7y7TUQ@public.gmane.org>, Wright Feng <wright.feng-+wT8y+m8/X5BDgjK7y7TUQ@public.gmane.org>, Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Naveen Gupta <naveen.gupta-+wT8y+m8/X5BDgjK7y7TUQ@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-stm32-XDFAJ8BFU24N7RejjzZ/Li2xQDfSxrLKVpNB7YpNyf8@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, brcm802
List-Id: devicetree@vger.kernel.org

From: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>

This series implements support for Xunlong Orange Pi 3 board.

Unfortunately, this board needs some small driver patches, so I have
split the boards DT patch into chunks that require patches for drivers
in various subsystems.

In v2 of this series I've reordered the patches and I've put less
controversial patches first.

Suggested merging plan/dependencies:

- Basic board dts can work alone. (patches 1-2)
- Pinctrl and stmmac patches are needed for ethernet support.
  (patches 3-7)
- HDMI depends on sorting out how to model DDC voltage shifter
  in DT, which is not clear yet. (patches 8-10)
- WiFi stuff will have to wait for H6 RTC patches, which in turn
  depend on ChenYu's RTC series, to be merged. That will take a
  while yet. I'm just keeping them in the series for completness.
  (patches 11-13)

This patch is also needed to not get segfault on boot (it was already
merged a day ago or so): 
  https://lkml.org/lkml/2019/4/5/856

Changes in v2:
- added dt-bindings documentation for the board's compatible string
  (suggested by Clement)
- addressed checkpatch warnings and code formatting issues (on Maxime's
  suggestions)
- stmmac: dropped useless parenthesis, reworded description of the patch
  (suggested by Sergei)
- drop useles dev_info() about the selected io bias voltage
- docummented io voltage bias selection variant macros
- wifi: marked WiFi DTS patch and realted mmc1_pins as "DO NOT MERGE",
  because wifi depends on H6 RTC support that's not merged yet (suggested
  by Clement)
- added missing signed-of-bys
- changed &usb2otg dr_mode to otg, and added a note about VBUS
- improved wording of HDMI driver's DDC power supply patch

Open questions ATM:
- should mmc1_pins be default pinconf for mmc1?
- how to model DDC IO voltage shifter enable signal for HDMI? (it's not
  really a power supply, but it's modelled as one in the patches for now)


Please take a look.

thank you and regards,
  Ondrej Jirman

Icenowy Zheng (2):
  net: stmmac: sun8i: add support for Allwinner H6 EMAC
  net: stmmac: sun8i: force select external PHY when no internal one

Ondrej Jirman (11):
  dt-bindings: sunxi: Add compatible for OrangePi 3 board
  arm64: dts: allwinner: h6: Add Orange Pi 3 DTS
  pinctrl: sunxi: Prepare for alternative bias voltage setting methods
  pinctrl: sunxi: Support I/O bias voltage setting on H6
  arm64: dts: allwinner: orange-pi-3: Enable ethernet
  drm: sun4i: Add support for enabling DDC I2C bus to dw_hdmi glue
  dt-bindings: display: sun4i-drm: Add DDC power supply
  arm64: dts: allwinner: orange-pi-3: Enable HDMI output
  brcmfmac: Loading the correct firmware for brcm43456
  [DO NOT MERGE] arm64: dts: allwinner: h6: Add MMC1 pins
  [DO NOT MERGE] arm64: dts: allwinner: orange-pi-3: Enable WiFi

 .../devicetree/bindings/arm/sunxi.yaml        |   5 +
 .../bindings/display/sunxi/sun4i-drm.txt      |   1 +
 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../dts/allwinner/sun50i-h6-orangepi-3.dts    | 343 ++++++++++++++++++
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi  |   8 +
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c         |  17 +-
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h         |   1 +
 .../net/ethernet/stmicro/stmmac/dwmac-sun8i.c |  21 ++
 .../broadcom/brcm80211/brcmfmac/sdio.c        |   4 +-
 drivers/pinctrl/sunxi/pinctrl-sun50i-h6.c     |   1 +
 drivers/pinctrl/sunxi/pinctrl-sun9i-a80.c     |   2 +-
 drivers/pinctrl/sunxi/pinctrl-sunxi.c         |  49 ++-
 drivers/pinctrl/sunxi/pinctrl-sunxi.h         |   9 +-
 13 files changed, 441 insertions(+), 21 deletions(-)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts

-- 
2.21.0
