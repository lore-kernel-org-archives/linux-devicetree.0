From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/6] dt-bindings: mfd: axp20x: Introduce
 bindings for AXP813
Date: Mon, 17 Jul 2017 11:43:58 +0100
Message-ID: <20170717104358.ndplsnhzmcdx4sxo@dell>
References: <20170622040833.15329-1-wens@csie.org>
 <20170622040833.15329-3-wens@csie.org>
Reply-To: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDA7X7F2WUEBB4NJWLFQKGQELERLQ5A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20170622040833.15329-3-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 22 Jun 2017, Chen-Yu Tsai wrote:

> The X-Powers AXP813 is a PMIC designed to be paired with Allwinner's
> A83T SoC. There is also an AXP818, which is paired with the H8 SoC.
>=20
> The two models seem to be identical, apart from the external markings.
>=20
> This patch introduces the basic mfd and regulator bindings for the
> AXP813.
>=20
> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/mfd/axp20x.txt | 49 ++++++++++++++++++=
+++---
>  1 file changed, 44 insertions(+), 5 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/axp20x.txt b/Documenta=
tion/devicetree/bindings/mfd/axp20x.txt
> index 211a100c6b20..1dff7e2ec375 100644
> --- a/Documentation/devicetree/bindings/mfd/axp20x.txt
> +++ b/Documentation/devicetree/bindings/mfd/axp20x.txt
> @@ -9,6 +9,12 @@ axp223 (X-Powers)
>  axp803 (X-Powers)
>  axp806 (X-Powers)
>  axp809 (X-Powers)
> +axp813 (X-Powers)
> +
> +The AXP813 is 2 chips packaged into 1. The 2 chips do not share anything
> +other than the packaging. Pins are routed separately. As such they shoul=
d
> +be treated as separate entities. The other half is an AC100 RTC/codec
> +combo chip. Please see ac100.txt for its bindings.

Please indicate where this lives using standard Linux syntax.

./ac100.txt
../<subsystem>/ac100.txt

etc.

Once that's been fixed, you may apply my:

For my own reference:
  Acked-for-MFD-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
 =20
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
