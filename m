From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH 1/4] dt: fsl-imx-esdhc.txt: Fix gpio number assignment
Date: Sun, 10 Jun 2012 18:11:44 -0500
Message-ID: <4FD529B0.6010401@gmail.com>
References: <1339349050-3105-1-git-send-email-festevam@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1339349050-3105-1-git-send-email-festevam@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Fabio Estevam <festevam@gmail.com>
Cc: grant.likely@secretlab.ca, Fabio Estevam <fabio.estevam@freescale.com>, linux-doc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, rob.herring@calxeda.com, kernel@pengutronix.de
List-Id: devicetree@vger.kernel.org

On 06/10/2012 12:24 PM, Fabio Estevam wrote:
> From: Fabio Estevam <fabio.estevam@freescale.com>
> 
> Fix gpio number assignment, so that it can match the number stated in the comment.
> 
> Cc: 
> Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
> ---
>  .../devicetree/bindings/mmc/fsl-imx-esdhc.txt      |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.txt b/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.txt
> index c7e404b..fea541e 100644
> --- a/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.txt
> +++ b/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.txt
> @@ -29,6 +29,6 @@ esdhc@70008000 {
>  	compatible = "fsl,imx51-esdhc";
>  	reg = <0x70008000 0x4000>;
>  	interrupts = <2>;
> -	cd-gpios = <&gpio0 6 0>; /* GPIO1_6 */
> -	wp-gpios = <&gpio0 5 0>; /* GPIO1_5 */
> +	cd-gpios = <&gpio1 6 0>; /* GPIO1_6 */
> +	wp-gpios = <&gpio1 5 0>; /* GPIO1_5 */

Are you sure all these aren't just DT is 0 based and the chip is 1 based
numbering?

Rob

>  };

