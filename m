From: Sinan Kaya <okaya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH V3 01/10] Documentation: DT: qcom_hidma: update binding
 for MSI
Date: Fri, 23 Sep 2016 13:22:39 -0400
Message-ID: <92feb6b5-b9b9-394d-3cb6-d095df339ebc@codeaurora.org>
References: <1473960166-30155-1-git-send-email-okaya@codeaurora.org>
 <1473960166-30155-2-git-send-email-okaya@codeaurora.org>
 <20160923153910.GA23150@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160923153910.GA23150@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, cov-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 9/23/2016 11:39 AM, Rob Herring wrote:
>> Required properties:
>> > -- compatible: must contain "qcom,hidma-1.0"
>> > +- compatible: must contain "qcom,hidma-1.0" for initial HW or "qcom,hidma-1.1"
>> > +for MSI capable HW.
> Do you have an SoC part number yet? If so, please use that instead.
> 

Unfortunately, I have the same problem like "qcom, hidma-1.0". The SoC name is not settled
yet and same IP gets used in multiple SoCs. Each IP reports its own version number. This is
one of the reasons why I sticked to versioning instead of SoC name.

-- 
Sinan Kaya
Qualcomm Datacenter Technologies, Inc. as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
