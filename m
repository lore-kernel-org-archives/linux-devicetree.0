From: Sanchayan Maity <maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 0/2] Implement sample time consideration for Vybrid's ADC
Date: Tue, 14 Jul 2015 19:23:21 +0530
Message-ID: <cover.1436880513.git.maitysanchayan@gmail.com>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, B38611-KZfg59tc24xl57MIdRCFDg@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stefan-XLVq0VzYD2Y@public.gmane.org, Sanchayan Maity <maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello,

This patchset adds a dt binding for specifying sample time
for the vybrid adc driver and takes this into account for
sampling frequency calculation and related configuration in
the driver.

The patchset is based on top of Stefan's patches here
http://lkml.iu.edu/hypermail/linux/kernel/1505.3/02043.html

which got recently applied.

Changes since v2:

- Use a default value of 1000ns for sample time in the driver
  if the property is not specified in the device tree.
- Specify the min-sample-time property in the board device tree
  file instead of the top level vfxxx.dtsi file for Vybrid

Changes since v1:

Change from a vendor specific fsl,min-sample-time to non vendor
specific min-sample-time.

Version 2 of the patchset can be found here
https://lkml.org/lkml/2015/6/24/97

Version 1 of the patchset can be found here
http://lkml.iu.edu/hypermail/linux/kernel/1506.1/00026.html

- Sanchayan.

Sanchayan Maity (2):
  iio: adc: vf610: Determine sampling frequencies by using minimum
    sample time
  ARM: dts: vf-colibri: Add property for minimum sample time

 .../devicetree/bindings/iio/adc/vf610-adc.txt      |  5 ++
 arch/arm/boot/dts/vf-colibri.dtsi                  |  2 +
 drivers/iio/adc/vf610_adc.c                        | 79 ++++++++++++++++++++--
 3 files changed, 82 insertions(+), 4 deletions(-)

-- 
2.4.5
