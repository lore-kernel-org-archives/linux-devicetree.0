From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH] clk: si5351: expand compatible strings in documentation
Date: Thu, 29 Jun 2017 17:21:13 -0700
Message-ID: <20170630002113.GE22780@codeaurora.org>
References: <1498743105-29078-1-git-send-email-brandon.streiff@ni.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1498743105-29078-1-git-send-email-brandon.streiff-acOepvfBmUk@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brandon Streiff <brandon.streiff-acOepvfBmUk@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

To is to nobody? Rob can apply it I suppose.

On 06/29, Brandon Streiff wrote:
> checkpatch.pl doesn't know how to expand "silabs,si5351{a,a-msop,b,c}"
> and so generates warnings about si5351-compatible devices appearing to
> be un-documented. Resolve this by documenting the compatible options
> supported by the clk-si5351 driver individually.
> 
> Signed-off-by: Brandon Streiff <brandon.streiff-acOepvfBmUk@public.gmane.org>
> ---

Acked-by: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
