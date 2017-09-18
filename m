From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 07/10] dmaengine: sun6i: Retrieve channel
 count/max request from devicetree
Date: Mon, 18 Sep 2017 10:18:24 +0200
Message-ID: <20170918081824.iiebcj63wvnean57@flea.lan>
References: <20170917031956.28010-1-stefan.bruens@rwth-aachen.de>
 <20170917031956.28010-8-stefan.bruens@rwth-aachen.de>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="a5lxixo24iqhcmfo"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBW4C73GQKGQEKT56ZUA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20170917031956.28010-8-stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Stefan =?iso-8859-1?Q?Br=FCns?= <stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
Cc: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Code Kipper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--a5lxixo24iqhcmfo
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Sep 17, 2017 at 05:19:53AM +0200, Stefan Br=C3=BCns wrote:
> +	ret =3D of_property_read_u32(np, "dma-channels", &sdc->num_pchans);
> +	if (ret && !sdc->num_pchans) {
> +		dev_err(&pdev->dev, "Can't get dma-channels.\n");
> +		return ret;
> +	}
> +
> +	if (sdc->num_pchans > DMA_MAX_CHANNELS) {
> +		dev_err(&pdev->dev, "Number of dma-channels out of range.\n");
> +		return -EINVAL;
> +	}
> +
> +	ret =3D of_property_read_u32(np, "dma-requests", &sdc->max_request);
> +	if (ret && !sdc->max_request) {
> +		dev_info(&pdev->dev, "Missing dma-requests, using %u.\n",
> +			 DMA_CHAN_MAX_DRQ);
> +		sdc->max_request =3D DMA_CHAN_MAX_DRQ;
> +	}
> +
> +	if (sdc->max_request > DMA_CHAN_MAX_DRQ) {
> +		dev_err(&pdev->dev, "Value of dma-requests out of range.\n");
> +		return -EINVAL;
> +	}

I'm not really convinced about these two checks. They don't catch all
errors (the range between the actual number of channels / DRQ and the
maximum allowed per the registers), they might increase in the future
too, and if we want to make that check actually working, we would have
to duplicate the number of requests and channels into the driver.

Which is kind of the opposite of what we're trying to do here :)

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

--a5lxixo24iqhcmfo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZv4FQAAoJEBx+YmzsjxAgZ5cP/RDr2PJeZe5ecqXrxw0k11+n
fsk0RhgSkoCaZiCl7fLudlxJXSPSdx65y/5jm9h7roftX8YfqWMF2LygvRgbZWf7
AKeOF5Bw8X159p5KNAbb01CKg5UeHDKGBqvvDvcQhyPQedjWHg1UzjWQveASMXFN
b67k0nfTkJVCcfwXlAVxw3l36nd9rNuoZ91IjvZ/atOwhDiJGoewTxjvNBn9q1qz
+RrMBuicKongx0mPL10hURY6kD1L++i3bQEpJHQELh+jf0If2VXkSvnKAKWigaUY
vuwGg1hiHAX9ADg6gVu9DORYFPUmOpY6FbKA3DhkC+WzbnDVpDUbXdb41UR4DLNx
xbZdu8DeR3oSF+Sh9LJSoDdjFaqh7eK+iDSaKz58hHHQn3f3sOwFZebSrha1kSdK
4YeD0MAcorPqXYXVKqve87CAGFFeFTwty+BGd/niZAFpPc5IEt/FUqCQ+MqlsIyn
O56ZRfGWJWM82Bqc07JYOsTX6zE1jC2qTEUfqeTpShooMvRGZzn8Vz+QUX1JvcBl
1wkhZ+DVhp8E77YEjQUKJX9elJ4NHRaVQZWvFKKYPRqB583YYhR/aiFz9qDpuKzC
+VKVgBmM7/ShMO/hRYZrS606D5iJ9k+1ScgsMb2PCRU3UhPqWkvZJfb0nQbIoOvV
6cjzXCzLwEYGmC52YnpE
=sZVO
-----END PGP SIGNATURE-----

--a5lxixo24iqhcmfo--
