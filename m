From: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 0/4] arm: dts: qcom-apq8064: add smem and hwspinlock support
Date: Fri, 11 Dec 2015 18:26:49 +0000
Message-ID: <1449858409-13296-1-git-send-email-srinivas.kandagatla@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Andy, 

Here are 3 patches for smem/hwspinlock which I have tested with QDSP on IFC6410.
Also a fix from Ivan which I think can be taken aswell.

Thanks,
srini

Ivan T. Ivanov (1):
  ARM: dts: qcom: apq8064-ifc6410 Use hardware flow control for GSBI6

Srinivas Kandagatla (3):
  arm: dts: apq8064: add shared memory into dt reserved-memory
  arm: dts: apq8064: add hwspinlock nodes
  arm: dts: apq8064: add shared memory node

 arch/arm/boot/dts/qcom-apq8064-ifc6410.dts |  2 +-
 arch/arm/boot/dts/qcom-apq8064.dtsi        | 29 +++++++++++++++++++++++++++++
 2 files changed, 30 insertions(+), 1 deletion(-)

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
