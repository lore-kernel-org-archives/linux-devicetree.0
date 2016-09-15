From: Patrice Chotard <patrice.chotard@st.com>
Subject: Re: [PATCH v3 13/14] ARM: DT: STi: STiH407: clock configuration to
 address 720p and 1080p
Date: Thu, 15 Sep 2016 09:47:54 +0200
Message-ID: <0672caf5-ffa7-f7da-925a-8b6a42bf4a9c@st.com>
References: <1472473626-15398-1-git-send-email-gabriel.fernandez@st.com>
 <1472473626-15398-14-git-send-email-gabriel.fernandez@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1472473626-15398-14-git-send-email-gabriel.fernandez@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: gabriel.fernandez@st.com, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Srinivas Kandagatla <srinivas.kandagatla@gmail.com>, Russell King <linux@armlinux.org.uk>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Olivier Bideau <olivier.bideau@st.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>, Pankaj Dev <pankaj.dev@st.com>, Dinh Nguyen <dinguyen@opensource.altera.com>, Arnd Bergmann <arnd@arndb.de>, Thierry Reding <treding@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@stlinux.com, linux-clk@vger.kernel.org, Lee Jones <lee.jones@linaro.org>, Peter Griffin <peter.griffin@linaro.org>, arnaud.pouliquen@st.com, benjamin.gaignard@st.com, vincent.abriou@st.com, Gabriel Fernandez <gabriel.fernandez@linaro.org>
List-Id: devicetree@vger.kernel.org



On 08/29/2016 02:27 PM, gabriel.fernandez@st.com wrote:
> From: Gabriel Fernandez <gabriel.fernandez@st.com>
> 
> It is necessary to properly configure these clocks in order
> to address 720p and 1080p HDMI resolution.
> 
> Signed-off-by: Vincent Abriou <vincent.abriou@st.com>
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@st.com>
> Acked-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  arch/arm/boot/dts/stih407.dtsi | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/stih407.dtsi b/arch/arm/boot/dts/stih407.dtsi
> index d60f0d8..291ffac 100644
> --- a/arch/arm/boot/dts/stih407.dtsi
> +++ b/arch/arm/boot/dts/stih407.dtsi
> @@ -16,7 +16,10 @@
>  			#size-cells = <1>;
>  
>  			assigned-clocks	= <&clk_s_d2_quadfs 0>,
> -					  <&clk_s_d2_quadfs 0>,
> +					  <&clk_s_d2_quadfs 1>,
> +					  <&clk_s_c0_pll1 0>,
> +					  <&clk_s_c0_flexgen CLK_COMPO_DVP>,
> +					  <&clk_s_c0_flexgen CLK_MAIN_DISP>,
>  					  <&clk_s_d2_flexgen CLK_PIX_MAIN_DISP>,
>  					  <&clk_s_d2_flexgen CLK_PIX_AUX_DISP>,
>  					  <&clk_s_d2_flexgen CLK_PIX_GDP1>,
> @@ -26,14 +29,21 @@
>  
>  			assigned-clock-parents = <0>,
>  						 <0>,
> +						 <0>,
> +						 <&clk_s_c0_pll1 0>,
> +						 <&clk_s_c0_pll1 0>,
>  						 <&clk_s_d2_quadfs 0>,
> -						 <&clk_s_d2_quadfs 0>,
> +						 <&clk_s_d2_quadfs 1>,
>  						 <&clk_s_d2_quadfs 0>,
>  						 <&clk_s_d2_quadfs 0>,
>  						 <&clk_s_d2_quadfs 0>,
>  						 <&clk_s_d2_quadfs 0>;
>  
> -			assigned-clock-rates = <297000000>, <297000000>;
> +			assigned-clock-rates = <297000000>,
> +					       <108000000>,
> +					       <0>,
> +					       <400000000>,
> +					       <400000000>;
>  
>  			ranges;
>  
> 
Hi Gabriel

Applied on STi tree for v4.9

Thanks
