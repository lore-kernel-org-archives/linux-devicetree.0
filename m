From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: at91/dt: ov2640: add hsync/vsync-active property
Date: Fri, 18 Sep 2015 16:09:22 +0200
Message-ID: <55FC1B12.8000703@atmel.com>
References: <1442575702-22315-1-git-send-email-josh.wu@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1442575702-22315-1-git-send-email-josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Le 18/09/2015 13:28, Josh Wu a =E9crit :
> On at91sam9x5ek/at91sam9m10g45ek/sama5d3xek boards, we use the parall=
el
> connection for ov2640. So we must set the hsync/vsync property (1 mea=
ns
> active high).
> Otherwise, the connection would be seen as BT.656 or BT.1120.
>=20
> Signed-off-by: Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>

Hi Josh,

Does this patch apply because of the new enhancement that you had
proposed in "media: atmel-isi: parse the DT parameters for
vsync/hsync/pixclock polarity" or does it apply even before?
Is it a fix that applies to older kernels?

So, should I wait for the enhancements to enter media git tree or can I
take them anyway?

Bye,

> ---
>=20
>  arch/arm/boot/dts/at91sam9m10g45ek.dts | 2 ++
>  arch/arm/boot/dts/at91sam9x5ek.dtsi    | 2 ++
>  arch/arm/boot/dts/sama5d3xmb.dtsi      | 2 ++
>  3 files changed, 6 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/at91sam9m10g45ek.dts b/arch/arm/boot/d=
ts/at91sam9m10g45ek.dts
> index d1ae60a..9d16ef8 100644
> --- a/arch/arm/boot/dts/at91sam9m10g45ek.dts
> +++ b/arch/arm/boot/dts/at91sam9m10g45ek.dts
> @@ -198,6 +198,8 @@
>  					isi_0: endpoint {
>  						remote-endpoint =3D <&ov2640_0>;
>  						bus-width =3D <8>;
> +						vsync-active =3D <1>;
> +						hsync-active =3D <1>;
>  					};
>  				};
>  			};
> diff --git a/arch/arm/boot/dts/at91sam9x5ek.dtsi b/arch/arm/boot/dts/=
at91sam9x5ek.dtsi
> index d237c46..479f200 100644
> --- a/arch/arm/boot/dts/at91sam9x5ek.dtsi
> +++ b/arch/arm/boot/dts/at91sam9x5ek.dtsi
> @@ -66,6 +66,8 @@
>  					isi_0: endpoint@0 {
>  						remote-endpoint =3D <&ov2640_0>;
>  						bus-width =3D <8>;
> +						vsync-active =3D <1>;
> +						hsync-active =3D <1>;
>  					};
>  				};
>  			};
> diff --git a/arch/arm/boot/dts/sama5d3xmb.dtsi b/arch/arm/boot/dts/sa=
ma5d3xmb.dtsi
> index 83bee7a..8901042 100644
> --- a/arch/arm/boot/dts/sama5d3xmb.dtsi
> +++ b/arch/arm/boot/dts/sama5d3xmb.dtsi
> @@ -87,6 +87,8 @@
>  					isi_0: endpoint {
>  						remote-endpoint =3D <&ov2640_0>;
>  						bus-width =3D <8>;
> +						vsync-active =3D <1>;
> +						hsync-active =3D <1>;
>  					};
>  				};
>  			};
>=20


--=20
Nicolas Ferre
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
