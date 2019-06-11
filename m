From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: [PATCH v2 00/11] Support for Allwinner V3/S3L and
 Sochip S3
Date: Tue, 11 Jun 2019 22:09:29 +0800
Message-ID: <20190611140940.14357-1-icenowy@aosc.io>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBYXM73TQKGQEE5FZ2CQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patchset tries to add support for Allwinner V3/S3L and Sochip S3.

Allwinner V3/V3s/S3L and Sochip S3 share the same die, but with
different package. V3 is BGA w/o co-packaged DDR, V3s is QFP w/ DDR2,
S3L is BGA w/ DDR2 and S3 is BGA w/ DDR3. (S3 and S3L is compatible
for pinout, but because of different DDR, DDR voltage is different
between the two variants). Because of the pin count of V3s is
restricted due to the package, some pins are not bound on V3s, but
they're bound on V3/S3/S3L.

Currently the kernel is only prepared for the features available on V3s.
This patchset adds the features missing on V3s for using them on
V3/S3/S3L, and add bindings for V3/S3/S3L. It also adds a S3 SoM by
Sipeed, called Lichee Zero Plus.

Icenowy Zheng (11):
  dt-bindings: pinctrl: add missing compatible string for V3s
  dt-bindings: pinctrl: add compatible string for Allwinner V3 pinctrl
  pinctrl: sunxi: v3s: introduce support for V3
  clk: sunxi-ng: v3s: add the missing PLL_DDR1
  dt-bindings: clk: sunxi-ccu: add compatible string for V3 CCU
  clk: sunxi-ng: v3s: add Allwinner V3 support
  dt-bindings: vendor-prefixes: add SoChip
  ARM: sunxi: dts: s3/s3l/v3: add DTSI files for S3/S3L/V3 SoCs
  dt-bindings: vendor-prefixes: add Sipeed
  dt-bindings: arm: sunxi: add binding for Lichee Zero Plus core board
  ARM: dts: sun8i: s3: add devicetree for Lichee zero plus w/ S3

 .../devicetree/bindings/arm/sunxi.yaml        |   5 +
 .../clock/allwinner,sun4i-a10-ccu.yaml        |   1 +
 .../pinctrl/allwinner,sunxi-pinctrl.txt       |   2 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   4 +
 arch/arm/boot/dts/Makefile                    |   1 +
 .../boot/dts/sun8i-s3-lichee-zero-plus.dts    |   8 +
 .../dts/sun8i-s3-s3l-lichee-zero-plus.dtsi    |  39 +++
 arch/arm/boot/dts/sun8i-s3.dtsi               |   6 +
 arch/arm/boot/dts/sun8i-s3l.dtsi              |   6 +
 arch/arm/boot/dts/sun8i-v3.dtsi               |  14 +
 drivers/clk/sunxi-ng/ccu-sun8i-v3s.c          | 244 +++++++++++++++-
 drivers/clk/sunxi-ng/ccu-sun8i-v3s.h          |   6 +-
 drivers/pinctrl/sunxi/pinctrl-sun8i-v3s.c     | 265 +++++++++++++++++-
 drivers/pinctrl/sunxi/pinctrl-sunxi.h         |   2 +
 include/dt-bindings/clock/sun8i-v3s-ccu.h     |   4 +
 include/dt-bindings/reset/sun8i-v3s-ccu.h     |   3 +
 16 files changed, 597 insertions(+), 13 deletions(-)
 create mode 100644 arch/arm/boot/dts/sun8i-s3-lichee-zero-plus.dts
 create mode 100644 arch/arm/boot/dts/sun8i-s3-s3l-lichee-zero-plus.dtsi
 create mode 100644 arch/arm/boot/dts/sun8i-s3.dtsi
 create mode 100644 arch/arm/boot/dts/sun8i-s3l.dtsi
 create mode 100644 arch/arm/boot/dts/sun8i-v3.dtsi

-- 
2.21.0
