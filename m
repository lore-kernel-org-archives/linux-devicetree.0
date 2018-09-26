From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH net] dt-bindings: net: add support for Microchip KSZ9131
 Ethernet PHY
Date: Wed, 26 Sep 2018 11:33:29 -0700
Message-ID: <87d34a1b-5188-2999-bffe-fe377bc6ad3f@gmail.com>
References: <1537985783-22724-1-git-send-email-yuiko.oshino@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1537985783-22724-1-git-send-email-yuiko.oshino@microchip.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Yuiko Oshino <yuiko.oshino@microchip.com>, davem@davemloft.net, robh+dt@kernel.org, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, mark.rutland@arm.com, m.felsch@pengutronix.de, Markus.Niebel@tqs.de, andrew@lunn.ch, netdev@vger.kernel.org, UNGLinuxDriver@microchip.com
List-Id: devicetree@vger.kernel.org

On 09/26/2018 11:16 AM, Yuiko Oshino wrote:
> Add support for Microchip Technology KSZ9131 10/100/1000 Ethernet phy

Capitalize PHY here.

Targeting the "net" tree which is for bugfixes is not appropriate here
since this is adding support for a new PHY model.

The binding looks reasonable though:

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>

> 
> Signed-off-by: Yuiko Oshino <yuiko.oshino@microchip.com>
> ---
>  .../devicetree/bindings/net/micrel-ksz90x1.txt     | 29 +++++++++++++++++++++-
>  1 file changed, 28 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/micrel-ksz90x1.txt b/Documentation/devicetree/bindings/net/micrel-ksz90x1.txt
> index e22d8cf..d23d14a 100644
> --- a/Documentation/devicetree/bindings/net/micrel-ksz90x1.txt
> +++ b/Documentation/devicetree/bindings/net/micrel-ksz90x1.txt
> @@ -1,4 +1,4 @@
> -Micrel KSZ9021/KSZ9031 Gigabit Ethernet PHY
> +Micrel/Microchip KSZ9021/KSZ9031/KSZ9131 Gigabit Ethernet PHY
>  
>  Some boards require special tuning values, particularly when it comes
>  to clock delays. You can specify clock delay values in the PHY OF
> @@ -64,6 +64,33 @@ KSZ9031:
>          Attention: The link partner must be configurable as slave otherwise
>          no link will be established.
>  
> +KSZ9131:
> +
> +  All skew control options are specified in picoseconds. The minimum
> +  value is 0, and the maximum is property-dependent. The increment
> +  step is 100ps. The default value is the neutral setting, so setting
> +  rxc-skew-ps=<0> actually results in -700 picoseconds adjustment.
> +
> +  Optional properties:
> +
> +    Maximum value of 2400, default value 700:
> +
> +      - rxc-skew-ps : Skew control of RX clock pad
> +      - txc-skew-ps : Skew control of TX clock pad
> +
> +    Maximum value of 1500, default value 700:
> +
> +      - rxdv-skew-ps : Skew control of RX CTL pad
> +      - txen-skew-ps : Skew control of TX CTL pad
> +      - rxd0-skew-ps : Skew control of RX data 0 pad
> +      - rxd1-skew-ps : Skew control of RX data 1 pad
> +      - rxd2-skew-ps : Skew control of RX data 2 pad
> +      - rxd3-skew-ps : Skew control of RX data 3 pad
> +      - txd0-skew-ps : Skew control of TX data 0 pad
> +      - txd1-skew-ps : Skew control of TX data 1 pad
> +      - txd2-skew-ps : Skew control of TX data 2 pad
> +      - txd3-skew-ps : Skew control of TX data 3 pad
> +
>  Examples:
>  
>  	mdio {
> 


-- 
Florian
