From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH v4 0/5] ARM: sunxi: Add Reduced Serial Bus support
Date: Thu, 24 Sep 2015 00:05:16 +0800
Message-ID: <1443024323-9115-1-git-send-email-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBB443ROYAKGQEFN4KHXY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, shuge-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi everyone,

This is my fourth attempt at adding support for Allwinner's Reduced
Serial Bus (RSB), which is used to communicate with PMICs and other
peripherals on their newer SoCs, such as the A23/A33/A80.

RSB is a simplified two wire interface using push-pull outputs,
supporting multiple slaves, address and data parity checks, and
clock speeds up to 20 MHz. The bus only supports simple register
read/writes, with possible register sizes of 8/16/32 bits. Access
sizes not matching the slave device register sizes result in NACKs
or errors. 32 bit registers in devices have yet to be seen.

Previous attempts to add support through the I2C subsystem have
been rejected, as the bus line protocol is too different to even
consider. The latest attempt to add a common bus driver was also
rejected as this is sunxi only.

This version adds a platform driver for the RSB controller under
drivers/soc/sunxi, which adds a custom driver type and bus type
for slave drivers to use. Custom regmap support is also merged
into the controller driver. Currently the driver only exports 2
symbols: sunxi_rsb_driver_register() & devm_regmap_init_sunxi_rsb().

Patch 1 adds the DT bindings for Allwinner RSB controller.

Patch 2 adds the driver itself.

Patch 3 adds the RSB nodes for A23/A33 dtsi.

Patch 5 & 5 enable the RSB controller on the boards I have.

Still to come are axp20x driver support for the RSB based AXP223.
The complete series can be found at:

    https://github.com/wens/linux/tree/sunxi-rsb-v4

This is now sunxi specific, so if everything works out, it should
all go through Maxime's tree?


Regards,
ChenYu

Chen-Yu Tsai (5):
  soc: sunxi: Add Allwinner Reduced Serial Bus (RSB) controller bindings
  soc: sunxi: Add driver for Allwinner Reduced Serial Bus
  ARM: dts: sun8i: Add Reduced Serial Bus controller device node to
    A23/A33 dtsi
  ARM: dts: sun8i: ippo-q8h-v5: Enable Reduced Serial Bus controller
  ARM: dts: sun8i: sinlinx-sina33: Enable Reduced Serial Bus controller

 .../devicetree/bindings/soc/sunxi/rsb.txt          |  47 ++
 arch/arm/boot/dts/sun8i-a23-a33.dtsi               |  21 +
 arch/arm/boot/dts/sun8i-a23-ippo-q8h-v5.dts        |   4 +
 arch/arm/boot/dts/sun8i-a33-sinlinx-sina33.dts     |   4 +
 drivers/soc/sunxi/Kconfig                          |  10 +
 drivers/soc/sunxi/Makefile                         |   1 +
 drivers/soc/sunxi/sunxi_rsb.c                      | 786 +++++++++++++++++++++
 include/linux/soc/sunxi/sunxi_rsb.h                |  89 +++
 8 files changed, 962 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/sunxi/rsb.txt
 create mode 100644 drivers/soc/sunxi/sunxi_rsb.c
 create mode 100644 include/linux/soc/sunxi/sunxi_rsb.h

-- 
2.5.3
