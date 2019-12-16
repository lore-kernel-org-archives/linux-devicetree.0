Return-Path: <SRS0=KHEV=2G=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6330C43603
	for <linux-devicetree@archiver.kernel.org>; Mon, 16 Dec 2019 11:14:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8CB8420674
	for <linux-devicetree@archiver.kernel.org>; Mon, 16 Dec 2019 11:14:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech header.b="QQ+dte4f";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="D9CpUbS2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727086AbfLPLOp (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 16 Dec 2019 06:14:45 -0500
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:53789 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727059AbfLPLOl (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Mon, 16 Dec 2019 06:14:41 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id 4F5976688;
        Mon, 16 Dec 2019 06:14:40 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Mon, 16 Dec 2019 06:14:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=6wtEAOA9zEAjBqSIrctunRBYYSQ
        b5Glee85EEArhRIg=; b=QQ+dte4fenHJ/naMFXR/2rJBYhoA5yenpYglspuOyZ5
        ZE8Si4su1rjLMlbd79tR2adUzkVlDRdEnpJClo7kbjdSm/YAB47vMVK4JWR21bdU
        kol3RipmAKIqAr63myjA+j4HBg3hOynwLcmJR5aOmvvJyPC4J9ygdsfYdtxX+Mft
        IVXURlXC+RPzzfrMll02epZuDbHIbwuqZBCbg6BWH8ESJ1S3HcFVKdEfwJ3RkoxO
        UdU4wgJG7kzkpGoVgNEPpn+sho9VqV8g/t4368yv9r8epeMH5Q0xOCiR2TEbVlVv
        d8cWK9t48RnrBuve2Z690Z1NkuBUtUW+zj2oogs3i/g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=6wtEAO
        A9zEAjBqSIrctunRBYYSQb5Glee85EEArhRIg=; b=D9CpUbS2MR2NrbgEKUpd3r
        3553/A7UXfd8QWqnnjZMUl8WtV7A1bKW0GnFN8ZdKkpT+jDMAufZOtxQIS4GTmHS
        FG924bw4svhU+lkZm72RQLa//k3wPYvwbCAAAf6cjjmFzS2Ea0DVigdHOFVH7s3H
        RVMDgpUTV/2ttrzk4sYdXS+sF4+ZoxbqcagpY/5JSrFt9oW8o3cwzqFHuQGL1jHB
        LMjJMDiq0PrDnysVugV/Ee5z2mlQgKtA5umwcZvKa5Veqhrt/tdmyrFmeyY+o74t
        gRQfZQkqUFCiKGvj8yHcYvaVosoDQfscfC4XTb6k1ppCORShGEGiETbGj9MXCYqg
        ==
X-ME-Sender: <xms:Hmf3XR4U0X52qKZRYc29zdmO7tX8l7uf4MII9BZSnUBdZtOHbFs8OQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvddthedgvdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltd
    drkeelrdeikedrjeeinecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggv
    rhhnohdrthgvtghhnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:Hmf3XR-GNZfv0lLZ1VFQD0DMQfuxMnPt3WArhYHR06Abs9EftgFgaw>
    <xmx:Hmf3XTHN-1r0Euo-LbMyBv2L0C2BTkZ1fSJQlbrHCZ2PEUGTF5fCew>
    <xmx:Hmf3XWXbvncf3_-rzz9IlVAb3JkNcFc2xhGidGJpqrF2MkhkTSRN2Q>
    <xmx:IGf3XVOI0leesD0cM5hYoV_V3UHVuNrXFxbcFvZquKkN8sohfa0aTA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id EC21A80061;
        Mon, 16 Dec 2019 06:14:37 -0500 (EST)
Date:   Mon, 16 Dec 2019 12:14:36 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
        linux-rockchip@lists.infradead.org,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Sandy Huang <hjc@rock-chips.com>,
        linux-arm-kernel@lists.infradead.org,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 09/12] drm/rockchip: lvds: Add PX30 support
Message-ID: <20191216111436.wzoq33gvt42w6gqj@gilmour.lan>
References: <20191213181051.25983-1-miquel.raynal@bootlin.com>
 <20191213181051.25983-10-miquel.raynal@bootlin.com>
 <20191216105827.rxkfbwemkqw446jx@gilmour.lan>
 <20191216120312.4aa478da@xps13>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="qqehoburp6qkbata"
Content-Disposition: inline
In-Reply-To: <20191216120312.4aa478da@xps13>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--qqehoburp6qkbata
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 16, 2019 at 12:03:12PM +0100, Miquel Raynal wrote:
> Maxime Ripard <maxime@cerno.tech> wrote on Mon, 16 Dec 2019 11:58:27 +0100:
> > Hi,
> >
> > On Fri, Dec 13, 2019 at 07:10:48PM +0100, Miquel Raynal wrote:
> > > +static int px30_lvds_grf_config(struct drm_encoder *encoder,
> > > +				struct drm_display_mode *mode)
> > > +{
> > > +	struct rockchip_lvds *lvds = encoder_to_lvds(encoder);
> > > +	u8 nhsync = !(mode->flags & DRM_MODE_FLAG_PHSYNC);
> > > +	u8 nvsync = !(mode->flags & DRM_MODE_FLAG_PVSYNC);
> > > +	u8 ndclk = !(mode->flags & DRM_MODE_FLAG_PCSYNC);
> > > +	int ret;
> > > +
> > > +	if (lvds->output != DISPLAY_OUTPUT_LVDS) {
> > > +		DRM_DEV_ERROR(lvds->dev, "Unsupported display output %d\n",
> > > +			      lvds->output);
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	if (nhsync ^ nvsync) {
> > > +		DRM_DEV_ERROR(lvds->dev, "Unsupported Hsync/Vsync polarity\n");
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	/* Set format */
> > > +	ret = regmap_update_bits(lvds->grf, PX30_LVDS_GRF_PD_VO_CON1,
> > > +				 PX30_LVDS_FORMAT(lvds->format),
> > > +				 PX30_LVDS_FORMAT(lvds->format));
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	/* Control Hsync/Vsync polarity */
> > > +	ret = regmap_update_bits(lvds->grf, PX30_LVDS_GRF_PD_VO_CON0,
> > > +				 PX30_LVDS_TIE_CLKS(1),
> > > +				 PX30_LVDS_TIE_CLKS(1));
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	/* Set Hsync/Vsync polarity */
> > > +	ret = regmap_update_bits(lvds->grf, PX30_LVDS_GRF_PD_VO_CON0,
> > > +				 PX30_LVDS_INVERT_CLKS(1),
> > > +				 PX30_LVDS_INVERT_CLKS(nhsync));
> > > +	if (ret)
> > > +		return ret;
> >
> > I don't know the hardware but it seems pretty weird to me. hsync and
> > vsync in LVDS are not clocks (or even signals), they're a bit in the
> > payload. Is there any explanation in the datasheet (or even a
> > datasheet in the first place)?
>
> There is no explanation about this in the PX30 TRM part 1 (public). But
> you are right the naming is weird. Could the "tie clocks" thing above
> mean something to you/people knowing the LVDS world?

I have no idea what that could mean :)

Maxime

--qqehoburp6qkbata
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXfdnHAAKCRDj7w1vZxhR
xZyOAQDhVHd0nWPr1azNDyQKN7iIgKm2Ki+H9zu+7Qomae56GgD/XQNyQoHH9Lfw
mc376rXeaH4JqVQjDhawWMIIG6U/dAw=
=keFX
-----END PGP SIGNATURE-----

--qqehoburp6qkbata--
