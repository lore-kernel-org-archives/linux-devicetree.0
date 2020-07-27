Return-Path: <SRS0=xnVj=BG=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9726DC433E1
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Jul 2020 15:52:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 74FF3207BB
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Jul 2020 15:52:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech header.b="ixGxfPuv";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="XsUkdQHd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729350AbgG0Pwg (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 27 Jul 2020 11:52:36 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:50933 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728466AbgG0Pwg (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Mon, 27 Jul 2020 11:52:36 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id 4346A5804FA;
        Mon, 27 Jul 2020 11:52:35 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Mon, 27 Jul 2020 11:52:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=yRQPP6g5muRZYYQON1y3sN6Yh6q
        NLVGPrU54d2fUDTw=; b=ixGxfPuv6+H3FsDDsBUrQKkkLg7bn+klIXKUM/k3qXh
        x3BYJ3ecxLhUAlnIVtu/dPPe6pQPNuD2LMUvqmwO9TCTHaI68VewatS3IhGxB6iw
        0yVNi3US3zXNthXvNa95XvoMJSvsR9w1swCvTPMvQ5T4bYQ/jRuzTophWJC5mxqQ
        JtjshY+g1Nr3mAxK3oOzGMLMjMwz6dOB5TkuvKXrQqGj0SkUfwMtto5eqRSNcsV1
        jRT0EwNuX1WMBPH3fb3FjTCL8ErKQe/holE2QXKZbAbcCbgz9Qo3BfNipYuZcHQk
        FSaneB4+QGm+UDBXIWu5V4XXJpsoDSUSgT5GFbuTeTg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=yRQPP6
        g5muRZYYQON1y3sN6Yh6qNLVGPrU54d2fUDTw=; b=XsUkdQHdgXLAF32JLoBjo4
        ZqCHmL80XDMnRGwLJeOs/NNXexxtXjgESS5QMjXUJeeXOJjS1jlJc8ZioY9Xo0FE
        ERjuXLTZV1vz72VV3tslABL3Os9HHfPBOImCwFJ+H0bRZJHdBYXaD0zBX3YkIqHw
        0cwoiNXVnR4k+Iw3xDB/1nGSefhX33Y3NG28plbMi9IVU1b4xwY+w/LXig7REbsn
        uC4Pya1LO0il4TQN0pSyrW/EFGkPr/cGN6oFy9Ro5vDtgtOpHq0n7HMsNPrfkqmI
        pOej3ewqX4iaKjeXF0Ws2hnJc4JnxniMhNYmVJQeJlKBDi8Df/GvUgv43Iyl8fPw
        ==
X-ME-Sender: <xms:QvgeXzAnFYcQT1H0jtBT-QudsPbTbB3wFvt8svzkTE69ZTan9LzQyQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedriedtgdeliecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
    udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:QvgeX5jrbI1bjsZM8CZZQh_Ox2eB8fuOoNifs5nILHt9pLJ6v4jISg>
    <xmx:QvgeX-k3iwoh53U2Hn32tcOUWCBWd3XdTVvIGLiwRUScAdWp9zzxhg>
    <xmx:QvgeX1yQMW8OLDwc6FhI6bWlzJTQXKYr5TaQBZzOPVBWXig1vPah5w>
    <xmx:Q_geX9SLyHUWzuS2ezCtEubdXJrLVagxIszg9Y-_kga_A4YVK7WNQQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 2BB96328005A;
        Mon, 27 Jul 2020 11:52:34 -0400 (EDT)
Date:   Mon, 27 Jul 2020 17:52:32 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Mike Turquette <mturquette@baylibre.com>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        linux-rpi-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com, linux-clk@vger.kernel.org,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH] dt-bindings: arm: bcm: Add a select to the RPI Firmware
 binding
Message-ID: <20200727155232.a4ccxdjooa5vjbfy@gilmour.lan>
References: <20200626115433.125735-1-maxime@cerno.tech>
 <159554434893.3847286.8491922177659230646@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="cnvfzqh5i3kjod3a"
Content-Disposition: inline
In-Reply-To: <159554434893.3847286.8491922177659230646@swboyd.mtv.corp.google.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--cnvfzqh5i3kjod3a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 23, 2020 at 03:45:48PM -0700, Stephen Boyd wrote:
> Quoting Maxime Ripard (2020-06-26 04:54:33)
> > The RaspberryPi firmware binding uses two compatible, include simple-bu=
s.
> > The select statement generated by default will thus select any node that
> > has simple-bus, not all of them being the raspberrypi firmware node.
> >=20
> > This results in warnings being wrongfully reported. Let's add a custom
> > select statement to fix that.
> >=20
> > Fixes: 5bc0b9be8544 ("dt-bindings: arm: bcm: Convert BCM2835 firmware b=
inding to YAML")
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> >=20
> > ---
> >=20
> > The original binding has been merged through the clock tree, so it shou=
ld
> > be merged there.
> >=20
> > Even though the original binding (and the DT) are using the simple-bus
> > compatible, this creates some DTC warnings since the firmware really is=
n't
> > a bus, so the node name doesn't match what a bus should have, none of t=
he
> > children have a reg property, #address-cells and #size-cells are missin=
g,
> > etc.
> >=20
> > I can only guess that simple-bus was used to make the sub-devices probe,
> > but maybe simple-mfd would be more appropriate here?
> > ---
> >  .../bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml   | 9 +++++++++
> >  1 file changed, 9 insertions(+)
>=20
> Hmm. I'm still seeing warnings.
>=20
> Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.ex=
ample.dts:23.37-26.15: Warning (simple_bus_reg): /example-0/firmware/clocks=
: missing or emp
> ty reg/ranges property
> Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.ex=
ample.dt.yaml: firmware: $nodename:0: 'firmware' does not match '^(bus|soc|=
axi|ahb|apb)(@[0-9a-f]+)?$'
> Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.ex=
ample.dt.yaml: firmware: '#address-cells' is a required property
> Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.ex=
ample.dt.yaml: firmware: '#size-cells' is a required property
> Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.ex=
ample.dt.yaml: firmware: 'ranges' is a required property

Yeah, those are the warnings related to the issue we were discussing
with Rob. The patch should fix an hard error.

I'll send a followup patch for the warnings.

Thanks!
Maxime

--cnvfzqh5i3kjod3a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXx74QAAKCRDj7w1vZxhR
xYGrAP9Ni9TAwcktS86DHN6KA5JIf3rWa7BMB3kQEyzRqn8iEAD9EovEJz61mLgr
BWHTC1A9D+AO+4xo2pelFpdXuBiyTQc=
=CvaM
-----END PGP SIGNATURE-----

--cnvfzqh5i3kjod3a--
