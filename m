From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 01/10] dmaengine: sun6i: Correct setting of clock
 autogating register for A83T/H3
Date: Mon, 18 Sep 2017 09:57:32 +0200
Message-ID: <20170918075732.wptp75sh3ovhdukp@flea.lan>
References: <20170917031956.28010-1-stefan.bruens@rwth-aachen.de>
 <20170917031956.28010-2-stefan.bruens@rwth-aachen.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="gb3s5rf5jqs52cu2"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170917031956.28010-2-stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan =?iso-8859-1?Q?Br=FCns?= <stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
Cc: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Code Kipper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--gb3s5rf5jqs52cu2
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Sep 17, 2017 at 05:19:47AM +0200, Stefan Br=FCns wrote:
> The H83T uses a compatible string different from the A23, but requires
> the same clock autogating register setting.
>=20
> The H3 also requires setting the clock autogating register, but has
> the register at a different offset.
>=20
> Add three suitable callbacks for the existing controller generations
> and set it in the controller config structure.
>=20
> Signed-off-by: Stefan Br=FCns <stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
> ---
>  drivers/dma/sun6i-dma.c | 31 ++++++++++++++++++++++++++-----
>  1 file changed, 26 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
> index bcd496edc70f..45bcd5271d94 100644
> --- a/drivers/dma/sun6i-dma.c
> +++ b/drivers/dma/sun6i-dma.c
> @@ -48,6 +48,9 @@
>  #define SUN8I_DMA_GATE		0x20
>  #define SUN8I_DMA_GATE_ENABLE	0x4
> =20
> +#define SUNXI_H3_SECURE_REG		0x20
> +#define SUNXI_H3_DMA_GATE		0x28
> +#define SUNXI_H3_DMA_GATE_ENABLE	0x4
>  /*
>   * Channels specific registers
>   */
> @@ -111,7 +114,7 @@ struct sun6i_dma_config {
>  	 * however these SoCs really have and need this bit, as seen in the
>  	 * BSP kernel source code.
>  	 */
> -	bool gate_needed;
> +	void (*clock_autogate_enable)();
>  };
> =20
>  /*
> @@ -267,6 +270,20 @@ static inline s8 convert_buswidth(enum dma_slave_bus=
width addr_width)
>  	return addr_width >> 1;
>  }
> =20
> +static void sun6i_enable_clock_autogate_noop(struct sun6i_dma_dev *sdev)
> +{
> +}

I guess instead of that one, we could just test for the pointer and
not call the function if it's NULL?

Looks good otherwise, once fixed, you have
Acked-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--gb3s5rf5jqs52cu2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZv3xsAAoJEBx+YmzsjxAgaNEQAJwQqEU68VHGDpgGTpJ2RVqC
IcxdoN4QFXZhmUBd/sLCrAhTFrVhZ2C1MFeUcAhiSP0HrPMTmSva6GnzCguNOdMD
b8Sp5Y0gVl5XyZ6XFHtVdI0lCJDNSHqiV6VXbNu7cKvkpvUwH/OKxobQ4CwWxrYz
nXyME9jWdq5faeCCAcPGFUOwrraCayvEzp0WBgy1lWDWYGRP49ix88HzouLq1cgw
Qw/H9C9L20wYllMBz/LRRKndVg52hnaQ2EubrlK8pkeOebjyJccE+6k+e9ReD2BL
uMOxoj/VR0JbCXwdTcw2YwkCiLhDW+WwaBm88jli2Dg32JIHNFbqYwP344N3Qde+
5AXYLus80sZGtxLoW3q/AIA5ofj5HKNjJgJVPp9GqNwdK9YXar4asoljb08KPprw
EoIudVLd1wNYIMA7i+/oek8LQ8AN88aCplORJVwFTjiM0G21Nl5sSp1nmdL4pzUg
9rFTEL+NDEQrsiJkGGFJDOGTVqkY51ja3D06k+hQyZPySgZBrcWwqnMJ+4nFBjAL
RQCuw6z5XnVESIaNEY781lApPNBRR+gCAl7J4M4O0gvYkRRCR7aJDTYkzEQEcMhj
aDttS6tS5TNC+NTAWsqzG1d9FbnuQnHkYx4WVLTAWrUMI+XqsLm1+qdz7k/G3m7D
aBOKZI4I0Bz4uH1YjGIK
=uXs9
-----END PGP SIGNATURE-----

--gb3s5rf5jqs52cu2--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
