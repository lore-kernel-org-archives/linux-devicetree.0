From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v6 3/3] mfd: max14577: Add device tree bindings document
Date: Wed, 4 Dec 2013 11:20:39 +0000
Message-ID: <20131204112039.GC907@lee--X1>
References: <1386153615-25456-1-git-send-email-k.kozlowski@samsung.com>
 <1386153615-25456-4-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1386153615-25456-4-git-send-email-k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Anton Vorontsov <anton-9xeibp6oKSgdnm+yROfE0A@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> Add document describing device tree bindings for MAX14577 MFD driver.
>=20
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/mfd/max14577.txt |   48 ++++++++++=
++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/max14577.tx=
t
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/max14577.txt b/Doc=
umentation/devicetree/bindings/mfd/max14577.txt
> new file mode 100644
> index 000000000000..f4fd16360b6b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/max14577.txt
> @@ -0,0 +1,48 @@
> +MAXIM MAX14577 multi-function device

Why is Maxim capitalised in such a way?

If you're going to use the term Multi-Function Device, please
capitalise it.

> +MAX14577 is a Multi-function device with Micro-USB Interface Circuit=
, Li+

Same here.

> +Battery Charger and SFOUT LDO output for powering USB devices. It is
> +interfaced to host controller using I2C.
> +
> +Required properties:
> +- compatible : Must be "maxim,max14577".
> +- reg : I2C slave address for the max14577 chip.
> +- interrupts : IRQ line for the max14577 chip.
> +- interrupt-parent :  The parent interrupt controller.
> +
> +Optional nodes:
> +- regulators :
> +  Required child node properties:
> +  - compatible : "maxim,max14577-regulator"
> +
> +  Optional child nodes:
> +    Each child node representing a regulator, following standard reg=
ulator
> +    bindings. Valid names for a regulator are: "CHARGER" and "SAFEOU=
T".
> +    The SAFEOUT is a constant voltage regulator so there is no need

s/constant/fixed

> +    to specify voltages for it.

The whole of the "Optional nodes" explaination isn't as clear as it
could otherwise be.=20

> +	[*] refer Documentation/devicetree/bindings/regulator/regulator.txt
> +
> +Example:
> +	max14577@25 {
> +		compatible =3D "maxim,max14577";
> +		reg =3D <0x25>;
> +		interrupt-parent =3D <&gpx1>;
> +		interrupts =3D <5 0>;

I'm gussing this is IRQ5 and the 0 is flags? If so, please use
#defines for the flags.

> +		regulators {
> +			compatible =3D "maxim,max14577-regulator";
> +
> +			safeout_reg: safeout@1 {

The name of the node (not the label:safeout_reg) usually depicts the
type of device, so 'regulator@0' and 'regulator@1'. However, I'm
unsure how this works when these nodes are encapsulated by an
overarching 'regulators' parent node.

Perhaps Mark can answer this?

> +				regulator-compatible =3D "SAFEOUT";
> +				regulator-name =3D "SAFEOUT";
> +			};
> +			charger_reg: charger@0 {
> +				regulator-compatible =3D "CHARGER";
> +				regulator-name =3D "CHARGER";
> +				regulator-min-microamp =3D <90000>;
> +				regulator-max-microamp =3D <950000>;
> +				regulator-boot-on;
> +			};
> +		};
> +	};

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
