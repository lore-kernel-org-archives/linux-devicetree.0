Return-Path: <SRS0=LTWd=4A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD871C2BA83
	for <linux-devicetree@archiver.kernel.org>; Wed, 12 Feb 2020 12:26:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 822812073C
	for <linux-devicetree@archiver.kernel.org>; Wed, 12 Feb 2020 12:26:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech header.b="nn755Fs0";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="LJKj3JHk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727279AbgBLM05 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 12 Feb 2020 07:26:57 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:54261 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727007AbgBLM05 (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Wed, 12 Feb 2020 07:26:57 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id C54BA21AD0;
        Wed, 12 Feb 2020 07:26:55 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Wed, 12 Feb 2020 07:26:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=R8BaImdLtKNg2nwHCuE/bNL1sw4
        bextDRHjslXGJ9tI=; b=nn755Fs0ak4YnEY3mzos5hY5/JDcV0Nkyco5nnHolp9
        GMb6NdBzaSmCZezHWprjwIjPIdmI11TbirM9f4YnkF7DBqYHK4+rVDfwt++vXXp3
        lvfIYe9FBNroqaXuOcFlcsAZJIxCRJ0i5FZpGXccPkz4KS3CIzjFEY79fLFkKXy+
        9ywpbYE3uMth1e6REPx/VphRmO81Fo/YAqVxTmRps9Il/xM3UKf5Dm9awiNVcwr+
        86cmt15sI6jZW24JL4A6s1n2bghdSfaVD+/AALawZafk2Uq1PFJeDm2MxEmUqMiF
        nLRrY5quf0mKSQZM79Y9LI8sHJ7YYIvFyAN5QndLyfA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=R8BaIm
        dLtKNg2nwHCuE/bNL1sw4bextDRHjslXGJ9tI=; b=LJKj3JHkKU97UCqE3/az8m
        /vZq4J3ahtht7Z1Qj+ozWgEBCaofXrp/UbW9eVEby5E1jtm7G/rzhK4Z0Nx0dpiM
        zikillVbF/1sM0o2O5vrXMhLdslxRwkU4KBGWdAgtaQneEQdG8o4vBn6cyDrUoZp
        nZkNSiq66xV3ZMOUFLxYm2mPmVbVHGdO/bdOAC+xKqWQ8uEtS3tprNxxsVJXTInh
        X7OZqDTEfNOTwU9iLnlZWlV2lPkhIuahO2vS/j4yB9kb1RHz6o58i0uMvmFyBEdm
        Pnn5wur0NPXs2P1dIN9OW5Z5tFQEtsnZuP56p6GcJRCfxcMxOqb1JJWizTMVU2wg
        ==
X-ME-Sender: <xms:D-9DXhvddSe_3q6ZtHtUflZ9ER0pZpspe2vk869_efSO7MnprGJOJg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrieehgdegudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkphepledtrd
    ekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:D-9DXo1QLER88PvBs18XlEebzHj5wONrRy1DiwtQOJYosPgfunb5cA>
    <xmx:D-9DXgyzpNqBUth0-QRmXcZw8bxkrVFXzM-r0S624cnVTC7dwT4ZwQ>
    <xmx:D-9DXrWaaEjI6ZebmNSpXPVyNVaCsmfSJN_w_r2KDAbpiY7oOt3rFw>
    <xmx:D-9DXjUdstJwKf7Dl4_29H_phJS6yX_wh91YJMy0ymTLI0uPXL33tw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 27E5F3280063;
        Wed, 12 Feb 2020 07:26:55 -0500 (EST)
Date:   Wed, 12 Feb 2020 13:26:53 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Benedikt Spranger <b.spranger@linutronix.de>
Cc:     bage@linutronix.de, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 4/5] ARM: dts: sun7i: lamobo-r1: Split out commons
Message-ID: <20200212122653.3tkwkzaforapvu7l@gilmour.lan>
References: <20200206113328.7296-1-bage@linutronix.de>
 <20200206113328.7296-5-bage@linutronix.de>
 <20200210074525.xloszrupb37gcl6p@gilmour.lan>
 <20200212110150.2f09d7bf@mitra>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="qratdvoevrkd22np"
Content-Disposition: inline
In-Reply-To: <20200212110150.2f09d7bf@mitra>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--qratdvoevrkd22np
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 12, 2020 at 11:01:50AM +0100, Benedikt Spranger wrote:
> On Mon, 10 Feb 2020 08:45:25 +0100
> Maxime Ripard <maxime@cerno.tech> wrote:
>
> > Looking at the board, it looks like it's just a daughter board to the
> > lamobo-r1?
> It is a daughter board.
>
> > If so, you can just include its DTS directly, there's no need to
> > create a DTSI (an overlay is an option as well).
>
> Weighing up to include a DTS and overriding nodes versus splitting
> out the commons into a DTSI let to the latter:
>
> Overriding DTB nodes is a mess since it makes it unnessesarily complex
> to understand what happens and is hard to debug. I spend quite some
> time of my life to get a clou, why a DTB of a board is messed up and
> why changes got lost. Including DTS files is a matter of taste and none
> of my flavors.

I don't get it. If it's a daughter board, there's nothing to override,
right?

> Overlay would be an option, if there is a way to load the overlay
> without touching the bootloader or during kexec.

I mean, an overlay is strictly equivalent to including the DTS, so why
are you ok with an overlay and not including it directly?

Aside, U-Boot is able to apply overlays to the device tree before
booting the kernel, you just have to change the boot command a bit.

Maxime

--qratdvoevrkd22np
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXkPvDQAKCRDj7w1vZxhR
xXjRAQCxRiB1CH4YxerOPw9U6nX+EYaW6MEoM3x272Ez8/waOgEA4MRu+UojAW3D
1yKqsSXf8IYHq+SAiDYjxRba5MKzuwo=
=ZNCN
-----END PGP SIGNATURE-----

--qratdvoevrkd22np--
