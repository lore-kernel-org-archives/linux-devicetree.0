From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH V6 2/6] dt-bindings: qcom: clocks: Add msm8994 clock
 bindings
Date: Thu, 10 Nov 2016 14:31:33 -0800
Message-ID: <20161110223133.GI16026@codeaurora.org>
References: <1478292996-29559-1-git-send-email-jeremymc@redhat.com>
 <1478292996-29559-3-git-send-email-jeremymc@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1478292996-29559-3-git-send-email-jeremymc-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jeremy McNicoll <jeremymc-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mail-LJ92rlH3Dns@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, michael.scott-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 11/04, Jeremy McNicoll wrote:
> Signed-off-by: Jeremy McNicoll <jeremymc-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---

Applied to clk-qcom-8994 in clk tree.

> +
> +/* Indexes for GDSCs */
> +#define BIMC_GDSC				0
> +#define VENUS_GDSC				1
> +#define MDSS_GDSC				2
> +#define JPEG_GDSC				3
> +#define VFE_GDSC				4
> +#define OXILI_GDSC				5
> +

But I removed these because it's copy/paste from 8916 and that is
a different family of chips than 8994 so these GDSCs aren't in
GCC on 8994.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
