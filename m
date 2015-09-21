From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: Fix tipo in st,clkgen-pll documentation
Date: Mon, 21 Sep 2015 10:04:34 -0500
Message-ID: <56001C82.8060009@kernel.org>
References: <1442389379-9298-1-git-send-email-gabriel.fernandez@linaro.org>
 <1442389379-9298-2-git-send-email-gabriel.fernandez@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1442389379-9298-2-git-send-email-gabriel.fernandez@linaro.org>
Sender: linux-clk-owner@vger.kernel.org
To: Gabriel Fernandez <gabriel.fernandez@linaro.org>
Cc: Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Srinivas Kandagatla <srinivas.kandagatla@gmail.com>, Maxime Coquelin <maxime.coquelin@st.com>, Patrice Chotard <patrice.chotard@st.com>, Russell King <linux@arm.linux.org.uk>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Peter Griffin <peter.griffin@linaro.org>, Pankaj Dev <pankaj.dev@st.com>, Olivier Bideau <olivier.bideau@st.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Fabian Frederick <fabf@skynet.be>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@stlinux.com, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 09/16/2015 02:42 AM, Gabriel Fernandez wrote:
> replace "sst,plls-c32-cx_x" by "st,plls-c32-cx_x"

Ironically, the subject has a typo...

Acked-by: Rob Herring <robh@kernel.org>

> 
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@linaro.org>
> ---
>  Documentation/devicetree/bindings/clock/st/st,clkgen-pll.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/st/st,clkgen-pll.txt b/Documentation/devicetree/bindings/clock/st/st,clkgen-pll.txt
> index d8b168e..e2c6db0 100644
> --- a/Documentation/devicetree/bindings/clock/st/st,clkgen-pll.txt
> +++ b/Documentation/devicetree/bindings/clock/st/st,clkgen-pll.txt
> @@ -21,8 +21,8 @@ Required properties:
>  	"st,stih416-plls-c32-ddr",	"st,clkgen-plls-c32"
>  	"st,stih407-plls-c32-a0",	"st,clkgen-plls-c32"
>  	"st,stih407-plls-c32-a9",	"st,clkgen-plls-c32"
> -	"sst,plls-c32-cx_0",		"st,clkgen-plls-c32"
> -	"sst,plls-c32-cx_1",		"st,clkgen-plls-c32"
> +	"st,plls-c32-cx_0",		"st,clkgen-plls-c32"
> +	"st,plls-c32-cx_1",		"st,clkgen-plls-c32"
>  
>  	"st,stih415-gpu-pll-c32",	"st,clkgengpu-pll-c32"
>  	"st,stih416-gpu-pll-c32",	"st,clkgengpu-pll-c32"
> 

