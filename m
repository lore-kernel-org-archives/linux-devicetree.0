From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v2 4/5] clk: qcom: ipq4019: Added the all frequencies for
 apps cpu
Date: Mon, 15 Aug 2016 15:24:38 -0700
Message-ID: <20160815222438.GK361@codeaurora.org>
References: <1466516962-18087-1-git-send-email-absahu@codeaurora.org>
 <1466516962-18087-5-git-send-email-absahu@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1466516962-18087-5-git-send-email-absahu@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
To: Abhishek Sahu <absahu@codeaurora.org>
Cc: andy.gross@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, mturquette@baylibre.com, galak@codeaurora.org, pradeepb@codeaurora.org, mmcclint@codeaurora.org, varada@codeaurora.org, sricharan@codeaurora.org, architt@codeaurora.org, ntelkar@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 06/21, Abhishek Sahu wrote:
> @@ -554,11 +554,21 @@ static struct clk_rcg2  sdcc1_apps_clk_src = {
>  };
>  
>  static const struct freq_tbl ftbl_gcc_apps_clk[] = {
> -	F(48000000, P_XO,	   1, 0, 0),
> -	F(200000000, P_FEPLL200,   1, 0, 0),
> -	F(500000000, P_FEPLL500,   1, 0, 0),
> -	F(626000000, P_DDRPLLAPSS, 1, 0, 0),
> -	{ }
> +	{48000000, P_XO,          1, 0, 0},
> +	{200000000, P_FEPLL200,   1, 0, 0},
> +	{380000000, P_DDRPLLAPSS, 1, 0, 0},
> +	{409000000, P_DDRPLLAPSS, 1, 0, 0},
> +	{444000000, P_DDRPLLAPSS, 1, 0, 0},
> +	{484000000, P_DDRPLLAPSS, 1, 0, 0},
> +	{500000000, P_FEPLL500,   1, 0, 0},
> +	{507000000, P_DDRPLLAPSS, 1, 0, 0},
> +	{532000000, P_DDRPLLAPSS, 1, 0, 0},
> +	{560000000, P_DDRPLLAPSS, 1, 0, 0},
> +	{592000000, P_DDRPLLAPSS, 1, 0, 0},
> +	{626000000, P_DDRPLLAPSS, 1, 0, 0},
> +	{666000000, P_DDRPLLAPSS, 1, 0, 0},
> +	{710000000, P_DDRPLLAPSS, 1, 0, 0},

Please keep using F macro just in case the hid changes.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
