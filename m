From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v4 3/3] dmaengine: sun6i: share the dma driver with sun50i
Date: Tue, 22 Nov 2016 16:57:42 +0100
Message-ID: <20161122155742.cybr46q7mbvzkwbh@lukather>
References: <1479638740-20520-1-git-send-email-hao5781286@gmail.com>
 <1479638740-20520-4-git-send-email-hao5781286@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="4ylqn776qo37tvph"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1479638740-20520-4-git-send-email-hao5781286-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hao Zhang <hao5781286-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: wens-jdAy2FN1RRM@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--4ylqn776qo37tvph
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Nov 20, 2016 at 06:45:40PM +0800, Hao Zhang wrote:
> Changes the limited buswith to 8 bytes,and add
> the test in sun6i_dma_config function
>=20
> Accroding to sun6i dma driver, i think ,if the client
> doesn't configure the address width with dmaengine_slave_config
> function, it would use the default width. So we can add the test
> in sun6i_dma_config function called by dmaengine_slave_config,
> and test the configuration whether is support for the device.
>=20
> Signed-off-by: Hao Zhang <hao5781286-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/dma/sun6i-dma.c | 33 ++++++++++++++++++++++++++++++++-
>  1 file changed, 32 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
> index a235878..f7c90b6 100644
> --- a/drivers/dma/sun6i-dma.c
> +++ b/drivers/dma/sun6i-dma.c
> @@ -250,7 +250,7 @@ static inline s8 convert_burst(u32 maxburst)
>  static inline s8 convert_buswidth(enum dma_slave_buswidth addr_width)
>  {
>  	if ((addr_width < DMA_SLAVE_BUSWIDTH_1_BYTE) ||
> -	    (addr_width > DMA_SLAVE_BUSWIDTH_4_BYTES))
> +	    (addr_width > DMA_SLAVE_BUSWIDTH_8_BYTES))
>  		return -EINVAL;
> =20
>  	return addr_width >> 1;
> @@ -758,6 +758,18 @@ static int sun6i_dma_config(struct dma_chan *chan,
>  {
>  	struct sun6i_vchan *vchan =3D to_sun6i_vchan(chan);
> =20
> +	if ((BIT(config->src_addr_width) | chan->device->src_addr_widths) !=3D
> +		chan->device->src_addr_widths) {

Using an and operator would make this more obvious.

> +		dev_err(chan2dev(chan), "Invalid DMA configuration\n");
> +		return -EINVAL;
> +	}
> +
> +	if ((BIT(config->dst_addr_width) | chan->device->dst_addr_widths) !=3D
> +			chan->device->dst_addr_widths) {
> +		dev_err(chan2dev(chan), "Invalid DMA configuration\n");
> +		return -EINVAL;
> +	}
> +

And I really think both these tests should be in
dmaengine_slave_config directly. There's nothing special about those
tests, and they apply to all the DMA drivers.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--4ylqn776qo37tvph
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYNGr2AAoJEBx+YmzsjxAgDLcQAKQ5g1Gf8R7Hc8vHLxatdOq2
G/PL2cUrx5i3mFYpsILk1iyfw6QaLjZPdFK35dFlQsJ13hPUFKMLG6tiiPlUpHNM
EDtCyBjPRO78Ndysv08NE2rf597eaErYXEaLc7Dd2CjhZrdH0CTw/odhHcET+Mm1
JjZaYJc2GoqjIGECmzMiYHXk+ST8BX7ddTSu7OCoDXviKFtKkheYKVJ5ipiB/NFD
e8Q1nzyyLLMW3yP+kgUqxE57q1wYMhB/LvyjkEsEm16plR1+FnOyhxnPcEduuckV
yzdnTwchGS/inUH16YBrT6MeYYoBZUNeqp8mCvRk1ql2uEDw3v0wGLG0M0kq4qB+
PDQSAA3xx4KbgcqM5aPAHUPAa0hcFTR9rDfK+4ftfX/WoyuhlvXpUvkV2W5GDscT
rioFs8o8DHQu0sDUeRDFSFv4VHqHWOXT8c3/VRBUMaXeD7np2oGCEdg+SAQekaX8
mY4VCJUm2JT2TAPGxZYM1tKYj+oQsXttXxaScZuBxxzf7XJvnGpfVFIur2fQ44xK
VCHBPbXDpmolmsgtFLZFU74DILctYvIXza61A9YEdM2rYdiSUdfUnD77FXWbJTxJ
XZpFLttCpR+orIb2Qz/EXKtEAVrOvXDoJ73Cr+vSgXZig99qsnXgj0rMKjNrA35N
zLIB6qL2WAhVh+90OBMQ
=zFOM
-----END PGP SIGNATURE-----

--4ylqn776qo37tvph--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
