Return-Path: <SRS0=KHEV=2G=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FCFFC43603
	for <linux-devicetree@archiver.kernel.org>; Mon, 16 Dec 2019 10:58:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6CE5D20700
	for <linux-devicetree@archiver.kernel.org>; Mon, 16 Dec 2019 10:58:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech header.b="IMLrsBod";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="q+xW6eiN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727506AbfLPK6c (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 16 Dec 2019 05:58:32 -0500
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:58445 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727403AbfLPK6b (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Mon, 16 Dec 2019 05:58:31 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id 5EA5E7118;
        Mon, 16 Dec 2019 05:58:30 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Mon, 16 Dec 2019 05:58:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=7E2TpTwENCgP1MRD7/Eziybb/Th
        2bGLOCc12fC88q6E=; b=IMLrsBodXXXGicPZCQDlL4YhxJ8yYXkJiGeQPJQQwf4
        cvkx9X6OxYx4AIhSKnPbdJllQHaNKzzF32/qX58QgboLLpEQjhHszLxaPpdgMMqV
        5jwKe1BCnPBcTCzsnR03dumppfba/ket7EzIV/vDMcpIzk6A9IEqm5vtpgGTV0is
        zhsxVo69knhpEPIVcq8TwJ3MXG2+XWNQp+POUAs1H0De5zyyiyMRlkSCghfcP6au
        1A6KiA/ogyumRutouWKKu8dAEzQyxprg9hq1qJbuVHeCMMxACjaQnueTYxbD/Xbp
        1EaHOWLopra/MTOUFxZc/cLJR14aFWEUPkFkB2CgpAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=7E2TpT
        wENCgP1MRD7/Eziybb/Th2bGLOCc12fC88q6E=; b=q+xW6eiNUtLhXYj2T6MpV1
        DO8WdVfGXHlYR8Od+K4ZToowmTlu5f3/0IOeXhM0VokgQyeONZ1a7SFy1qvQ09sS
        RJo277PYsWoBr9JZzYUX1G8wrKf8zaGzsV3XCIqtSdwweXbLBWtRqbsDZDQyVKT8
        BBUNVnMhxMxo6H0jMMQkFW58R8n+XHpB9KIkoJH+b3JN5yZPUEtHDIGdPI5GMBV/
        YEWDRRva+BF230lJgh67fWaDUDKu+WGR40H/0ooi009xOpo+5NNKgJ0NOx8/e41Q
        pUtQwoztthAvbEQgK30HoL9BjVCTgbU5uRqaC5EzMJnejxYGnCQB2JqhHaGLlKxw
        ==
X-ME-Sender: <xms:VGP3XUY8i-9w8CG05Yj5PzjIikoPOmggk-UF_ctcBee-8Lck051Ulg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvddthedgvddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltd
    drkeelrdeikedrjeeinecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggv
    rhhnohdrthgvtghhnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:VGP3Xbt6ohxrttMcaXVI6FmO7AAaqrpN7X7GqTN0Wk7tLzLIlYh-yg>
    <xmx:VGP3XRtN1Yg5tIbLqODohz6GBDmEP1smxIZbRdwPBUzowBcnBB7ffA>
    <xmx:VGP3XQe2jz2UyPBCXhDoFD1nNHKHF_HUD8nsB_jR_XrJ_cT8fDkXMA>
    <xmx:VmP3XVbpO_j_XIh2rB_1sEeclFhYceWTGR5NP61U8O2Mv5Qzxs8Stw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 690A280063;
        Mon, 16 Dec 2019 05:58:28 -0500 (EST)
Date:   Mon, 16 Dec 2019 11:58:27 +0100
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
Message-ID: <20191216105827.rxkfbwemkqw446jx@gilmour.lan>
References: <20191213181051.25983-1-miquel.raynal@bootlin.com>
 <20191213181051.25983-10-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="akf2tzjwfz7nnjic"
Content-Disposition: inline
In-Reply-To: <20191213181051.25983-10-miquel.raynal@bootlin.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--akf2tzjwfz7nnjic
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Fri, Dec 13, 2019 at 07:10:48PM +0100, Miquel Raynal wrote:
> +static int px30_lvds_grf_config(struct drm_encoder *encoder,
> +				struct drm_display_mode *mode)
> +{
> +	struct rockchip_lvds *lvds = encoder_to_lvds(encoder);
> +	u8 nhsync = !(mode->flags & DRM_MODE_FLAG_PHSYNC);
> +	u8 nvsync = !(mode->flags & DRM_MODE_FLAG_PVSYNC);
> +	u8 ndclk = !(mode->flags & DRM_MODE_FLAG_PCSYNC);
> +	int ret;
> +
> +	if (lvds->output != DISPLAY_OUTPUT_LVDS) {
> +		DRM_DEV_ERROR(lvds->dev, "Unsupported display output %d\n",
> +			      lvds->output);
> +		return -EINVAL;
> +	}
> +
> +	if (nhsync ^ nvsync) {
> +		DRM_DEV_ERROR(lvds->dev, "Unsupported Hsync/Vsync polarity\n");
> +		return -EINVAL;
> +	}
> +
> +	/* Set format */
> +	ret = regmap_update_bits(lvds->grf, PX30_LVDS_GRF_PD_VO_CON1,
> +				 PX30_LVDS_FORMAT(lvds->format),
> +				 PX30_LVDS_FORMAT(lvds->format));
> +	if (ret)
> +		return ret;
> +
> +	/* Control Hsync/Vsync polarity */
> +	ret = regmap_update_bits(lvds->grf, PX30_LVDS_GRF_PD_VO_CON0,
> +				 PX30_LVDS_TIE_CLKS(1),
> +				 PX30_LVDS_TIE_CLKS(1));
> +	if (ret)
> +		return ret;
> +
> +	/* Set Hsync/Vsync polarity */
> +	ret = regmap_update_bits(lvds->grf, PX30_LVDS_GRF_PD_VO_CON0,
> +				 PX30_LVDS_INVERT_CLKS(1),
> +				 PX30_LVDS_INVERT_CLKS(nhsync));
> +	if (ret)
> +		return ret;

I don't know the hardware but it seems pretty weird to me. hsync and
vsync in LVDS are not clocks (or even signals), they're a bit in the
payload. Is there any explanation in the datasheet (or even a
datasheet in the first place)?

Maxime

--akf2tzjwfz7nnjic
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXfdjUgAKCRDj7w1vZxhR
xRBYAP44GLCelEvFF7JRcxbERsDpTT+xk8XxtfgoWUly8jPqegD+Jrne3aLXYopK
ogFPLh6TeB2oQ1+pAWNgKDtT5Zntxwo=
=SVmk
-----END PGP SIGNATURE-----

--akf2tzjwfz7nnjic--
