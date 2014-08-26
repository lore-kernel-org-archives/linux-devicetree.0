From: Georgi Djakov <gdjakov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v1 0/2] ARM: dts: qcom: Add initial IFC6540 board support
Date: Tue, 26 Aug 2014 18:39:36 +0300
Message-ID: <1409067578-30272-1-git-send-email-gdjakov@mm-sol.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org, Georgi Djakov <gdjakov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add basic support for the IFC6540 single-board computer boards, that are
based on the APQ8084 SoC. The first patch adds the initial device tree
and the second enables the serial console.

Should go through the qcom/arm-soc tree.

Georgi Djakov (2):
  ARM: dts: qcom: Add initial IFC6540 board device tree
  ARM: dts: qcom: Enable serial port on IFC6540 boards

 arch/arm/boot/dts/Makefile                 |    1 +
 arch/arm/boot/dts/qcom-apq8084-ifc6540.dts |   12 ++++++++++++
 2 files changed, 13 insertions(+)
 create mode 100644 arch/arm/boot/dts/qcom-apq8084-ifc6540.dts

-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
