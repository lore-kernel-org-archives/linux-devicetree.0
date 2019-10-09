From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH 1/3] dt-bindings: net: ftgmac100: Document AST2600
 compatible
Date: Wed, 09 Oct 2019 15:38:46 +1100
Message-ID: <75d915aec936be64ea5ebd63402efd90bb1c29d9.camel@kernel.crashing.org>
References: <20191008115143.14149-1-andrew@aj.id.au>
         <20191008115143.14149-2-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20191008115143.14149-2-andrew@aj.id.au>
Sender: netdev-owner@vger.kernel.org
To: Andrew Jeffery <andrew@aj.id.au>, netdev@vger.kernel.org
Cc: davem@davemloft.net, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, joel@jms.id.au
List-Id: devicetree@vger.kernel.org

On Tue, 2019-10-08 at 22:21 +1030, Andrew Jeffery wrote:
> The AST2600 contains an FTGMAC100-compatible MAC, although it no-
> longer
> contains an MDIO controller.

How do you talk to the PHY then ?

Cheers,
Ben.

> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  Documentation/devicetree/bindings/net/ftgmac100.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/ftgmac100.txt
> b/Documentation/devicetree/bindings/net/ftgmac100.txt
> index 72e7aaf7242e..04cc0191b7dd 100644
> --- a/Documentation/devicetree/bindings/net/ftgmac100.txt
> +++ b/Documentation/devicetree/bindings/net/ftgmac100.txt
> @@ -9,6 +9,7 @@ Required properties:
>  
>       - "aspeed,ast2400-mac"
>       - "aspeed,ast2500-mac"
> +     - "aspeed,ast2600-mac"
>  
>  - reg: Address and length of the register set for the device
>  - interrupts: Should contain ethernet controller interrupt
