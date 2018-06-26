Return-Path: <SRS0=bqe9=JM=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mleia.com ([178.79.152.223]:51606 "EHLO mail.mleia.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750883AbeFZQZu (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 26 Jun 2018 12:25:50 -0400
Subject: Re: [PATCH] dt-bindings: sram: Add 'clocks' as an optional property
References: <1529767339-12539-1-git-send-email-festevam@gmail.com>
From: Vladimir Zapolskiy <vz@mleia.com>
Message-ID: <01e904ec-1180-e025-9c7e-412c273a68a1@mleia.com>
Date: Tue, 26 Jun 2018 19:25:48 +0300
MIME-Version: 1.0
In-Reply-To: <1529767339-12539-1-git-send-email-festevam@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Fabio Estevam <festevam@gmail.com>, robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, p.zabel@pengutronix.de, Fabio Estevam <fabio.estevam@nxp.com>
List-ID: <devicetree@vger.kernel.org>

Hi Fabio,

On 06/23/2018 06:22 PM, Fabio Estevam wrote:
> From: Fabio Estevam <fabio.estevam@nxp.com>
> 
> Some SoCs (like i.MX53) need to specify the SRAM clock in the
> device tree via the clocks property.
> 
> Add an entry to the optional property section.
> 
> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
> ---
>  Documentation/devicetree/bindings/sram/sram.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/sram/sram.txt b/Documentation/devicetree/bindings/sram/sram.txt
> index 267da44..05689c1 100644
> --- a/Documentation/devicetree/bindings/sram/sram.txt
> +++ b/Documentation/devicetree/bindings/sram/sram.txt
> @@ -50,6 +50,7 @@ Optional properties in the area nodes:
>  		 manipulation of the page attributes.
>  - label : the name for the reserved partition, if omitted, the label
>            is taken from the node name excluding the unit address.
> +- clocks: the clock specifier that controls the SRAM clock.

just a nitpicking, all other property descriptions have a space before
a colon.

Also probably it makes sense to correct and pluralize "the clock specifier"
into a widely used form of "a list of phandle and clock specifier pairs",
while currently the driver does not support multiple clocks, it may be
extended in the future.

With that fixed,

Reviewed-by: Vladimir Zapolskiy <vz@mleia.com>

--
Best wishes,
Vladimir
