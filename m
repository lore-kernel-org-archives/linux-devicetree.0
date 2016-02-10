From: Vladimir Zapolskiy <vz@mleia.com>
Subject: Re: [PATCH 2/2] dt-bindings: clock: add lpc32xx clock frequency output
Date: Wed, 10 Feb 2016 02:06:01 +0200
Message-ID: <56BA7EE9.8040703@mleia.com>
References: <1455043670-19025-2-git-send-email-slemieux.tyco@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1455043670-19025-2-git-send-email-slemieux.tyco@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: slemieux.tyco@gmail.com, robh+dt@kernel.org, sboyd@codeaurora.org, mturquette@baylibre.com
Cc: stigge@antcom.de, devicetree@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Sylvain,

On 09.02.2016 20:47, slemieux.tyco@gmail.com wrote:
> From: Sylvain Lemieux <slemieux@tycoint.com>
> 
> This patch add an optional parameter to setup the
> xtal clock frequency output.
> 
> Signed-off-by: Sylvain Lemieux <slemieux@tycoint.com>
> ---
>  Documentation/devicetree/bindings/clock/nxp,lpc3220-clk.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/nxp,lpc3220-clk.txt b/Documentation/devicetree/bindings/clock/nxp,lpc3220-clk.txt
> index 20cbca3..ce51759 100644
> --- a/Documentation/devicetree/bindings/clock/nxp,lpc3220-clk.txt
> +++ b/Documentation/devicetree/bindings/clock/nxp,lpc3220-clk.txt
> @@ -10,6 +10,9 @@ Required properties:
>  - clock-names: list of external oscillator clock names, must contain
>    "xtal_32k" and may have optional "xtal"
>  
> +Optional properties:
> +- xtal,clock-output-frequency: define the "xtal" clock frequency output in Hz
> +

this one looks wrong in sense that from patch 1/2 the property configures
a PLL output clock rate, which is not an oscillator (xtal) clock rate.

I believe switching to "assigned-clock-rates" should make this change
obsolete.

>  Examples:
>  
>  	/* System Control Block */
> 

--
With best wishes,
Vladimir
