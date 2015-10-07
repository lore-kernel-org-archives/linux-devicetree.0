From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v4 1/4] drivers: clk: st: Support for enable/disable in
 Clockgen PLLs
Date: Wed, 7 Oct 2015 12:14:57 -0700
Message-ID: <20151007191456.GA12345@codeaurora.org>
References: <1444208939-10233-1-git-send-email-gabriel.fernandez@linaro.org>
 <1444208939-10233-2-git-send-email-gabriel.fernandez@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1444208939-10233-2-git-send-email-gabriel.fernandez@linaro.org>
Sender: linux-clk-owner@vger.kernel.org
To: Gabriel Fernandez <gabriel.fernandez@linaro.org>
Cc: Maxime Coquelin <maxime.coquelin@st.com>, Michael Turquette <mturquette@baylibre.com>, Peter Griffin <peter.griffin@linaro.org>, Pankaj Dev <pankaj.dev@st.com>, Olivier Bideau <olivier.bideau@st.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Fabian Frederick <fabf@skynet.be>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Srinivas Kandagatla <srinivas.kandagatla@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@stlinux.com, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 10/07, Gabriel Fernandez wrote:
> The patch adds support for enable/disable of the Clockgen PLLs.
> clkgen_pll_enable/clkgen_pll_disable added as generic function for all PLLs.
> 
> Signed-off-by: Pankaj Dev <pankaj.dev@st.com>
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@linaro.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
