From: Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
Subject: [PATCH 0/4] Sony Xperia Z dts
Date: Thu, 22 Oct 2015 11:13:47 -0700
Message-ID: <1445537631-29055-1-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Gross <agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This series starts by adding hwspinlock, smem, gsbi5 and cleans up the
8064 regulator definitions.

Based on this it adds the necessary nodes for booting the Sony Xperia Z
(APQ8064 based) to userspace, with UART, eMMC, uSD, USB gadget and hw
buttons.

Bjorn Andersson (4):
  ARM: dts: qcom: apq8064: Add hwmutex and SMEM nodes
  ARM: dts: qcom: apq8064: Declare all pm8921 regulators
  ARM: dts: qcom: apq8064: Introduce gsbi5 and gsbi5 serial node
  ARM: dts: qcom: apq8064: Introduce Sony Xperia Z dts

 arch/arm/boot/dts/Makefile                         |   1 +
 arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts        |  16 +-
 arch/arm/boot/dts/qcom-apq8064-ifc6410.dts         |  20 +-
 .../arm/boot/dts/qcom-apq8064-sony-xperia-yuga.dts | 436 +++++++++++++++++++++
 arch/arm/boot/dts/qcom-apq8064.dtsi                |  97 +++++
 5 files changed, 552 insertions(+), 18 deletions(-)
 create mode 100644 arch/arm/boot/dts/qcom-apq8064-sony-xperia-yuga.dts

-- 
2.4.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
