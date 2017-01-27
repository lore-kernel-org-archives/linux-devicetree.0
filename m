From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: qoriq-clock: Add coreclk
Date: Fri, 27 Jan 2017 16:38:19 -0600
Message-ID: <20170127223819.mzovhnnpths5t5w2@rob-hp-laptop>
References: <1485332363-8434-1-git-send-email-oss@buserror.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1485332363-8434-1-git-send-email-oss@buserror.net>
Sender: linux-clk-owner@vger.kernel.org
To: Scott Wood <oss@buserror.net>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Shawn Guo <shawnguo@kernel.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, "Y.B. Lu" <yangbo.lu@nxp.com>, "Z.Q. Hou" <zhiqiang.hou@nxp.com>, "Y.T. Tang" <yuantian.tang@nxp.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Jan 25, 2017 at 02:19:21AM -0600, Scott Wood wrote:
> ls1012a has separate input root clocks for core PLLs versus the platform
> PLL, with the latter described as sysclk in the hw docs.
> 
> Update the qoriq-clock binding to allow a second input clock, named
> "coreclk".  If present, this clock will be used for the core PLLs.
> 
> Signed-off-by: Scott Wood <oss@buserror.net>
> Cc: devicetree@vger.kernel.org
> ---
>  Documentation/devicetree/bindings/clock/qoriq-clock.txt | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qoriq-clock.txt b/Documentation/devicetree/bindings/clock/qoriq-clock.txt
> index df9cb5a..97a9666 100644
> --- a/Documentation/devicetree/bindings/clock/qoriq-clock.txt
> +++ b/Documentation/devicetree/bindings/clock/qoriq-clock.txt
> @@ -55,6 +55,11 @@ Optional properties:
>  - clocks: If clock-frequency is not specified, sysclk may be provided
>  	as an input clock.  Either clock-frequency or clocks must be
>  	provided.
> +	A second input clock, called "coreclk", may be provided if
> +	core PLLs are based on a different input clock from the
> +	platform PLL.
> +- clock-names: Required if a coreclk is present.  Valid names are
> +	"sysclk" and "coreclk".

'clk' part is redundant.

>  
>  2. Clock Provider
>  
> @@ -71,6 +76,7 @@ second cell is the clock index for the specified type.
>  	2	hwaccel		index (n in CLKCGnHWACSR)
>  	3	fman		0 for fm1, 1 for fm2
>  	4	platform pll	0=pll, 1=pll/2, 2=pll/3, 3=pll/4
> +	5	coreclk		must be 0
>  
>  3. Example
>  
> -- 
> 2.7.4
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
