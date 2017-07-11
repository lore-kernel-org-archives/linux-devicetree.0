From: Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH 0/2] Enable ADC support on STM32H7
Date: Tue, 11 Jul 2017 18:13:08 +0200
Message-ID: <1499789590-13021-1-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: alexandre.torgue-qxv4g6HH51o@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, fabrice.gasnier-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patchset adds ADC device-tree nodes to STM32H7 SoC and
enables ADC1 by default on stm32h743i-eval board.

Fabrice Gasnier (2):
  ARM: dts: stm32: add ADC support on stm32h7
  ARM: dts: stm32: enable ADC on stm32h743i-eval board

 arch/arm/boot/dts/stm32h743.dtsi      | 53 +++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/stm32h743i-eval.dts | 18 ++++++++++++
 2 files changed, 71 insertions(+)

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
