Return-Path: <SRS0=nzd3=F4=armlinux.org.uk=linux+robh+dt=kernel.org@kernel.org>
Date: Tue, 6 Mar 2018 15:02:22 +0000
From: Russell King - ARM Linux <linux@armlinux.org.uk>
Subject: Re: [PATCH net-next 3/4] dt-bindings: add maximum power level to SFP
 binding
Message-ID: <20180306150221.GL9418@n2100.armlinux.org.uk>
References: <20180227155218.GT9418@n2100.armlinux.org.uk>
 <E1eqhYx-0003th-OT@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1eqhYx-0003th-OT@rmk-PC.armlinux.org.uk>
Sender: Russell King - ARM Linux <linux@armlinux.org.uk>
To: Rob Herring <robh+dt@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Mark Rutland <mark.rutland@arm.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi Rob,

This patch, and the patches that make use of it have now been merged
into their respective trees, but I note that you haven't reviewed
this patch.  Obviously, providing an ack is now moot, but it would
still be good for a response before 4.16-final is released.

On Tue, Feb 27, 2018 at 03:53:07PM +0000, Russell King wrote:
> Add the new maximum power level property to the SFP binding.
> 
> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
> ---
>  Documentation/devicetree/bindings/net/sff,sfp.txt | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/sff,sfp.txt b/Documentation/devicetree/bindings/net/sff,sfp.txt
> index f1c441bedf68..929591d52ed6 100644
> --- a/Documentation/devicetree/bindings/net/sff,sfp.txt
> +++ b/Documentation/devicetree/bindings/net/sff,sfp.txt
> @@ -33,6 +33,10 @@ Transceiver
>    Select (AKA RS1) output gpio signal (SFP+ only), low: low Tx rate, high:
>    high Tx rate. Must not be present for SFF modules
>  
> +- maximum-power-milliwatt : Maximum module power consumption
> +  Specifies the maximum power consumption allowable by a module in the
> +  slot, in milli-Watts.  Presently, modules can be up to 1W, 1.5W or 2W.
> +
>  Example #1: Direct serdes to SFP connection
>  
>  sfp_eth3: sfp-eth3 {
> @@ -40,6 +44,7 @@ sfp_eth3: sfp-eth3 {
>  	i2c-bus = <&sfp_1g_i2c>;
>  	los-gpios = <&cpm_gpio2 22 GPIO_ACTIVE_HIGH>;
>  	mod-def0-gpios = <&cpm_gpio2 21 GPIO_ACTIVE_LOW>;
> +	maximum-power-milliwatt = <1000>;
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&cpm_sfp_1g_pins &cps_sfp_1g_pins>;
>  	tx-disable-gpios = <&cps_gpio1 24 GPIO_ACTIVE_HIGH>;
> -- 
> 2.7.4
> 

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 8.8Mbps down 630kbps up
According to speedtest.net: 8.21Mbps down 510kbps up
