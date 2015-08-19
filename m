From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH v3 0/8] ARM: sunxi: Add Reduced Serial Bus support
Date: Wed, 19 Aug 2015 12:20:01 +0800
Message-ID: <1439958009-14056-1-git-send-email-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBGEI2CXAKGQEK4UZRYQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Meng Zhang <kevin-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org>, shuge-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org, kevin.z.m.zh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi everyone,

This is my third attempt at adding support for Allwinner's Reduced
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
consider. In this version, RSB is implemented as a new bus type,
much like SPMI.

Even though there will almost certainly be only one RSB driver,
it's still split into the bus core framework and vendor specific
driver, like other subsystems. Theoretically someone could
implement a bit-banging driver for it.


Patches 1 & 2 add the DT bindings for common RSB properties and
the controller.

Patches 3 & 4 add the RSB framework core and sunxi driver.

Patch 5 (based on regmap/for-next) adds an RSB regmap driver.

Patch 6 adds the RSB nodes for A23/A33 dtsi.

Patch 7 & 8 enable the RSB controller on the boards I have.


Still to come are axp20x driver support for the RSB based AXP223.
The complete series can be found at:

    https://github.com/wens/linux/tree/sunxi-rsb-v3

Since this is a new subsystem, I'm not sure who should pick up
the first 4 patches, or whether they are even in the right place.
Any suggestions?


Regards,
ChenYu


Chen-Yu Tsai (8):
  rsb: Add generic Reduced Serial Bus (RSB) controller binding
    documentation
  rsb: sunxi: Add Allwinner Reduced Serial Bus (RSB) controller bindings
  rsb: Linux driver framework for Reduced Serial Bus (RSB)
  rsb: sunxi: Add driver for Allwinner Reduced Serial Bus controller
  regmap: rsb: Add support for Reduced Serial Bus (RSB) based regmaps
  ARM: dts: sun8i: Add Reduced Serial Bus controller device node to
    A23/A33 dtsi
  ARM: dts: sun8i: ippo-q8h-v5: Enable Reduced Serial Bus controller
  ARM: dts: sun8i: sinlinx-sina33: Enable Reduced Serial Bus controller

 .../devicetree/bindings/rsb/rsb-sunxi.txt          |  34 ++
 Documentation/devicetree/bindings/rsb/rsb.txt      |  50 ++
 arch/arm/boot/dts/sun8i-a23-a33.dtsi               |  21 +
 arch/arm/boot/dts/sun8i-a23-ippo-q8h-v5.dts        |   4 +
 arch/arm/boot/dts/sun8i-a33-sinlinx-sina33.dts     |   4 +
 drivers/Kconfig                                    |   2 +
 drivers/Makefile                                   |   1 +
 drivers/base/regmap/Kconfig                        |   6 +-
 drivers/base/regmap/Makefile                       |   1 +
 drivers/base/regmap/regmap-rsb.c                   | 121 +++++
 drivers/rsb/Kconfig                                |  26 ++
 drivers/rsb/Makefile                               |   6 +
 drivers/rsb/rsb-core.c                             | 511 +++++++++++++++++++++
 drivers/rsb/rsb-sunxi.c                            | 441 ++++++++++++++++++
 include/linux/regmap.h                             |  36 ++
 include/linux/rsb.h                                | 144 ++++++
 16 files changed, 1407 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/rsb/rsb-sunxi.txt
 create mode 100644 Documentation/devicetree/bindings/rsb/rsb.txt
 create mode 100644 drivers/base/regmap/regmap-rsb.c
 create mode 100644 drivers/rsb/Kconfig
 create mode 100644 drivers/rsb/Makefile
 create mode 100644 drivers/rsb/rsb-core.c
 create mode 100644 drivers/rsb/rsb-sunxi.c
 create mode 100644 include/linux/rsb.h

-- 
2.5.0
