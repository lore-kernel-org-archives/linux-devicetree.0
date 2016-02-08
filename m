From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v2 09/10] Documentation: devicetree: rockchip: Document Landingship
Date: Mon, 08 Feb 2016 11:29:30 +0100
Message-ID: <6744409.i2u8076vm4@phil>
References: <1454897859-7601-1-git-send-email-afaerber@suse.de> <1454897859-7601-10-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1454897859-7601-10-git-send-email-afaerber@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas =?ISO-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Cc: linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Am Montag, 8. Februar 2016, 03:17:38 schrieb Andreas F=E4rber:
> Use "geekbuying,landingship" compatible string, plus those of GeekBox=
=2E

I do believe this would be better as geekbuying,geekbox-landingship . T=
hey=20
might reuse the landingship naming for future baseboards as well ;-)

>=20
> Signed-off-by: Andreas F=E4rber <afaerber@suse.de>
> ---
>  v2: New
>=20
>  Documentation/devicetree/bindings/arm/rockchip.txt | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/rockchip.txt
> b/Documentation/devicetree/bindings/arm/rockchip.txt index
> f633595b196c..c6d95f202591 100644
> --- a/Documentation/devicetree/bindings/arm/rockchip.txt
> +++ b/Documentation/devicetree/bindings/arm/rockchip.txt
> @@ -91,6 +91,11 @@ Rockchip platforms device tree bindings
>      Required root node properties:
>        - compatible =3D "geekbuying,geekbox", "rockchip,rk3368";
>=20
> +- GeekBuying Landingship:
> +    Required root node properties:
> +      - compatible =3D "geekbuying,landingship",
> +		     "geekbuying,geekbox", "rockchip,rk3368";
> +
>  - Rockchip RK3368 evb:
>      Required root node properties:
>        - compatible =3D "rockchip,rk3368-evb-act8846", "rockchip,rk33=
68";
