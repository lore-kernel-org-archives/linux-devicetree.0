From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v3 0/4] ARM: sunxi: SRAM mapping support
Date: Sun, 31 May 2015 11:15:04 +0200
Message-ID: <1433063708-11726-1-git-send-email-maxime.ripard@free-electrons.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBVFEVOVQKGQEWFMT7WI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

The Allwinner SoCs all have a bunch of SRAMs (the exact number
depending on the SoC itself) that can have various sections mapped to
the CPU or to a bunch of devices, each section having different
possible devices to be mapped to.

Since this SRAM setup is highly SoC dependent, and that we could have
multiple drivers trying to map a section for their own use, relying on
syscon would put to much duplicated logic to devices that are using
these SRAMs, among which the USB OTG and EMAC controllers, while not
guaranteeing any kind of exclusive use of that section.

To do this, we introduce a custom API to control the mapping of the
sections in a SoC independent way, and a SoC driver to implement it.

Let me know what you think,
Maxime

Changes from v2:
  - Changed the DT bindings to have an explicit relationship between
    "client" devices, the controller, and the SRAM sections it
    controls
  - Changed the interface to not rely on private structures anymore
    but only the client's struct device
  - Fixed a bug in the claiming logic

Maxime Ripard (4):
  drivers: soc: sunxi: Introduce SoC driver to map SRAMs
  ARM: dts: sun4i: Add A10 SRAM and SRAM controller
  ARM: dts: sun5i: Add A10s and A13 SRAM and SRAM controller
  ARM: dts: sun7i: Add A20 SRAM and SRAM controller

 .../devicetree/bindings/soc/sunxi/sram.txt         |  72 ++++++
 arch/arm/boot/dts/sun4i-a10-a1000.dts              |   4 +
 arch/arm/boot/dts/sun4i-a10-ba10-tvbox.dts         |   4 +
 arch/arm/boot/dts/sun4i-a10-cubieboard.dts         |   4 +
 arch/arm/boot/dts/sun4i-a10-hackberry.dts          |   4 +
 arch/arm/boot/dts/sun4i-a10-jesurun-q5.dts         |   4 +
 arch/arm/boot/dts/sun4i-a10-marsboard.dts          |   4 +
 arch/arm/boot/dts/sun4i-a10-olinuxino-lime.dts     |   4 +
 arch/arm/boot/dts/sun4i-a10-pcduino.dts            |   4 +
 arch/arm/boot/dts/sun4i-a10.dtsi                   |  37 +++
 arch/arm/boot/dts/sun5i-a10s-olinuxino-micro.dts   |   4 +
 arch/arm/boot/dts/sun5i-a10s.dtsi                  |   9 +
 arch/arm/boot/dts/sun5i.dtsi                       |  30 +++
 arch/arm/boot/dts/sun7i-a20.dtsi                   |  37 +++
 drivers/soc/Kconfig                                |   1 +
 drivers/soc/Makefile                               |   1 +
 drivers/soc/sunxi/Kconfig                          |  10 +
 drivers/soc/sunxi/Makefile                         |   1 +
 drivers/soc/sunxi/sunxi_sram.c                     | 284 +++++++++++++++++++++
 include/linux/soc/sunxi/sunxi_sram.h               |  19 ++
 20 files changed, 537 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/sunxi/sram.txt
 create mode 100644 drivers/soc/sunxi/Kconfig
 create mode 100644 drivers/soc/sunxi/Makefile
 create mode 100644 drivers/soc/sunxi/sunxi_sram.c
 create mode 100644 include/linux/soc/sunxi/sunxi_sram.h

-- 
2.4.1
