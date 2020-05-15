Return-Path: <SRS0=lCsO=65=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBAABC433E0
	for <linux-devicetree@archiver.kernel.org>; Fri, 15 May 2020 08:15:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AFFCA20657
	for <linux-devicetree@archiver.kernel.org>; Fri, 15 May 2020 08:15:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728019AbgEOIPj (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 15 May 2020 04:15:39 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:51987 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728000AbgEOIPi (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 15 May 2020 04:15:38 -0400
X-Originating-IP: 93.29.109.196
Received: from aptenodytes (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 6C5C51BF208;
        Fri, 15 May 2020 08:15:34 +0000 (UTC)
Date:   Fri, 15 May 2020 10:15:33 +0200
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Joerg Roedel <joro@8bytes.org>, Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <mripard@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        devicetree@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 5/5] drm/sun4i: mixer: Call of_dma_configure if
 there's an IOMMU
Message-ID: <20200515081533.GA2486@aptenodytes>
References: <cover.b27dedd61e008ffcf55a028ccddda3bb4d21dfc8.1589378833.git-series.maxime@cerno.tech>
 <9a4daf438dd3f2fe07afb23688bfb793a0613d7d.1589378833.git-series.maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="vkogqOf2sHV7VnPd"
Content-Disposition: inline
In-Reply-To: <9a4daf438dd3f2fe07afb23688bfb793a0613d7d.1589378833.git-series.maxime@cerno.tech>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--vkogqOf2sHV7VnPd
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed 13 May 20, 16:07, Maxime Ripard wrote:
> The main DRM device is actually a virtual device so it doesn't have the
> iommus property, which is instead on the DMA masters, in this case the
> mixers.
>=20
> Add a call to of_dma_configure with the mixers DT node but on the DRM
> virtual device to configure it in the same way than the mixers.

Although I'm not very familiar with the DMA API, this looks legit to me and
matches what's already done in sun4i_backend for the interconnect. So:

Reviewed-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Cheers,

Paul

> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/gpu/drm/sun4i/sun8i_mixer.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/=
sun8i_mixer.c
> index 56cc037fd312..cc4fb916318f 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> @@ -363,6 +363,19 @@ static int sun8i_mixer_bind(struct device *dev, stru=
ct device *master,
>  	mixer->engine.ops =3D &sun8i_engine_ops;
>  	mixer->engine.node =3D dev->of_node;
> =20
> +	if (of_find_property(dev->of_node, "iommus", NULL)) {
> +		/*
> +		 * This assume we have the same DMA constraints for
> +		 * all our the mixers in our pipeline. This sounds
> +		 * bad, but it has always been the case for us, and
> +		 * DRM doesn't do per-device allocation either, so we
> +		 * would need to fix DRM first...
> +		 */
> +		ret =3D of_dma_configure(drm->dev, dev->of_node, true);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	/*
>  	 * While this function can fail, we shouldn't do anything
>  	 * if this happens. Some early DE2 DT entries don't provide
> --=20
> git-series 0.9.1
>=20
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--vkogqOf2sHV7VnPd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl6+T6UACgkQ3cLmz3+f
v9H/UAgAkvadU2hkk0g8AzqD7A8wD9HZa1w2iDr5XqyJebfprIsxG8x5MpZWf9BQ
RTe1YsTxBBAeX49KifKGTI+TxipHj2A0Ebt9nIDUpP6vXQ7q/t24R8VhOeRiFLLM
Ke2pNX4F6XaV0CHM5YeQOp1OndJgZ1ioWlfqp+296kTRC1+8L7l6BPI1HkT8WVOi
mi8+8iBF3szadtkUm+h33BwKNxAnkWsybWK06pg+VNUT4dcld6RUH/c+XCFOr39j
2c617QVi3poan+h3psdcEFwnrbKwGyR8YsqHyBOwAZkW/2l4ItTUE3A6SFLKguca
BeSlxCAarYm3YuaLzCm6TgeX+7u68w==
=r6Qc
-----END PGP SIGNATURE-----

--vkogqOf2sHV7VnPd--
