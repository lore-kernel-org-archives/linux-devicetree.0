From: "Ivan T. Ivanov" <ivan.ivanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 0/2] arm64: dts: qcom: 8x16: UARTDM additions
Date: Fri, 18 Sep 2015 16:18:52 +0300
Message-ID: <1442582334-29387-1-git-send-email-ivan.ivanov@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Gross <agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stanimir Varbanov <stanimir.varbanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

This is second version of the changes previously posted [1].
I have to rebase them on top of Andy's for-next[2] branch and rework them
a little bit, because some of the definitions have been already merged.

Regards,
Ivan

[1] https://lkml.org/lkml/2015/9/12/114
[2] https://www.codeaurora.org/cgit/quic/kernel/agross-msm/

Ivan T. Ivanov (2):
  arm64: dts: qcom: 8x16: UART1 add CTS_N, RTS_N pin configurations
  arm64: dts: qcom: 8x16: UART1 and UART2 use DMA for RX and TX

 arch/arm64/boot/dts/qcom/msm8916-pins.dtsi | 13 +++++++++----
 arch/arm64/boot/dts/qcom/msm8916.dtsi      |  4 ++++
 2 files changed, 13 insertions(+), 4 deletions(-)

--
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
