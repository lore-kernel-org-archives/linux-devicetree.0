From: Rama Krishna Phani A <rphani-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH V3 0/2] iio: adc: spmi-vadc: Changes to support different scaling
Date: Wed, 26 Oct 2016 20:11:25 +0530
Message-ID: <1477492887-1663-1-git-send-email-rphani@codeaurora.org>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, smohanad-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mgautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, sivaa-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, Julia.Lawall-L2FTfq7BK8M@public.gmane.org, Rama Krishna Phani A <rphani-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

VADC is a 15 bit ADC that measures signals through the Main analog
multiplexer (AMUX). The driver arbitrates the request to issue ADC
read requests. These patches adds different scaling functionality
to convert adc code to physical units.

[V3]
	1. Update the commit text to give more information on the
	   functionality implemented in the patches.
	2. Added Dt maintainers.

[V2]
	1. Replaced the do_div with normal division.
	2. Split the functionality implemented in v1 patch.
	3. Abstracted out common logic and updated change to report
	   Raw adc code properly.
	4. Change to support different scaling functionality.
	5. Added support for introducing new bindings in driver.

[V1]
	https://lkml.org/lkml/2016/10/25/26

Rama Krishna Phani A (2):
  iio: adc: spmi-vadc: Update changes to support reporting of Raw adc
    code.
  iio: adc: spmi-vadc: Changes to support different scaling

 .../devicetree/bindings/iio/adc/qcom,spmi-vadc.txt |  14 +
 drivers/iio/adc/qcom-spmi-vadc.c                   | 311 ++++++++++++++++-----
 2 files changed, 261 insertions(+), 64 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
