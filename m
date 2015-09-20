From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/3] mfd: axp20x: Rename supply names for
 AXP221 DC1SW and DC5LDO regulators
Date: Sun, 20 Sep 2015 05:17:22 +0100
Message-ID: <20150920041722.GI3039@x1>
References: <1442372732-27434-1-git-send-email-wens@csie.org>
 <1442372732-27434-2-git-send-email-wens@csie.org>
Reply-To: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDA7X7F2WUEBBVPG7CXQKGQEOJLTMDI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1442372732-27434-2-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 16 Sep 2015, Chen-Yu Tsai wrote:

> The DC1SW and DC5LDO regulators in the AXP221 are internally chained
> to DCDC1 and DCDC5, hence the names. The original bindings used the
> parent regulator names for the supply regulator property. This causes
> some confusion when we actually use it in the dts:
>=20
> 	axp221 {
> 		/* self supplying? */
> 		dcdc1-supply =3D <&dcdc1>;
> 		dcdc5-supply =3D <&dcdc5>;
>=20
> 		dcdc1: dcdc1 {
> 			...
> 		};
>=20
> 		dcdc5: dcdc5 {
> 			...
> 		};
> 	};
>=20
> Change them to the downstream regulator names, or "dc1sw" and "dc5ldo"
> respectively.
>=20
> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/mfd/axp20x.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

> diff --git a/Documentation/devicetree/bindings/mfd/axp20x.txt b/Documenta=
tion/devicetree/bindings/mfd/axp20x.txt
> index 41811223e5be..8e79252b1e7c 100644
> --- a/Documentation/devicetree/bindings/mfd/axp20x.txt
> +++ b/Documentation/devicetree/bindings/mfd/axp20x.txt
> @@ -60,8 +60,8 @@ DCDC2		: DC-DC buck	: vin2-supply
>  DCDC3		: DC-DC	buck	: vin3-supply
>  DCDC4		: DC-DC	buck	: vin4-supply
>  DCDC5		: DC-DC	buck	: vin5-supply
> -DC1SW		: On/Off Switch	: dcdc1-supply		: DCDC1 secondary output
> -DC5LDO		: LDO		: dcdc5-supply		: input from DCDC5
> +DC1SW		: On/Off Switch	: dc1sw-supply		: DCDC1 secondary output
> +DC5LDO		: LDO		: dc5ldo-supply		: input from DCDC5
>  ALDO1		: LDO		: aldoin-supply		: shared supply
>  ALDO2		: LDO		: aldoin-supply		: shared supply
>  ALDO3		: LDO		: aldoin-supply		: shared supply

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
