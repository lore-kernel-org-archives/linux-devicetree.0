From: Jose Alarcon <jose.alarcon-JJi787mZWgc@public.gmane.org>
Subject: [PATCH v2 0/1] ARM: dts: imx6q-bx50v3: Enable i2c recovery mechanism
Date: Thu, 10 Aug 2017 13:42:28 +0300
Message-ID: <cover.1502360101.git.jose.alarcon@ge.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, romain.perier-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, nandor.han-JJi787mZWgc@public.gmane.org, Jose Alarcon <jose.alarcon-JJi787mZWgc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Enable i2c recovery for GE bx50v3 devices.

Changes since v1:
  * Add iomuxc in alphabetical order
  * Remove leading zeros in GPIO numbers

Jose Alarcon (1):
  ARM: dts: imx6q-bx50v3: Enable i2c recovery mechanism

 arch/arm/boot/dts/imx6q-bx50v3.dtsi | 42 +++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

-- 
2.10.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
