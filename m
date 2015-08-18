From: Mathieu Olivari <mathieu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH 0/2] ARM: qcom: enable console output on IPQ806x
Date: Tue, 18 Aug 2015 15:05:36 -0700
Message-ID: <1439935538-13932-1-git-send-email-mathieu@codeaurora.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mathieu Olivari <mathieu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This change set adds uart nodes in ipq806x dtsi and add the chosen node
in AP148 dts file to use it as a console.

Mathieu Olivari (2):
  ARM: qcom: add uart labels to IPQ806x dts
  ARCH: qcom: enable uart output by default on AP148

 arch/arm/boot/dts/qcom-ipq8064-ap148.dts |  8 ++++++++
 arch/arm/boot/dts/qcom-ipq8064.dtsi      | 15 +++++++++------
 2 files changed, 17 insertions(+), 6 deletions(-)

-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
