From: Sarangdhar Joshi <spjoshi-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH v2 0/3] Remove clocks dependency from SCM driver
Date: Thu,  3 Nov 2016 17:10:34 -0700
Message-ID: <1478218237-1737-1-git-send-email-spjoshi@codeaurora.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Brown <david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Sarangdhar Joshi <spjoshi-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Trilok Soni <tsoni-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On earlier chiptsets (APQ8064, MSM8660, MSM8690, MSM8916,
APQ8084, MSM8974) crypto operations of TZ were depends on crypto
clocks controlled by users/clients. However on MSM8996 crypto clocks
control is handled internally in TZ itself. The current series of
patches handle this clock dependency in SCM driver.

Changes since v1:
- Added Rob's Acked-by
- Removed of_device_is_compatible check from probe (Stephen)
- Modified typecast to take care of 32-bit pointer

Sarangdhar Joshi (3):
  dt-bindings: firmware: scm: Add MSM8996 DT bindings
  firmware: qcom: scm: Remove core, iface and bus clocks dependency
  firmware: qcom: scm: Return PTR_ERR when devm_clk_get fails

 .../devicetree/bindings/firmware/qcom,scm.txt      |  2 +
 drivers/firmware/qcom_scm.c                        | 49 ++++++++++++++++------
 2 files changed, 39 insertions(+), 12 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
