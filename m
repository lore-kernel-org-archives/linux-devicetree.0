From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH net-next 2/8] dt-bindings: net: add DT bindings for
 Microsemi MIIM
Date: Fri, 23 Mar 2018 14:46:38 -0700
Message-ID: <6cb618e9-0aa0-ba54-b556-d7a6823913d7@gmail.com>
References: <20180323201117.8416-1-alexandre.belloni@bootlin.com>
 <20180323201117.8416-3-alexandre.belloni@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180323201117.8416-3-alexandre.belloni@bootlin.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, "David S . Miller" <davem@davemloft.net>
Cc: Allan Nielsen <Allan.Nielsen@microsemi.com>, razvan.stefanescu@nxp.com, po.liu@nxp.com, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

On 03/23/2018 01:11 PM, Alexandre Belloni wrote:
> DT bindings for the Microsemi MII Management Controller found on Microsemi
> SoCs
> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> ---
>  .../devicetree/bindings/net/mscc-miim.txt          | 25 ++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/mscc-miim.txt
> 
> diff --git a/Documentation/devicetree/bindings/net/mscc-miim.txt b/Documentation/devicetree/bindings/net/mscc-miim.txt
> new file mode 100644
> index 000000000000..711ac9ab853c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/mscc-miim.txt
> @@ -0,0 +1,25 @@
> +Microsemi MII Management Controller (MIIM) / MDIO
> +=================================================
> +
> +Properties:
> +- compatible: must be "mscc,ocelot-miim"
> +- reg: The base address of the MDIO bus controller register bank. Optionally, a
> +  second register bank can be defined if there is an associated reset register
> +  for internal PHYs
> +- #address-cells: Must be <1>.
> +- #size-cells: Must be <0>.  MDIO addresses have no size component.

Missing interrupt property documentation (sorry), other than that:

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
