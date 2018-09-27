From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v2 net-next 2/2] dt-bindings: net: add support for
 Microchip KSZ9131 Ethernet PHY
Date: Thu, 27 Sep 2018 21:45:50 +0200
Message-ID: <20180927194550.GL12979@lunn.ch>
References: <1538079415-6260-1-git-send-email-yuiko.oshino@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1538079415-6260-1-git-send-email-yuiko.oshino@microchip.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yuiko Oshino <yuiko.oshino@microchip.com>
Cc: davem@davemloft.net, robh+dt@kernel.org, devicetree@vger.kernel.org, f.fainelli@gmail.com, linux-kernel@vger.kernel.org, mark.rutland@arm.com, m.felsch@pengutronix.de, Markus.Niebel@tqs.de, netdev@vger.kernel.org, UNGLinuxDriver@microchip.com
List-Id: devicetree@vger.kernel.org

On Thu, Sep 27, 2018 at 04:16:55PM -0400, Yuiko Oshino wrote:
> Add support for Microchip Technology KSZ9131 10/100/1000 Ethernet PHY
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

We also have:

KSZ9021:

  All skew control options are specified in picoseconds. The minimum
  value is 0, the maximum value is 3000, and it is incremented by 200ps
  steps.

and

KSZ9031:

  All skew control options are specified in picoseconds. The minimum
  value is 0, and the maximum is property-dependent. The increment
  step is 60ps. The default value is the neutral setting, so setting
  rxc-skew-ps=<0> actually results in -900 picoseconds adjustment.

So this is the third meaning of 0.

How about making 0 mean 0. Have the range being -700 to 1800 and -700
to 800? KSZ9031 and KSZ9131 then use the same meaning of 0, with 0
actually meaning 0!

   Andrew
