From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH 0/6] mfd: axp20x: Add support for RSB based AXP223
Date: Thu, 15 Oct 2015 00:32:16 +0800
Message-ID: <1444840342-9233-1-git-send-email-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBB2MJ7KYAKGQEMOI34GI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi everyone,

This series adds support for the Reduced Serial Bus based AXP223 PMIC.
The AXP223 is functionally identical to the AXP221, which we already
support. Only some default values for the regulators are different.
The defaults fit their recommended application, paired with different
SoCs.

Patch 1 adds AXP223 to the list of supported chips in the DT binding.

Patch 2 splits the axp20x mfd driver into 2 parts, a core library, and
an I2C driver.

Patch 3 adds an RSB based driver for the AXP223.

Patch 4 adds support for the AXP223 regulators

Patch 5 adds the NMI interrupt controller to the sun8i dtsi. This is
chained to the GIC, and exposes an external NMI pin for the PMIC.

Patch 6 enables the AXP223 PMIC and its regulators for the Sinlinx
SinA33.

Another patch enabling the PMIC for the A23/A33 Q8 format tablets
is available, but I'll send it after I get the simplefb regulator
support merged. Otherwise the LCD would get powered down. The whole
branch is available at https://github.com/wens/linux/tree/axp223.

This series is a bit messy to merge. RSB support has just been merged
and is queued up for 4.4. It is available at

  https://git.kernel.org/pub/scm/linux/kernel/git/mripard/linux.git
  
  tags/sunxi-drivers-for-4.4

Patch 4 depends on patch 3 for the new ID, and RSB support, obviously.
And patch 3 depends on patch 2. I suppose with Lee's ack, Mark can
merge the tag above, or wait for 4.4-rc1, then the first 4 patches.


Regards
ChenYu


Chen-Yu Tsai (6):
  mfd: axp20x: Add AXP223 to list of supported PMICs in DT bindings
  mfd: axp20x: Split the driver into core and i2c bits
  mfd: axp20x: Add support for RSB based AXP223 PMIC
  regulator: axp20x: Support new AXP223 PMIC
  ARM: dts: sun8i: Add NMI interrupt controller node
  ARM: dts: sun8i: sinlinx-sina33: Add AXP223 PMIC device and regulator
    nodes

 Documentation/devicetree/bindings/mfd/axp20x.txt |   7 +-
 arch/arm/boot/dts/sun8i-a23-a33.dtsi             |   8 ++
 arch/arm/boot/dts/sun8i-a33-sinlinx-sina33.dts   |  79 +++++++++++++-
 drivers/mfd/Kconfig                              |  30 +++++-
 drivers/mfd/Makefile                             |   4 +-
 drivers/mfd/{axp20x.c => axp20x-core.c}          | 107 +++----------------
 drivers/mfd/axp20x-i2c.c                         | 127 +++++++++++++++++++++++
 drivers/mfd/axp20x-rsb.c                         |  93 +++++++++++++++++
 drivers/regulator/axp20x-regulator.c             |   3 +
 include/linux/mfd/axp20x.h                       |  34 +++++-
 10 files changed, 386 insertions(+), 106 deletions(-)
 rename drivers/mfd/{axp20x.c => axp20x-core.c} (87%)
 create mode 100644 drivers/mfd/axp20x-i2c.c
 create mode 100644 drivers/mfd/axp20x-rsb.c

-- 
2.6.1
