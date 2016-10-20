From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V6 00/10] dmaengine: qcom_hidma: add MSI interrupt support
Date: Thu, 20 Oct 2016 15:18:38 +0530
Message-ID: <20161020094838.GY2467@localhost>
References: <1476899512-20431-1-git-send-email-okaya@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1476899512-20431-1-git-send-email-okaya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sinan Kaya <okaya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, cov-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Oct 19, 2016 at 01:51:42PM -0400, Sinan Kaya wrote:
> The new version of the HW supports MSI interrupts instead of wired
> interrupts. The MSI interrupts are especially useful for the guest machine
> execution. The wired interrupts usually trap to the hypervisor and then are
> relayed to the actual interrupt.
> 
> The MSI interrupts can be directly fed into the interrupt controller.
> 
> Adding a new OF compat string (qcom,hidma-1.1) and ACPI string (QCOM8062)
> to distinguish newer HW from the older ones.
> 
> v6:
> * rebase 4.9 kernel

Why???


I already told you that I have applied 6 in the last version, please dont
send me stuff which is already applied :(

-- 
~Vinod
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
