From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: [PATCH 0/7] Allwinner A64 DE2 CCU support with
 dedicated DE2 bus driver
Date: Sat, 17 Mar 2018 01:53:47 +0800
Message-ID: <20180316175354.21437-1-icenowy@aosc.io>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDS6XAN6ZADRB64JWDKQKGQEQPN7GDI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patchset tries to implement the Allwinner A64 DE2 as a bus driver,
in order to model the fact that the SRAM claim controls the access to
the whole DE2 memory space.

PATCH 1 and PATCH 4 are for the CCU part.

PATCH 2 is the device tree binding for the A64 DE2 bus, and PATCH 3
implements the bus driver.

PATCH 5 is a modified version of A64 DE2 CCU patch, which uses the A64
DE2 bus.

PATCH 6 and 7 are just the simplefb patches for A64.

Icenowy Zheng (7):
  dt-bindings: add compatible string for the A64 DE2 CCU
  dt-bindings: add binding for the Allwinner A64 DE2 bus
  bus: add bus driver for accessing Allwinner A64 DE2
  clk: sunxi-ng: add A64 compatible string
  arm64: allwinner: a64: add DE2 CCU related device tree nodes
  arm64: allwinner: a64: add simplefb for A64 SoC
  arm64: allwinner: a64: add HDMI regulator to all DTs' simplefb_hdmi

 .../devicetree/bindings/bus/sun50i-de2-bus.txt     | 37 ++++++++++++
 .../devicetree/bindings/clock/sun8i-de2.txt        |  1 +
 .../boot/dts/allwinner/sun50i-a64-bananapi-m64.dts |  4 ++
 .../boot/dts/allwinner/sun50i-a64-nanopi-a64.dts   |  4 ++
 .../boot/dts/allwinner/sun50i-a64-olinuxino.dts    |  4 ++
 .../boot/dts/allwinner/sun50i-a64-orangepi-win.dts |  4 ++
 .../arm64/boot/dts/allwinner/sun50i-a64-pine64.dts |  4 ++
 .../dts/allwinner/sun50i-a64-sopine-baseboard.dts  |  4 ++
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi      | 68 ++++++++++++++++++++++
 drivers/bus/Kconfig                                | 10 ++++
 drivers/bus/Makefile                               |  1 +
 drivers/bus/sun50i-de2.c                           | 49 ++++++++++++++++
 drivers/clk/sunxi-ng/ccu-sun8i-de2.c               | 11 ++--
 13 files changed, 194 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/bus/sun50i-de2-bus.txt
 create mode 100644 drivers/bus/sun50i-de2.c

-- 
2.15.1
