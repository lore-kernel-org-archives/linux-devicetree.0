From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH net-next v2 3/4] dt-bindings: net: fsl: enetc: Add
 bindings for the central MDIO PCIe endpoint
Date: Thu, 25 Jul 2019 17:49:54 +0300
Message-ID: <927717df-1a74-3253-f905-6a2f742fda63@cogentembedded.com>
References: <1564053568-20522-1-git-send-email-claudiu.manoil@nxp.com>
 <1564053568-20522-4-git-send-email-claudiu.manoil@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1564053568-20522-4-git-send-email-claudiu.manoil@nxp.com>
Content-Language: en-MW
Sender: netdev-owner@vger.kernel.org
To: Claudiu Manoil <claudiu.manoil@nxp.com>, "David S . Miller" <davem@davemloft.net>
Cc: andrew@lunn.ch, Rob Herring <robh+dt@kernel.org>, Li Yang <leoyang.li@nxp.com>, alexandru.marginean@nxp.com, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello!

On 07/25/2019 02:19 PM, Claudiu Manoil wrote:

> The on-chip PCIe root complex that integrates the ENETC ethernet
> controllers also integrates a PCIe enpoint for the MDIO controller
> provinding for cetralized control of the ENETC mdio bus.

   Providing, centralized.

> Add bindings for this "central" MDIO Integrated PCIe Endpoit.
> 
> Signed-off-by: Claudiu Manoil <claudiu.manoil@nxp.com>
> ---
> v1 - none
> v2 - none
> 
>  .../devicetree/bindings/net/fsl-enetc.txt     | 42 +++++++++++++++++--
>  1 file changed, 39 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/fsl-enetc.txt b/Documentation/devicetree/bindings/net/fsl-enetc.txt
> index 25fc687419db..c090f6df7a39 100644
> --- a/Documentation/devicetree/bindings/net/fsl-enetc.txt
> +++ b/Documentation/devicetree/bindings/net/fsl-enetc.txt
[...]
> @@ -47,8 +49,42 @@ Example:
>  		};
>  	};
>  
> -2) The ENETC port is an internal port or has a fixed-link external
> -connection:
> +1.2. Using the central MDIO PCIe enpoint device

   Endpoint. -ETOOMANYTYPOS. :-)

[...]

MBR, Sergei
