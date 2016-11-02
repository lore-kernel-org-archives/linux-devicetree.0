From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v3 6/7] clk: qcom: ipq4019: changed the frequency value
 for ddr pll
Date: Tue, 1 Nov 2016 18:27:51 -0700
Message-ID: <20161102012751.GF16026@codeaurora.org>
References: <1474460512-31994-1-git-send-email-absahu@codeaurora.org>
 <1474460512-31994-7-git-send-email-absahu@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1474460512-31994-7-git-send-email-absahu@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Abhishek Sahu <absahu@codeaurora.org>
Cc: andy.gross@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, mturquette@baylibre.com, galak@codeaurora.org, pradeepb@codeaurora.org, mmcclint@codeaurora.org, varada@codeaurora.org, sricharan@codeaurora.org, architt@codeaurora.org, ntelkar@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 09/21, Abhishek Sahu wrote:
> diff --git a/drivers/clk/qcom/gcc-ipq4019.c b/drivers/clk/qcom/gcc-ipq4019.c
> index b2decd5..a2809db 100644
> --- a/drivers/clk/qcom/gcc-ipq4019.c
> +++ b/drivers/clk/qcom/gcc-ipq4019.c
> @@ -546,7 +546,7 @@ static const struct freq_tbl ftbl_gcc_sdcc1_apps_clk[] = {
>  	F(25000000,  P_FEPLL500, 1,  1, 20),
>  	F(50000000,  P_FEPLL500, 1,  1, 10),
>  	F(100000000, P_FEPLL500, 1,  1, 5),
> -	F(190000000, P_DDRPLL,   1,  0, 0),
> +	F(192000000, P_DDRPLL,   1,  0, 0),

Change from 193 to 190 to 192.... please do it once.

>  	{ }
>  };
>  
> @@ -567,18 +567,18 @@ static struct clk_rcg2  sdcc1_apps_clk_src = {
>  static const struct freq_tbl ftbl_gcc_apps_clk[] = {
>  	F(48000000,  P_XO,         1, 0, 0),
>  	F(200000000, P_FEPLL200,   1, 0, 0),
> -	F(380000000, P_DDRPLLAPSS, 1, 0, 0),
> -	F(409000000, P_DDRPLLAPSS, 1, 0, 0),
> -	F(444000000, P_DDRPLLAPSS, 1, 0, 0),
> -	F(484000000, P_DDRPLLAPSS, 1, 0, 0),
> +	F(384000000, P_DDRPLLAPSS, 1, 0, 0),
> +	F(413000000, P_DDRPLLAPSS, 1, 0, 0),
> +	F(448000000, P_DDRPLLAPSS, 1, 0, 0),
> +	F(488000000, P_DDRPLLAPSS, 1, 0, 0),
>  	F(500000000, P_FEPLL500,   1, 0, 0),
> -	F(507000000, P_DDRPLLAPSS, 1, 0, 0),
> -	F(532000000, P_DDRPLLAPSS, 1, 0, 0),
> -	F(560000000, P_DDRPLLAPSS, 1, 0, 0),
> -	F(592000000, P_DDRPLLAPSS, 1, 0, 0),
> -	F(626000000, P_DDRPLLAPSS, 1, 0, 0),
> -	F(666000000, P_DDRPLLAPSS, 1, 0, 0),
> -	F(710000000, P_DDRPLLAPSS, 1, 0, 0),
> +	F(512000000, P_DDRPLLAPSS, 1, 0, 0),
> +	F(537000000, P_DDRPLLAPSS, 1, 0, 0),
> +	F(565000000, P_DDRPLLAPSS, 1, 0, 0),
> +	F(597000000, P_DDRPLLAPSS, 1, 0, 0),
> +	F(632000000, P_DDRPLLAPSS, 1, 0, 0),
> +	F(672000000, P_DDRPLLAPSS, 1, 0, 0),
> +	F(716000000, P_DDRPLLAPSS, 1, 0, 0),

Didn't this patch series introduce table updates already? Why
can't this patch be squashed with that one?

>  	{ }

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
