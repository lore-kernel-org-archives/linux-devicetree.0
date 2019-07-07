From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Subject: Re: [PATCH 5/6] dt-bindings: arm: Document RTD1296
Date: Sun, 7 Jul 2019 15:31:16 +0200
Message-ID: <27a3468f-e7b4-e334-5956-8db87d04ff8c@suse.de>
References: <20190707132339.GF13340@arks.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190707132339.GF13340@arks.localdomain>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Aleix Roca Nonell <kernelrocks@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Am 07.07.19 um 15:23 schrieb Aleix Roca Nonell:
> Add bindings for Relatek RTD1296 SoC. And the Bannana Pi BPI-W2 board.

"Realtek", "Banana"

> 
> Signed-off-by: Aleix Roca Nonell <kernelrocks@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/realtek.txt | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/realtek.txt b/Documentation/devicetree/bindings/arm/realtek.txt
> index 95839e19ae92..78da1004d38c 100644
> --- a/Documentation/devicetree/bindings/arm/realtek.txt
> +++ b/Documentation/devicetree/bindings/arm/realtek.txt
> @@ -20,3 +20,16 @@ Root node property compatible must contain, depending on board:
>  Example:
>  
>      compatible = "zidoo,x9s", "realtek,rtd1295";
> +
> +
> +RTD1296 SoC
> +===========
> +
> +Required root node properties:
> +
> + - compatible :  must contain "realtek,rtd1296"

I'm pretty sure that I had such a patch on the list already, so this is
lacking my authorship.

Also, Rob has been working to convert these to YAML, so we should
probably complete that first and then add RTD1296 properly.

> +
> +
> +Root node property compatible must contain, depending on board:
> +
> + - Bannana Pi BPI-W2: "bananapi,bpi-w2"

"Banana"

Regards,
Andreas


-- 
SUSE Linux GmbH
Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG Nürnberg)
