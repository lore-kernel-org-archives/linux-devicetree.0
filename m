From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: BCM5301X: Specify PHY of USB 2.0 in DT
Date: Wed, 1 Jun 2016 12:21:39 -0700
Message-ID: <574F35C3.6050004@gmail.com>
References: <1464808585-14996-1-git-send-email-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1464808585-14996-1-git-send-email-zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, "open list:BROADCOM BCM5301X ARM ARCHITECTURE" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jon Mason <jon.mason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 06/01/2016 12:16 PM, Rafa=C5=82 Mi=C5=82ecki wrote:
> Driver for Northstar USB 2.0 PHY was added in 4.7-rc1 by:
> commit d3feb4067335 ("phy: bcm-ns-usb2: new driver for USB 2.0 PHY on
> Northstar").
> It should be used to let EHCI platform driver init PHY.
>=20
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm/boot/dts/bcm5301x.dtsi | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/bcm5301x.dtsi b/arch/arm/boot/dts/bcm5=
301x.dtsi
> index 7d4d29b..9300e19 100644
> --- a/arch/arm/boot/dts/bcm5301x.dtsi
> +++ b/arch/arm/boot/dts/bcm5301x.dtsi
> @@ -140,6 +140,22 @@
>  		};
>  	};
> =20
> +	phys {
> +		compatible =3D "simple-bus";
> +		ranges =3D <0x00000000 0x18000000 0x00100000>;
> +		#address-cells =3D <1>;
> +		#size-cells =3D <1>;
> +
> +		usb2_phy2: usb2-phy {
> +			compatible =3D "brcm,ns-usb2-phy";
> +			reg =3D <0x0000c000 0x1000>;
> +			reg-names =3D "dmu";
> +			#phy-cells =3D <0>;
> +			clocks =3D <&genpll BCM_NSP_GENPLL_USB_PHY_REF_CLK>;
> +			clock-names =3D "phy-ref-clk";
> +		};

You guys need to get everything straigthen up when it comes to busing
and child nodes for bcm53101x.dtsi, why do we need a "simple-bus" node
here which overlaps in part with the brcm-bus-axi node's range?

The more I look at BCMA and how it gets used for a non-external WLAN
card, and the less I am convinced it brings anything useful to the game=
,
quite the contrary...

> +	};
> +
>  	axi@18000000 {
>  		compatible =3D "brcm,bus-axi";
>  		reg =3D <0x18000000 0x1000>;
> @@ -217,6 +233,8 @@
> =20
>  			#address-cells =3D <1>;
>  			#size-cells =3D <1>;
> +
> +			phys =3D <&usb2_phy2>;
>  		};
> =20
>  		usb3: usb3@23000 {
>=20


--=20
=46lorian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
