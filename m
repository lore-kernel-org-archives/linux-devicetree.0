From: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Subject: [PATCH v5 0/7] Allwinner H5 and Orange Pi PC2 support
Date: Sun, 26 Feb 2017 09:19:49 +0800
Message-ID: <20170226011956.53581-1-icenowy@aosc.xyz>
Reply-To: icenowy-ymACFijhrKM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCZLPFN5Q4OBBXO2ZDCQKGQEJORXO5Y-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Cc: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Allwinner H5 is a 64-bit SoC with a design like the 32-bit
H3.

This patchset adds support for it, along with the first available
board -- Orange Pi PC2.

Andre Przywara (3):
  arm: dts: sun8i: split Allwinner H3 .dtsi
  arm64: dts: allwinner: add Allwinner H5 .dtsi
  arm64: dts: sunxi: add support for the Orange Pi PC 2 board

Icenowy Zheng (4):
  arm64: allwinner: Kconfig: add essential pinctrl driver for H5
  clk: sunxi-ng: rename sun8i-h3 driver to sunxi-h3-h5
  clk: sunxi-ng: add support for Allwinner H5 SoC
  ARM: dts: sun8i: convert H3 dtsi to use new sunxi-h3-h5 binding header

 .../devicetree/bindings/clock/sunxi-ccu.txt        |   1 +
 arch/arm/boot/dts/sun8i-h3.dtsi                    | 589 ++-------------------
 arch/arm/boot/dts/sunxi-h3-h5.dtsi                 | 575 ++++++++++++++++++++
 arch/arm64/Kconfig.platforms                       |   5 +-
 arch/arm64/boot/dts/allwinner/Makefile             |   1 +
 .../boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts  | 164 ++++++
 arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi       | 139 +++++
 arch/arm64/boot/dts/allwinner/sunxi-h3-h5.dtsi     |   1 +
 drivers/clk/sunxi-ng/Kconfig                       |   6 +-
 drivers/clk/sunxi-ng/Makefile                      |   2 +-
 .../sunxi-ng/{ccu-sun8i-h3.c => ccu-sunxi-h3-h5.c} | 339 +++++++++++-
 .../sunxi-ng/{ccu-sun8i-h3.h => ccu-sunxi-h3-h5.h} |  13 +-
 .../clock/{sun8i-h3-ccu.h => sunxi-h3-h5-ccu.h}    |  11 +-
 .../reset/{sun8i-h3-ccu.h => sunxi-h3-h5-ccu.h}    |  11 +-
 14 files changed, 1277 insertions(+), 580 deletions(-)
 create mode 100644 arch/arm/boot/dts/sunxi-h3-h5.dtsi
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi
 create mode 120000 arch/arm64/boot/dts/allwinner/sunxi-h3-h5.dtsi
 rename drivers/clk/sunxi-ng/{ccu-sun8i-h3.c => ccu-sunxi-h3-h5.c} (71%)
 rename drivers/clk/sunxi-ng/{ccu-sun8i-h3.h => ccu-sunxi-h3-h5.h} (83%)
 rename include/dt-bindings/clock/{sun8i-h3-ccu.h => sunxi-h3-h5-ccu.h} (95%)
 rename include/dt-bindings/reset/{sun8i-h3-ccu.h => sunxi-h3-h5-ccu.h} (94%)

-- 
2.11.1
