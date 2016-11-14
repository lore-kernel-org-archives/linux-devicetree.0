From: tomas.hlavacek-x+rMaJPWets@public.gmane.org
Subject: Re: [PATCH RFC] ARM: dts: add support for Turris Omnia
Date: Mon, 14 Nov 2016 13:23:05 +0100
Message-ID: <1479126185.15557.5@smtp.gmail.com>
References: <20161105203841.9661-1-uwe@kleine-koenig.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161105203841.9661-1-uwe-rXY34ruvC2xidJT2blvkqNi2O/JbrIOy@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Uwe =?iso-8859-1?q?Kleine-K=F6nig?= <uwe-rXY34ruvC2xidJT2blvkqNi2O/JbrIOy@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Martin =?UTF-8?b?U3RyYmHEjWth?= <martin.strbacka-x+rMaJPWets@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello Uwe and all!

On Sat, Nov 5, 2016 at 9:38 PM, Uwe Kleine-K=F6nig=20
<uwe-rXY34ruvC2xidJT2blvkqNi2O/JbrIOy@public.gmane.org> wrote:
> This machine is an open hardware router by cz.nic driven by a
> Marvell Armada 385.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <uwe-rXY34ruvC2xidJT2blvkqNi2O/JbrIOy@public.gmane.org>
> ---
>=20
> Hello,
>=20
> the following components are working:
>=20
>  - WAN port
>  - eMMC

But I not not sure about DDR50 mode. At least with kernel 4.4, that we=20
use in production, we had to limit to SDR50 to overcome I/O errors and=20
communication instability, if I can remember it correctly. So it might=20
need more testing with the current kernel.

>=20
>  - UART0
>  - USB

It is worth noting that the USB 2.0 interface of Armada 385 is wired to=20
USB pinout of the last (right-most) PCIe connector. The two USB3=20
interfaces routed through SERDES 1 and 3 go directly to the external=20
USB connectors.

>=20
> Still missing is support for the switch. Wireless fails to probe,=20
> didn't
> debug this up to now. SFP is untested as is UART1.

Actually SFP is connected to SGMII interface of eth1, which is routed=20
through SERDES 5. The SGMII line is shared between the SFP and metallic=20
PHY 88E1514. There is a autonomous high-speed switch connected to the=20
SFPDET signal from SFP cage. It disconnects the metallic SFP and=20
connects SGMII to SFP once the module is connected.

The SFP is also connected to the I2C mux port 4 and to GPIO expander=20
for reading/driving SFPDET, LOS, TXFLT, TXDIS signals:

&i2c0 {
        pinctrl-names =3D "default";
        pinctrl-0 =3D <&i2c0_pins>;
        status =3D "okay";
        clock-frequency =3D <100000>;

        i2cmux@70 {
                compatible =3D "nxp,pca9547";
                #address-cells =3D <1>;
                #size-cells =3D <0>;
                reg =3D <0x70>;
                status =3D "okay";

...

                i2c@7 {
                        /* SFP+ GPIO expander */
                        #address-cells =3D <1>;
                        #size-cells =3D <0>;
                        reg =3D <7>;

                        sfpgpio: gpio@71 {
                                compatible =3D "nxp,pca9538";
                                reg =3D <0x71>;
                                interrupt-parent =3D <&gpio1>;
                                interrupts =3D <14 IRQ_TYPE_LEVEL_LOW>;
                                gpio-controller;
                                #gpio-cells =3D <2>;
                        };
                };
	};
};

We have our proprietary support hacked onto mvneta driver for=20
disconnecting PHY on the fly. It is a bit nasty, so I suggest to ignore=20
SFP in this DTS altogether and let's wait till "phylink based SFP=20
module support" or something alike hits upstream, so we can base the=20
SFP support on solid code; unless somebody has a better idea, of course.

>=20
>=20
> diff --git a/arch/arm/boot/dts/armada-385-turris-omnia.dts=20
> b/arch/arm/boot/dts/armada-385-turris-omnia.dts
> new file mode 100644
> index 000000000000..d3cd8a4d713d
> --- /dev/null
> +++ b/arch/arm/boot/dts/armada-385-turris-omnia.dts
> @@ -0,0 +1,246 @@
...
> +
> +			/* USB part of the eSATA/USB 2.0 port */

This comment is perhaps some error inherited from my development DTS.=20
We do not have any eSATA, perhaps PCIe/USB 2.0 slot.

>=20
> +			usb@58000 {
> +				status =3D "okay";
> +			};
> +
> +
> +&eth0 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&ge0_rgmii_pins>;
> +	status =3D "okay";
> +	phy-mode =3D "rgmii-id";
> +
> +	fixed-link {
> +		speed =3D <1000>;
> +		full-duplex;
> +	};
> +};
> +
> +&eth1 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&ge1_rgmii_pins>;
> +	status =3D "okay";
> +	phy-mode =3D "rgmii-id";
> +
> +	fixed-link {
> +		speed =3D <1000>;
> +		full-duplex;
> +	};
> +};
> +

Actually eth0 and eth1 (both are RGMII) are connected to the 88E6176=20
switch. The problem is that from what I have read so far the switch can=20
not operate in DSA mode with two CPU ports. We currently operate the=20
switch in "normal mode" with the eth0 and eth1 set to fixed-link=20
1000/full and with proprietary driver (derived from OpenWRT switch=20
drivers). I would say that these records for eth0 and eth1 are=20
therefore redundant, because it does nothing without the switch support=20
and it would most likely change once we have DSA driver (using only=20
eth0).

Tomas
=

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
