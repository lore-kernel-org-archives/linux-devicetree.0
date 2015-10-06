From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v3 2/4] drivers: clk: st: PLL rate change implementation
 for DVFS
Date: Tue, 6 Oct 2015 11:06:17 -0700
Message-ID: <20151006180617.GE12338@codeaurora.org>
References: <1444032393-13433-1-git-send-email-gabriel.fernandez@linaro.org>
 <1444032393-13433-3-git-send-email-gabriel.fernandez@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1444032393-13433-3-git-send-email-gabriel.fernandez@linaro.org>
Sender: linux-clk-owner@vger.kernel.org
To: Gabriel Fernandez <gabriel.fernandez@linaro.org>
Cc: Maxime Coquelin <maxime.coquelin@st.com>, Michael Turquette <mturquette@baylibre.com>, Peter Griffin <peter.griffin@linaro.org>, Pankaj Dev <pankaj.dev@st.com>, Olivier Bideau <olivier.bideau@st.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Fabian Frederick <fabf@skynet.be>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Srinivas Kandagatla <srinivas.kandagatla@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@stlinux.com, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 10/05, Gabriel Fernandez wrote:
> @@ -452,7 +651,7 @@ static const struct clk_ops st_pll1200c32_ops = {
>  static struct clk * __init clkgen_pll_register(const char *parent_name,
>  				struct clkgen_pll_data	*pll_data,
>  				void __iomem *reg,
> -				const char *clk_name)
> +				const char *clk_name, spinlock_t *lock)

Is there a reason we pass lock here but never use it in this
function?

>  {
>  	struct clkgen_pll *pll;
>  	struct clk *clk;

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
