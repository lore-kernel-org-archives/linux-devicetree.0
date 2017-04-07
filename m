From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v4 0/3] clk: Add support for IDT 5P49V5935
Date: Fri, 7 Apr 2017 12:40:13 -0700
Message-ID: <20170407194013.GD7065@codeaurora.org>
References: <1491556344-9465-1-git-send-email-alexey_firago@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1491556344-9465-1-git-send-email-alexey_firago-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexey Firago <alexey_firago-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Cc: mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 04/07, Alexey Firago wrote:
> This series adds support for IDT VersaClock 5P49V5935 programmable clock
> generator to the existing clk-versaclock5 driver. Driver is also updated to
> simplify addition of support for more VersaClock 5 models. 
> 
> Patches were verified on Avnet UltraZed-EG board with IO Carrier Card.
> 
> Changes in V2:
> - Introduce vc5_chip_info structure describing chip features
> - Set vc5_chip_info for the supported chips using clk_vc5_of_match[].data
> - Add 5P49V5935 support using vc5_chip_info approach
> - Fix idx comparison in vc5_of_clk_get ('>' to '>=')
> 
> Changes in V3:
> - Change type of clk_fod_cnt and clk_out_cnt to unsigned int
> - Add missed 'const' to vc5_chip_info instance declaration
> - Use of_device_get_match_data() to initialize vc5_chip_info on probe 
> 
> Changes in V4:
> - Add 'const' to vc5_chip_info.flags

Could any Reviewed-by tags get carried over? I'll wait for Marek
to resend them I guess.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
