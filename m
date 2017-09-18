From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 08/10] dmaengine: sun6i: Add support for
 Allwinner A64 and compatibles
Date: Mon, 18 Sep 2017 10:19:28 +0200
Message-ID: <20170918081928.eex7njub6atasj6x@flea.lan>
References: <20170917031956.28010-1-stefan.bruens@rwth-aachen.de>
 <20170917031956.28010-9-stefan.bruens@rwth-aachen.de>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7jsgfwzuw3d76rey"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBKED73GQKGQECXHMLQA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20170917031956.28010-9-stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Stefan =?iso-8859-1?Q?Br=FCns?= <stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
Cc: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Code Kipper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--7jsgfwzuw3d76rey
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 17, 2017 at 05:19:54AM +0200, Stefan Br=C3=BCns wrote:
> The A64 SoC has the same dma engine as the H3 (sun8i), with a
> reduced amount of physical channels. To allow future reuse of the
> compatible, leave the channel count etc. in the config data blank
> and retrieve it from the devicetree.
>=20
> Signed-off-by: Stefan Br=C3=BCns <stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
> ---
>  drivers/dma/sun6i-dma.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>=20
> diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
> index b5ecc97a0d5a..118b29bb1eac 100644
> --- a/drivers/dma/sun6i-dma.c
> +++ b/drivers/dma/sun6i-dma.c
> @@ -1127,6 +1127,28 @@ static struct sun6i_dma_config sun8i_h3_dma_cfg =
=3D {
>  			     BIT(DMA_SLAVE_BUSWIDTH_8_BYTES);
>  };
> =20
> +/*
> + * The A64 binding uses the number of dma channels from the
> + * device tree node.
> + */
> +static struct sun6i_dma_config sun50i_a64_dma_cfg =3D {
> +	.nr_max_channels =3D 0,
> +	.nr_max_requests =3D 0,
> +	.nr_max_vchans   =3D 0,

Those are the default values. I appreciate that you wanted them here
for documentation, but the comment above already fills up that role
fine.

Once removed,

Acked-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--7jsgfwzuw3d76rey
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZv4GQAAoJEBx+YmzsjxAgYO4P/27KzOO88B+VhRLJFpJniksI
7wadM1dwgWtvQ3S0zeAW7fdyYjL8hnUrjJtVzbebtyFW1dFLdB2kk3PCnGxeMMP7
zoR2+oczT/g4iYmYEVKKAfHtrW96uAvN3Zigid8piR9UBhb6H+nIS2cKbEK6uuhY
NUpb3R2BDDO87y2IcN9aFfQkO5IDQcjkZ4H/6Jw471izZBlKOCMSDy6GR1K4Xlfa
JlARdA3fWrhP7wsw8cqxR61dfLZZ6Hvc2QC4VF2+aapKtVuhheDKrQgJwhdm6ZgN
siJENIvmtN52MOOtq8ZVou7IXeqhDCAqc3j/jQFvSEhHYNIjghRhc0I99JlA34n8
Xi6k9Pef+Z0WJ3/+8XXDSLjie0EEZ7NUu9ehZZGMsnojhHwaO4wrU1+3AP3iLMCO
qMQUK3FCgdoI49wb47Fx1+nsjdkRtTvF4ekcR9M11O4nH/53lFkDDsHH0cXmqhFR
u4eG4KDFmuHg8ngggSHroglmcGJhejvxUEe6ANPks5Drzv6WdPAI1D7YHcxqgzTb
3lcOqB2OEI78jfOtAmIMBnDdMRDwPdjHmkYtft3bFuvLWdzwnd6XJ6Y/tn97lBOo
qSoDeCvFJW93BViqvb/sfHcHhm52m8UkzN1D9wtjgFPFBHVtwjnWV8PLt757JCzO
IsPQNmjuEwDSCTvefRMQ
=/aMA
-----END PGP SIGNATURE-----

--7jsgfwzuw3d76rey--
