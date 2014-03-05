From: Adam Thomson <Adam.Thomson.Opensource-WBD+wuPFNBhBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v2 0/2] mfd: da9055: Add DT support & documentation for PMIC
Date: Wed, 5 Mar 2014 14:18:32 +0000
Message-ID: <cover.1394018471.git.Adam.Thomson.Opensource@diasemi.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch set adds DT support for the MFD core of the da9055 PMIC, and adds
the accompanying DT binding documentation for the device.

v2: Small tidy-ups to documentation (remove new-line, use IRQ related defines)

Adam Thomson (2):
  mfd: da9055: Add DT support for PMIC
  mfd: da9055: Add DT binding documentation for PMIC

 Documentation/devicetree/bindings/mfd/da9055.txt |   72 ++++++++++++++++++++++
 drivers/mfd/da9055-i2c.c                         |    8 +++
 2 files changed, 80 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/da9055.txt

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
