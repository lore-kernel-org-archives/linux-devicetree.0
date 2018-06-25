Return-Path: <robherring2@gmail.com>
Date: Mon, 25 Jun 2018 14:21:09 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: fsl-imx-sahara: Add i.MX51 as a
 supported SoC
Message-ID: <20180625202109.GA22892@rob-hp-laptop>
References: <1529693129-29817-1-git-send-email-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1529693129-29817-1-git-send-email-festevam@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: herbert@gondor.apana.org.au, linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, horia.geanta@nxp.com, Fabio Estevam <fabio.estevam@nxp.com>
List-ID: <devicetree@vger.kernel.org>

On Fri, Jun 22, 2018 at 03:45:28PM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <fabio.estevam@nxp.com>
> 
> i.MX51 and i.MX53 share the same sahara IP block version, so add
> i.MX51 in the list of supported SoCs.
> 
> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
> ---
> Changes since v1:
> - Fix typo in commit log "i.MX51 and i.MX53"
> 
>  Documentation/devicetree/bindings/crypto/fsl-imx-sahara.txt | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/crypto/fsl-imx-sahara.txt b/Documentation/devicetree/bindings/crypto/fsl-imx-sahara.txt
> index e8a35c7..5343a48 100644
> --- a/Documentation/devicetree/bindings/crypto/fsl-imx-sahara.txt
> +++ b/Documentation/devicetree/bindings/crypto/fsl-imx-sahara.txt
> @@ -1,8 +1,9 @@
>  Freescale SAHARA Cryptographic Accelerator included in some i.MX chips.
> -Currently only i.MX27 and i.MX53 are supported.
> +Currently i.MX27, i.MX51 and i.MX53 are supported.
>  
>  Required properties:
> -- compatible : Should be "fsl,<soc>-sahara"
> +- compatible : Should be "fsl,imx27-sahara", "fsl,imx51-sahara"
> +or "fsl,imx53-sahara"

Looks like imx51 should be a fallback and you can drop the driver 
change.

>  - reg : Should contain SAHARA registers location and length
>  - interrupts : Should contain SAHARA interrupt number
>  
> -- 
> 2.7.4
> 
