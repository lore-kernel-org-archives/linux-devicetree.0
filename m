From: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 3/5] ARM64: dts: meson-gxbb-p20x: add reset for the
 ethernet PHY
Date: Tue, 17 Jan 2017 20:22:21 +0100
Message-ID: <1484680941.26620.28.camel@baylibre.com>
References: <20161202234739.22929-1-martin.blumenstingl@googlemail.com>
         <20161202234739.22929-4-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161202234739.22929-4-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, 2016-12-03 at 00:47 +0100, Martin Blumenstingl wrote:
> This resets the ethernet PHY during boot to get the PHY into a
> "clean"
> state. While here also specify the phy-handle of the ethmac node to
> make the PHY configuration similar to the one we have on GXL devices.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23myhRSP0FMvGiw@public.gmane.org
> m>
> Tested-by: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
> ---
>  arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi | 15
> +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi
> b/arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi
> index 203be28..2abc553 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi
> @@ -134,10 +134,25 @@
>  	pinctrl-names = "default";
>  };
>  
> +&mdio0 {
> +	ethernet_phy0: ethernet-phy@0 {
> +		compatible = "ethernet-phy-ieee802.3-c22";
> +		reg = <0>;

Sorry for the late reply.
I just tried on the p200 and this patch (serie) breaks the network on
it. The PHY is not detected anymore.

>From the KSZ9031 Datasheet : "PHY Address 0h is supported as the unique
PHY address only; it is not supported as the broadcast PHY address
[...]"

So we can't just use the broadcast address here:
reg should be <3>.

> +	};
> +};
> +
>  &ethmac {
>  	status = "okay";
>  	pinctrl-0 = <&eth_rgmii_pins>;
>  	pinctrl-names = "default";
> +
> +	phy-handle = <&ethernet_phy0>;
> +
> +	snps,reset-gpio = <&gpio GPIOZ_14 0>;
> +	snps,reset-delays-us = <0 10000 1000000>;
> +	snps,reset-active-low;
> +
> +	phy-mode = "rgmii";

We can't define this in p20x. actually the p201 uses an rmii.
I have not idea about gpio reset, or the phy address for the p201.

I suppose it would be better to move this to meson-gxbb_p200.dts

I don't know if anybody has a p201, but until we can confirm a working
Ethernet configuration, we should probably drop it for the p201

Of course the problem was already there before this patch ...

>  };
>  
>  &ir {
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
