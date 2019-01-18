From: Boris Brezillon <bbrezillon@kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: memory: jz4780: Add compatible string
 for JZ4725B SoC
Date: Fri, 18 Jan 2019 09:09:08 +0100
Message-ID: <20190118090908.3b6a584e@bbrezillon>
References: <20190117224550.18043-1-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190117224550.18043-1-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Cercueil <paul@crapouillou.net>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Miquel Raynal <miquel.raynal@bootlin.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, 17 Jan 2019 19:45:47 -0300
Paul Cercueil <paul@crapouillou.net> wrote:

> Add a compatible string to support the memory controller built into the
> JZ4725B SoC from Ingenic.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Reviewed-by: Boris Brezillon <bbrezillon@kernel.org>

> ---
>  .../devicetree/bindings/memory-controllers/ingenic,jz4780-nemc.txt       | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/memory-controllers/ingenic,jz4780-nemc.txt b/Documentation/devicetree/bindings/memory-controllers/ingenic,jz4780-nemc.txt
> index f936b5589b19..7cce6d761f2d 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/ingenic,jz4780-nemc.txt
> +++ b/Documentation/devicetree/bindings/memory-controllers/ingenic,jz4780-nemc.txt
> @@ -5,6 +5,7 @@ controller in Ingenic JZ4780
>  
>  Required properties:
>  - compatible: Should be set to one of:
> +    "ingenic,jz4725b-nemc" (JZ4725B)
>      "ingenic,jz4780-nemc" (JZ4780)
>  - reg: Should specify the NEMC controller registers location and length.
>  - clocks: Clock for the NEMC controller.
