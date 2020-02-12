Return-Path: <SRS0=LTWd=4A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C146CC2BA83
	for <linux-devicetree@archiver.kernel.org>; Wed, 12 Feb 2020 12:33:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 92C4D20675
	for <linux-devicetree@archiver.kernel.org>; Wed, 12 Feb 2020 12:33:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech header.b="cPCANA+V";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="sIPrVHJ5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725887AbgBLMdz (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 12 Feb 2020 07:33:55 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:47961 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727698AbgBLMdy (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Wed, 12 Feb 2020 07:33:54 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 15E0E21E6A;
        Wed, 12 Feb 2020 07:33:54 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Wed, 12 Feb 2020 07:33:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=DhfQozASIKv3tIps9I87RhAw2Ut
        NExqYX0UZp/I2UG0=; b=cPCANA+Vaf3+xLa3XA9eSBf8jHJhfe49CyrNgQFKlAB
        ruyjGqQsTR9wUuzI/TqxAgBsPnInWC17zw5xVvX2r2qL81YDp3pvncBedajfJOYh
        OBayJYwAnO+05pOnx/cUkZBXxIwXG41I1Lt7HkmpDvDW1fwLcL+rpzo0E+B8ij/n
        XRMAXobiko0MgQZgFKNF60sx4oNhuTbmBbvKFdHeTYSNbvowFuaM4XaW/ANp1Npy
        4s7BYcsc/CvTDQBXx1Rg5avORvKDcyNPIfdunrftFOwGaTBCk7O/hefyrCakJ3Bj
        30o61Y5DdLP/Vkc4Qtbd2rGGg0qJlZeqG77TVaCxtcQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=DhfQoz
        ASIKv3tIps9I87RhAw2UtNExqYX0UZp/I2UG0=; b=sIPrVHJ573R+yQXrnn0FTk
        VSUhoF7D4q/Z5tGH4SGiDVygEAgCIygUWy5F3DyLI34f+5srqrMTEpY7ZoqX08eA
        HvSOd4nknDvhWUWQGSLUB1m4OGWYka8Wf2Kp/LP5UgifG4EqAQdSe4d9Zu+ofR0k
        8WssrBqEAL7NuNWvZPNt8cOlNDZoT3hbAGqOMTc90lEcZY8eYywJKc7hXx9JEJ1Z
        4Uotvy3bT54QU51GQHtu5hKAB5W9DsPvboCMEjovuoTq7xYz+TjzPqP8fnQjn+X1
        NeYNtlt15X5i8Cu8Ecwb5orEIZWLsAOsn9MnXYz2UariE/jm0QaRRRscqd+TH+lw
        ==
X-ME-Sender: <xms:sfBDXpCyh879lwb3RxHFMKCnU_C78uJPSyh5oV0HwevcgZHT3Ptx8Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrieehgdegvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkphepledtrd
    ekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:sfBDXl5nmp_eGjMSEYVmFHCILZLWs3dYqZDmVlW62zlggxwSCat2AQ>
    <xmx:sfBDXnCd5k4jDT13m-wZCaGKjLTgogsd7WUQniRaw1P4l5VFXul6Yw>
    <xmx:sfBDXg8HxUHAce9m29D0R8bxZcNPUMFdyOrBJjkEs5PYFscktQ-SxA>
    <xmx:svBDXunP85bMFBLMLCKTMwp7igI-I5CGvdztB2nJpXrt0uNn4NegZg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 5C482328005A;
        Wed, 12 Feb 2020 07:33:53 -0500 (EST)
Date:   Wed, 12 Feb 2020 13:33:52 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Benedikt Spranger <b.spranger@linutronix.de>
Cc:     bage@linutronix.de, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 5/5] ARM: dts: sun7i: Add Linutronix Testbox v2 board
Message-ID: <20200212123352.ss3kc5yzcvdy2wyk@gilmour.lan>
References: <20200206113328.7296-1-bage@linutronix.de>
 <20200206113328.7296-6-bage@linutronix.de>
 <20200210075628.2oaa4xnvkwoxkpr6@gilmour.lan>
 <20200212122001.4fb6c2b7@mitra>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="a5qydz62cykhm3gq"
Content-Disposition: inline
In-Reply-To: <20200212122001.4fb6c2b7@mitra>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--a5qydz62cykhm3gq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 12, 2020 at 12:20:01PM +0100, Benedikt Spranger wrote:
> On Mon, 10 Feb 2020 08:56:28 +0100
> Maxime Ripard <maxime@cerno.tech> wrote:
>
> > > +// SPDX-License-Identifier: GPL-2.0-or-later
> >
> > Using a double license would be great, otherwise other projects
> > licensed under something else than the GPL might not be able to use
> > it.
>
> I don't get it, why GPL v2 is not adequate here...

*BSD for example can't include a file under the GPL. It's not that the
 GPL is not adequate, it's that the GPL + MIT is better, since more
 people would be able to use it.

But then, if you don't care, that's not something that will prevent
the patch from going in either, just something that you should
consider.

> > > +	leds {
> > > +		compatible = "gpio-leds";
> > > +		pinctrl-names = "default";
> > > +		pinctrl-0 = <&led_pins_lamobo_r1>;
> >
> > You don't need the pinctrl nodes at all for GPIOs
>
> I did not agree on that:
>
> The pincontrol configuration depend on the bootloader if you omit the
> configuration here. That may sufficient in most cases, but can cause
> unexpected behaviour after updating the bootloader or using kexec.

What configuration do you want to have enforced?

Maxime

--a5qydz62cykhm3gq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXkPwsAAKCRDj7w1vZxhR
xb1dAP9ng1mHKErwti2Jry+lMrLf/bgoxm6dSuGJloIpYS4q1QD/bMPTQyGFqrRW
nswQJFNCOM/7qqxfnAHFBONLDCDWTAY=
=fnrr
-----END PGP SIGNATURE-----

--a5qydz62cykhm3gq--
