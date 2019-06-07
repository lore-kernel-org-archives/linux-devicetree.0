From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: rng: Document BCM7211 RNG compatible
 string
Date: Fri, 7 Jun 2019 11:57:49 -0700
Message-ID: <ce516362-658f-cde3-9be8-0e092f554782@gmail.com>
References: <20190510173112.2196-1-f.fainelli@gmail.com>
 <20190510173112.2196-2-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190510173112.2196-2-f.fainelli@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Cc: bcm-kernel-feedback-list@broadcom.com, stefan.wahren@i2se.com, wahrenst@gmx.net, herbert@gondor.apana.org.au, linux-crypto@vger.kernel.org, mpm@selenic.com, Mark Rutland <mark.rutland@arm.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:BROADCOM IPROC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 5/10/19 10:31 AM, Florian Fainelli wrote:
> BCM7211 features a RNG200 block, document its compatible string.
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

Rob, does this look okay to you?

> ---
>  Documentation/devicetree/bindings/rng/brcm,iproc-rng200.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/rng/brcm,iproc-rng200.txt b/Documentation/devicetree/bindings/rng/brcm,iproc-rng200.txt
> index 0014da9145af..c223e54452da 100644
> --- a/Documentation/devicetree/bindings/rng/brcm,iproc-rng200.txt
> +++ b/Documentation/devicetree/bindings/rng/brcm,iproc-rng200.txt
> @@ -2,6 +2,7 @@ HWRNG support for the iproc-rng200 driver
>  
>  Required properties:
>  - compatible : Must be one of:
> +	       "brcm,bcm7211-rng200"
>  	       "brcm,bcm7278-rng200"
>  	       "brcm,iproc-rng200"
>  - reg : base address and size of control register block
> 


-- 
Florian
