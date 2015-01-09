From: Andy Gross <agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH 1/2] soc: qcom: Add TCSR driver
Date: Fri, 9 Jan 2015 11:13:56 -0600
Message-ID: <20150109171356.GC16970@qualcomm.com>
References: <1420757577-20425-1-git-send-email-agross@codeaurora.org>
 <1420757577-20425-2-git-send-email-agross@codeaurora.org>
 <4757751.7cLGsvPiZX@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4757751.7cLGsvPiZX@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jan 09, 2015 at 01:06:56AM +0100, Arnd Bergmann wrote:
> On Thursday 08 January 2015 16:52:56 Andy Gross wrote:
> > This patch adds support for the TCSR (Top Control and Status Register) IP block
> > that is present in the Qualcomm IPQ8064, APQ8064, and some later processors.
> > This block contains additional configuration and mux settings for various
> > peripherals in the system, including the ADM DMA block and USB controller.
> > 
> > Signed-off-by: Andy Gross <agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> > 
> 
> It sounds like this is a collection of random registers. Have you considered
> making it a syscon node instead?

That's a capital idea and solves my probe_defer issue more cleanly.  I'll rework
and resend.

-- 
Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
