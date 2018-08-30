From: Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 00/30] IIO-based thermal sensor driver for
 Allwinner H3 and A83T SoC
Date: Thu, 30 Aug 2018 17:44:48 +0200
Message-ID: <20180830154518.29507-1-embed3d@gmail.com>
Reply-To: embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBD257DPK24NRBEFCUDOAKGQETQNG6IA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, eugen.hristev-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, vilhelm.gray-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, quentin.schulz-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, lukas-JFq808J9C/izQB+pC5nmwQ@public.gmane.org, icenowy-h8G6r0blFSE@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, arnaud.pouliquen-qxv4g6HH51o@public.gmane.org
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Allwiner H3 and A83T SoCs have a thermal sensor, which is a large refactored
version of the old Allwinner "GPADC" (although it have already only
thermal part left in A33).

This patch tried to add support for the sensor in H3 and A83T based on

This Patchtseries was in the beginning based on Icenowy Zengs v4 patchseries [1]. Since we decided to merge the mfd driver into the GPADC this changed. So only one patch could be reused.

Patches that adds support for H5, A64, A80 and H6 SoCs are allready prepared,
and will be upstreamed if this patchseries is applied and the testing is done.

Sorry for delaying this.

Regards,
Philipp 

changes since v2:
	* mfd driver is now merged into the gpadc driver
	* complete rework

changes since v1:
	* collecting all acks 
	* rewording commits/fix typos
	* move code in place where it is used
	* fix naming conventions of defines
	* clarify commits
	* update documentation to cover the new nvmem calibraion
	* change nvmem calibration



Icenowy Zheng (1):
  iio: adc: sun4i-gpadc-iio: rename A33-specified registers to contain
    A33

Philipp Rossak (29):
  mfd: Makefile: Remove build option for MFD:sun4i-gpadc
  mfd: Kconfig: Remove MFD_SUN4I_GPADC config option
  iio: adc: Remove ID table
  iio: adc: Kconfig: Update Kconfig to new build options
  iio: adc: move SUN4I_GPADC_CHANNEL define to header file
  iio: adc: remove ofnode options
  iio: adc: remove mfd_probe & sunwi_irq_init function
  iio: adc: remove hwmon structure
  iio: adc: Threat A33 as thermal sensor and remove non thermal sun4i
    channel
  iio: adc: rework irq and adc_channel handling
  iio: adc: add new compatibles
  mfd: Remove old mfd driver & Move sun4i-gpadc.h to iio/adc/
  arm: config: Enable SUN4I_GPADC in defconfig
  dt-bindings: update the Allwinner GPADC device tree binding for H3 &
    A83T
  iio: adc: sun4i-gpadc-iio: rework: readout temp_data
  iio: adc: sun4i-gpadc-iio: rework: support clocks and reset
  iio: adc: sun4i-gpadc-iio: rework: support multiple sensors
  iio: adc: sun4i-gpadc-iio: rework: support nvmem calibration data
  iio: adc: sun4i-gpadc-iio: rework: device specific suspend & resume
  iio: adc: sun4i-gpadc-iio: add support for H3 thermal sensor
  iio: adc: sun4i-gpadc-iio: add support for A83T thermal sensor
  ARM: dts: sunxi-h3-h5: add support for the thermal sensor in H3 and H5
  ARM: dts: sun8i: h3: add support for the thermal sensor in H3
  ARM: dts: sun8i: h3: add thermal zone to H3
  ARM: dts: sun8i: h3: enable H3 sid controller
  ARM: dts: sun8i: h3: use calibration for ths
  ARM: dts: sun8i: a83t: add support for the thermal sensor in A83T
  ARM: dts: sun8i: a83t: add thermal zone to A83T
  ARM: sun8i: a83t: full range OPP tables and CPUfreq

 .../devicetree/bindings/iio/adc/sun4i-gpadc.txt    |  41 +-
 arch/arm/boot/dts/sun8i-a83t.dtsi                  | 143 +++++
 arch/arm/boot/dts/sun8i-h3.dtsi                    |  52 ++
 arch/arm/boot/dts/sunxi-h3-h5.dtsi                 |  10 +
 arch/arm/configs/sunxi_defconfig                   |   1 +
 drivers/iio/adc/Kconfig                            |  11 +-
 drivers/iio/adc/sun4i-gpadc-iio.c                  | 617 +++++++++++++--------
 drivers/mfd/Kconfig                                |  17 -
 drivers/mfd/Makefile                               |   1 -
 drivers/mfd/sun4i-gpadc.c                          | 181 ------
 include/linux/{mfd => iio/adc}/sun4i-gpadc.h       |  47 +-
 11 files changed, 681 insertions(+), 440 deletions(-)
 delete mode 100644 drivers/mfd/sun4i-gpadc.c
 rename include/linux/{mfd => iio/adc}/sun4i-gpadc.h (72%)

-- 
2.11.0
