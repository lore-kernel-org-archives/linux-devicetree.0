From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v4 1/3] clk: vc5: Add structure to describe particular
 chip features
Date: Wed, 19 Apr 2017 09:09:38 -0700
Message-ID: <20170419160938.GV7065@codeaurora.org>
References: <1491556344-9465-1-git-send-email-alexey_firago@mentor.com>
 <1491556344-9465-2-git-send-email-alexey_firago@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1491556344-9465-2-git-send-email-alexey_firago-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexey Firago <alexey_firago-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Cc: mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 04/07, Alexey Firago wrote:
> Introduce vc5_chip_info structure to describe features of a particular
> VC5 chip (id, number of FODs, number of outputs, flags).
> For now flags are only used to indicate if chip has internal XTAL.
> vc5_chip_info is set on probe from the matched of_device_id->data.
> 
> Also add defines to specify maximum number of FODs and clock outputs
> supported by the driver.
> 
> With these changes it should be easier to extend driver to support
> more VC5 models.
> 
> Signed-off-by: Alexey Firago <alexey_firago-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
