Return-Path: <SRS0=XaEl=A3=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 438F2C433E7
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jul 2020 08:32:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 219182064C
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jul 2020 08:32:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech header.b="ALJ5msOW";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="YzIouSFv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728103AbgGPIcv (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 16 Jul 2020 04:32:51 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:50793 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725950AbgGPIcu (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Thu, 16 Jul 2020 04:32:50 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id D40CB5C0118;
        Thu, 16 Jul 2020 04:32:48 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Thu, 16 Jul 2020 04:32:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=TFtT7aTdKZgtESQriZDeuCMIw0H
        duMNzVJoVvybcYqM=; b=ALJ5msOWK/FlPRhE3CPDKFNXRF4K1nUYgzMPbNvj5ga
        Tg6fiTqzMAOX3T/am1SZwbkX2zofHGABlMI0a4zNGnZ/Hv/f7h5+8BUyYyQEyUcA
        2z0f9o/waejVjIR5mh6sC6qCsVdxf3Fd8NsBVGAXB2Bp4+cZ/I6Z/fmD9WghKOGA
        8moPorUsMI6LhqZsy4Lw/RRIpRUMdfrUtXz6+9eju4xEeGkKEHZBUCSJ1w1TY9GG
        TqkqjmFVwUypLpCeWez5UHkPCSzeEgGDWoM3DLm3fb2QndN0rvDjtlxf1zCpH3Sm
        eIaZaUij/fFfFlmA1iqCC7lYSlMzeObqZMWAI11CvVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=TFtT7a
        TdKZgtESQriZDeuCMIw0HduMNzVJoVvybcYqM=; b=YzIouSFvMTeDRpFb9kzuEd
        qFDs+8POp2upcjDSBaScLwc27kgel3HBupj/Jgh4DzwvGz+Qt5cPqvZmOZIiSlhn
        YJkOEDzou6/fjDrJmLnUQvNleZRjVTLWlQcYEVR1no3R+ftNWL0smPDmX9Br5pCM
        WY0pDpapdv49IKKaoyVGFva/zG3Au981q0lWCf60RnvKwCREK/rldVgK6I6VHKmm
        r+ChxOzYYgiZ6JUpMgWD8EQDX3kKMIcOYMvN3L2ZBWtHzLjDUZKu4U+lEsxoz4Q0
        oW85AJwKP0+m+fm5aRSkbG3AMD0l5W1feMkOqIRhOgzeSgpCVOoikFK6uIR7k3Xg
        ==
X-ME-Sender: <xms:rxAQXxU6c5qq5X__rN07_VtN-Idm2dp-JQxsa_sCW68QBYRiDdW5kw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrfeeggddthecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
    udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:rxAQXxm1kFLZmgKIgJXzWChmUnFzCWHWckYEtO5KGnQhbx33MQGaTA>
    <xmx:rxAQX9bpvcKJwqiDGrWRrut1WSvlCKeUHjiGgrjBjMGtG7_MxATTcw>
    <xmx:rxAQX0VAHvVjbAfNDW9fXdieg1HmWYGKgPrzeOnfu1G9_SOm7dlCuw>
    <xmx:sBAQX6sr8uzapKswt0Cmu5R77fr69-N2fyuUk0D_3Hxwee0eNbzImw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 7890B3280059;
        Thu, 16 Jul 2020 04:32:47 -0400 (EDT)
Date:   Thu, 16 Jul 2020 10:32:45 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] dt-bindings: display: sun8i-mixer: Remove duplicated
 'iommus'
Message-ID: <20200716083245.5qlzwo6j5male6bt@gilmour.lan>
References: <20200710203124.20044-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="wec3tpfrd2m3ywlj"
Content-Disposition: inline
In-Reply-To: <20200710203124.20044-1-festevam@gmail.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--wec3tpfrd2m3ywlj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Jul 10, 2020 at 05:31:24PM -0300, Fabio Estevam wrote:
> Commit 13871279ff5c ("arm64: dts: allwinner: h6: Fix Cedrus IOMMU usage")
> introduced a double instance of 'iommus' causing the following build
> error with 'make dt_binding_check':
>=20
> found duplicate key "iommus" with value "{}" (original value: "{}")
>   in "<unicode string>", line 45, column 3
>=20
> Remove the double occurrence to fix this problem.
>=20
> Fixes: 13871279ff5c ("arm64: dts: allwinner: h6: Fix Cedrus IOMMU usage")
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Sorry for that, I've amended the original commit to move it into the
proper binding.

Thanks for reporting

Maxime

--wec3tpfrd2m3ywlj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXxAQrQAKCRDj7w1vZxhR
xR0fAP9rxkCt7Err/GH+ciK0u0klTcNueGukHR/VHtbZldqLjwEAz/BB114cE9aa
d5T3/rIl6WZtmD4NH4Gnx/9b67n7Bwc=
=qx7t
-----END PGP SIGNATURE-----

--wec3tpfrd2m3ywlj--
