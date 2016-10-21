From: Sarangdhar Joshi <spjoshi-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH v3 0/4] MSM8996 DT Support for ADSP PIL
Date: Fri, 21 Oct 2016 16:19:15 -0700
Message-ID: <1477091959-19580-1-git-send-email-spjoshi@codeaurora.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Brown <david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Sarangdhar Joshi <spjoshi-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Trilok Soni <tsoni-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add various device tree nodes to lay the groundwork for
Qualcomm ADSP Peripheral Image Loader.

Sorry, I didn't send any cover letter for v1.

Changes since v2:
- Remove empty lines from smem DT node (Stephen)

Changes since v1:
- Move hwlock DT node under root (/) (Bjorn and Andy)
- Rename smp2p-adsp to adsp-smp2p (Bjorn)
- Remove interrupt-parent property from node (Bjorn)

Bjorn Andersson (1):
  arm64: dts: msm8996: Add SMEM DT nodes

Sarangdhar Joshi (3):
  arm64: dts: msm8996: Add SMEM reserve-memory node
  arm64: dts: msm8996: Add reserve-memory nodes
  arm64: dts: msm8996: Add SMP2P and APCS nodes

 arch/arm64/boot/dts/qcom/msm8996.dtsi | 82 +++++++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
