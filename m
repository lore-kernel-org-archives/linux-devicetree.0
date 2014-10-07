From: Jacob Pan <jacob.jun.pan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: [PATCH v7 0/2] Initial support for XPowers AXP288 PMIC
Date: Mon,  6 Oct 2014 21:17:13 -0700
Message-ID: <1412655435-31284-1-git-send-email-jacob.jun.pan@linux.intel.com>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: IIO <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, DEVICE TREE <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, Srinivas Pandruvada <srinivas.pandruvada-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Aaron Lu <aaron.lu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Alan Cox <alan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Jean Delvare <khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Fugang Duan <B38611-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Zubair Lutfullah <zubair.lutfullah-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, Johannes Thumshirn <johannes.thumshirn-csrFAY9JiS4@public.gmane.org>, Philippe Reynes <tremyfr-Qt13gs6zZMY@public.gmane.org>, Angelo Compagnucci <angelo.compagnucci-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Ramakrishna Pallala <ramakrishna.pallala-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>Pete
List-Id: devicetree@vger.kernel.org

X-Powers AXP288 is a customized PMIC found on some Intel Baytrail-CR platforms.
It comes with sub-functions such as USB charging, fuel gauge, ADC, and many LDO
and BUCK channels.

By extending the existing AXP20x driver, this patchset adds basic support
for AXP288 PMIC with ADC as one MFD cell device driver.

Currently, the PMIC driver in this patchset does not support platform data
enumeration. But when ACPI _DSD and unified device properties become available,
cell devices with platform data will be added.

This patch does not use intel_soc_pmic core for i2c and regmap handling in that
axp288 shares similar programming interface with other X-Power PMICs supported in
axp20x.c. Therefore, extending axp20x.c to include axp288 makes more sense.

Changes
 v7:	- fix iio datasheet name

 v6:	- change axp20x_match_device() flow to give more specific error
 	  messages.
	- remove unnecessary cast

 v5:	- excluded iio documentation patch, already applied to iio.git
 	- restructured axp288_adc read_raw code to make it more readable
	- renamed adc_enable to adc_set_state and add comment about why adc
	  has to be always on and there is no disable function.
	- axp20x use const as needed for regmap structures

 v4:	- removed rename patch, use Kconfig description to list supported devices
 	- misc clean up in ADC code, use regmap_bulk_read and improve error
	  handling, etc.
	- remove IIO ADC scale, treat raw data as processed since the unit is
	  already in IIO expected milliamps.

 v3:	- put all file rename changes in 1/5
 	- add iio documentation for in_current_raw/scale
	- removed global variables in axp2xx
	- removed pm callbacks from GPADC
	- removed ACPI opregion cell device
	- added scales to ADC current and voltage
	- removed ADC thermal sensor from sysfs, kernel internal use only

 v2:
	- use format -M for 1/4
	- minor tweak based on Maxime's review


Jacob Pan (2):
  mfd/axp20x: extend axp20x to support axp288 pmic
  iio/adc: add support for axp288 adc

 drivers/iio/adc/Kconfig      |   8 +
 drivers/iio/adc/Makefile     |   1 +
 drivers/iio/adc/axp288_adc.c | 254 ++++++++++++++++++++++++++++++
 drivers/mfd/Kconfig          |   3 +-
 drivers/mfd/axp20x.c         | 361 ++++++++++++++++++++++++++++++++++++-------
 include/linux/mfd/axp20x.h   |  59 +++++++
 6 files changed, 630 insertions(+), 56 deletions(-)
 create mode 100644 drivers/iio/adc/axp288_adc.c

-- 
1.9.1
