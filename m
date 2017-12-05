From: Sinan Kaya <okaya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH V5 1/7] Documentation: DT: qcom_hidma: Bump HW revision
 for the bugfixed HW
Date: Tue, 5 Dec 2017 12:13:06 -0500
Message-ID: <61d54e4c-5ec9-441e-07bf-598204d772c6@codeaurora.org>
References: <1512188864-773-1-git-send-email-okaya@codeaurora.org>
 <1512188864-773-2-git-send-email-okaya@codeaurora.org>
 <20171204221414.f5tphhn7gvlle3li@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171204221414.f5tphhn7gvlle3li@rob-hp-laptop>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 12/4/2017 5:14 PM, Rob Herring wrote:
> Hopefully 1.2 corresponds to some actual version numbering and not just 
> something you made up. I'd really rather have SoC based compatible 
> strings unless you have dozens of SoCs for each version. I'll probably 
> just say the same thing again when 1.3 or 2.0 gets added...
> 

No, these are coming from the HW. They are user visible. 

[  107.167207] hidma-mgmt QCOM8060:00: HW rev: 1.2 @ 0x0000ffff8b800000 with 6 physical channels

> Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Thanks

-- 
Sinan Kaya
Qualcomm Datacenter Technologies, Inc. as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
