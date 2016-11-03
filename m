From: "Koul, Vinod" <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V7 0/4] dmaengine: qcom_hidma: add MSI interrupt support
Date: Thu, 3 Nov 2016 13:17:29 +0000
Message-ID: <1478179048.6505.29.camel@intel.com>
References: <1477067879-23750-1-git-send-email-okaya@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-7"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1477067879-23750-1-git-send-email-okaya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Content-Language: en-US
Content-ID: <91DD0C4EB6484346B6FBAE7F01701494-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "okaya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <okaya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "cov-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <cov-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org" <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: "agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "arnd-r2nGTMty4D4@public.gmane.org" <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 2016-10-21 at 12:37 -0400, Sinan Kaya wrote:
+AD4- The new version of the HW supports MSI interrupts instead of wired
+AD4- interrupts. The MSI interrupts are especially useful for the guest
+AD4- machine
+AD4- execution. The wired interrupts usually trap to the hypervisor and
+AD4- then are
+AD4- relayed to the actual interrupt.
+AD4- 
+AD4- The MSI interrupts can be directly fed into the interrupt controller.
+AD4- 
+AD4- Adding a new OF compat string (qcom,hidma-1.1) and ACPI string
+AD4- (QCOM8062)
+AD4- to distinguish newer HW from the older ones.

Applied, thanks

-- 
+AH4-Vinod
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
