From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v3 4/7] clk: qcom: ipq4019: Added all the frequencies for
 apps cpu
Date: Tue, 1 Nov 2016 18:24:50 -0700
Message-ID: <20161102012450.GD16026@codeaurora.org>
References: <1474460512-31994-1-git-send-email-absahu@codeaurora.org>
 <1474460512-31994-5-git-send-email-absahu@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1474460512-31994-5-git-send-email-absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Abhishek Sahu <absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, pradeepb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mmcclint-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, varada-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, sricharan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, ntelkar-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 09/21, Abhishek Sahu wrote:
> The APPS CPU clock does not contain all the frequencies in its
> frequency table so this patch adds the same.
> 
> Signed-off-by: Abhishek Sahu <absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> ---
>  drivers/clk/qcom/gcc-ipq4019.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/gcc-ipq4019.c b/drivers/clk/qcom/gcc-ipq4019.c
> index 211c68c..160e0cf 100644
> --- a/drivers/clk/qcom/gcc-ipq4019.c
> +++ b/drivers/clk/qcom/gcc-ipq4019.c
> @@ -565,10 +565,20 @@ static struct clk_rcg2  sdcc1_apps_clk_src = {
>  };
>  
>  static const struct freq_tbl ftbl_gcc_apps_clk[] = {
> -	F(48000000, P_XO,	   1, 0, 0),
> +	F(48000000,  P_XO,         1, 0, 0),
>  	F(200000000, P_FEPLL200,   1, 0, 0),
> +	F(380000000, P_DDRPLLAPSS, 1, 0, 0),
> +	F(409000000, P_DDRPLLAPSS, 1, 0, 0),
> +	F(444000000, P_DDRPLLAPSS, 1, 0, 0),
> +	F(484000000, P_DDRPLLAPSS, 1, 0, 0),
>  	F(500000000, P_FEPLL500,   1, 0, 0),
> +	F(507000000, P_DDRPLLAPSS, 1, 0, 0),
> +	F(532000000, P_DDRPLLAPSS, 1, 0, 0),
> +	F(560000000, P_DDRPLLAPSS, 1, 0, 0),
> +	F(592000000, P_DDRPLLAPSS, 1, 0, 0),
>  	F(626000000, P_DDRPLLAPSS, 1, 0, 0),
> +	F(666000000, P_DDRPLLAPSS, 1, 0, 0),
> +	F(710000000, P_DDRPLLAPSS, 1, 0, 0),
>  	{ }
>  };

Can't we have the determine_rate callback know the speeds of the
"fixed" PLLs and use those first if the rate hits exactly? And
then if that doesn't happen go try ddrpllapps and set the rate on
it? I'm hoping we can get rid of this frequency table.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
