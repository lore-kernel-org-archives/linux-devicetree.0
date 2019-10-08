From: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH 2/3] dt-bindings: net: ftgmac100: Describe clock properties
Date: Tue, 8 Oct 2019 12:42:51 +0000
Message-ID: <CACPK8XcWLCGupAF1EX1LB6A=mQY0s9kjgagr3EKEKJhnbt+j0g@mail.gmail.com>
References: <20191008115143.14149-1-andrew@aj.id.au> <20191008115143.14149-3-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20191008115143.14149-3-andrew@aj.id.au>
Sender: netdev-owner@vger.kernel.org
To: Andrew Jeffery <andrew@aj.id.au>
Cc: netdev@vger.kernel.org, "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>
List-Id: devicetree@vger.kernel.org

On Tue, 8 Oct 2019 at 11:50, Andrew Jeffery <andrew@aj.id.au> wrote:
>
> Critically, the AST2600 requires ungating the RMII RCLK if e.g. NCSI is
> in use.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  Documentation/devicetree/bindings/net/ftgmac100.txt | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/net/ftgmac100.txt b/Documentation/devicetree/bindings/net/ftgmac100.txt
> index 04cc0191b7dd..c443b0b84be5 100644
> --- a/Documentation/devicetree/bindings/net/ftgmac100.txt
> +++ b/Documentation/devicetree/bindings/net/ftgmac100.txt
> @@ -24,6 +24,12 @@ Optional properties:
>  - no-hw-checksum: Used to disable HW checksum support. Here for backward
>    compatibility as the driver now should have correct defaults based on
>    the SoC.
> +- clocks: In accordance with the generic clock bindings. Must describe the MAC
> +  IP clock, and optionally an RMII RCLK gate for the AST2600.

 or AST2500.

With that fixed you can add my ack.


> +- clock-names:
> +
> +      - "MACCLK": The MAC IP clock
> +      - "RCLK": Clock gate for the RMII RCLK
>
>  Example:
>
> --
> 2.20.1
>
