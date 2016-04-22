From: Harald Geyer <harald-95f8Dae0BrPYtjvyW6yDsg@public.gmane.org>
Subject: [PATCH 0/3] mxs-lradc: Add support for current sources
Date: Fri, 22 Apr 2016 13:52:24 +0000
Message-ID: <1461333147-11873-1-git-send-email-harald@ccbib.org>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Harald Geyer <harald-95f8Dae0BrPYtjvyW6yDsg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Patch 1/3 changes the driver and updates the binding documentation
(I guess it is still in staging.)

Patches 2/3 and 3/3 add the devicetree nodes to imx23 and imx28 boards.
I'd like to get input whether this is actually desired. On boards where
these regulators would never be enabled this costs a few extra bytes of
RAM for allocation of the device data, because the nodes can't be easily
removed in .dts files which are including the .dtsi files. The alternative
is to add the new nodes to many .dts files, which would be a lot code
duplication.

Harald Geyer (3):
  iio: mxs-lradc: Add regulators for current sources
  ARM: dts: imx23: Provide regulators for the current sources of the
    LRADC
  ARM: dts: imx28: Provide regulators for the current sources of the
    LRADC

 .../bindings/staging/iio/adc/mxs-lradc.txt         |  29 ++++
 arch/arm/boot/dts/imx23.dtsi                       |   8 ++
 arch/arm/boot/dts/imx28.dtsi                       |   8 ++
 drivers/iio/adc/Kconfig                            |   1 +
 drivers/iio/adc/mxs-lradc.c                        | 152 +++++++++++++++++++++
 5 files changed, 198 insertions(+)

-- 
2.1.4
