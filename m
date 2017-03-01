From: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Subject: [PATCH v6 0/4] Allwinner H5 and Orange Pi PC2 support
Date: Thu,  2 Mar 2017 04:13:38 +0800
Message-ID: <20170301201342.47583-1-icenowy@aosc.xyz>
Reply-To: icenowy-ymACFijhrKM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCZLPFN5Q4OBBFOX3TCQKGQEGKPY3VI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Cc: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Allwinner H5 is a 64-bit SoC with a design like the 32-bit
H3, and it's pin-to-pin compatible with H3.

This patchset adds support for it, along with the first available
board -- Orange Pi PC2.

Several H5 boards by Sinovoip Banana Pi and FriendlyARM Nano Pi
are coming, so we should get ready for them.

The rename of sun8i-h3-ccu driver is dropped in this version,
according to the recommendation by Maxime Ripard.

This patchset depends on patchset [1] to finally take effect. At
least the patch 1 of that patchset is needed if you want to test
the kernel image -- without it the pinctrl driver won't be built
and the kernel will become unusable without pinctrl.

[1] http://lists.infradead.org/pipermail/linux-arm-kernel/2017-March/490780.html

Andre Przywara (3):
  arm: dts: sun8i: split Allwinner H3 .dtsi
  arm64: dts: allwinner: add Allwinner H5 .dtsi
  arm64: dts: sunxi: add support for the Orange Pi PC 2 board

Icenowy Zheng (1):
  clk: sunxi-ng: add Allwinner H5 CCU support for H3 CCU driver

 .../devicetree/bindings/clock/sunxi-ccu.txt        |   1 +
 arch/arm/boot/dts/sun8i-h3.dtsi                    | 602 ++-------------------
 arch/arm/boot/dts/sunxi-h3-h5.dtsi                 | 586 ++++++++++++++++++++
 arch/arm64/boot/dts/allwinner/Makefile             |   1 +
 .../boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts  | 163 ++++++
 arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi       | 124 +++++
 arch/arm64/boot/dts/allwinner/sunxi-h3-h5.dtsi     |   1 +
 drivers/clk/sunxi-ng/Kconfig                       |   2 +-
 drivers/clk/sunxi-ng/ccu-sun8i-h3.c                | 327 ++++++++++-
 drivers/clk/sunxi-ng/ccu-sun8i-h3.h                |   3 +-
 include/dt-bindings/clock/sun8i-h3-ccu.h           |   5 +-
 include/dt-bindings/reset/sun8i-h3-ccu.h           |   5 +-
 12 files changed, 1247 insertions(+), 573 deletions(-)
 create mode 100644 arch/arm/boot/dts/sunxi-h3-h5.dtsi
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi
 create mode 120000 arch/arm64/boot/dts/allwinner/sunxi-h3-h5.dtsi

-- 
2.11.1
