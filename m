From: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH 1/3] dt-bindings: net: ftgmac100: Document AST2600 compatible
Date: Tue, 8 Oct 2019 12:40:21 +0000
Message-ID: <CACPK8Xeqpx3f_rMOGOqE8cXENREHH3MBjm0Eco9Dr4-ocs+DLg@mail.gmail.com>
References: <20191008115143.14149-1-andrew@aj.id.au> <20191008115143.14149-2-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20191008115143.14149-2-andrew@aj.id.au>
Sender: netdev-owner@vger.kernel.org
To: Andrew Jeffery <andrew@aj.id.au>
Cc: netdev@vger.kernel.org, "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>
List-Id: devicetree@vger.kernel.org

On Tue, 8 Oct 2019 at 11:50, Andrew Jeffery <andrew@aj.id.au> wrote:
>
> The AST2600 contains an FTGMAC100-compatible MAC, although it no-longer
> contains an MDIO controller.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Acked-by: Joel Stanley <joel@jms.id.au>

> ---
>  Documentation/devicetree/bindings/net/ftgmac100.txt | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/net/ftgmac100.txt b/Documentation/devicetree/bindings/net/ftgmac100.txt
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
> --
> 2.20.1
>
