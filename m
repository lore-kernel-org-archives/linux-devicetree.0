Return-Path: <SRS0=gY8B=4F=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A4D4C34022
	for <linux-devicetree@archiver.kernel.org>; Mon, 17 Feb 2020 17:43:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 70E21208C4
	for <linux-devicetree@archiver.kernel.org>; Mon, 17 Feb 2020 17:43:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech header.b="b0JTk3fp";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="1i5/8d8U"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729739AbgBQRnC (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 17 Feb 2020 12:43:02 -0500
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:33629 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728706AbgBQRnB (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Mon, 17 Feb 2020 12:43:01 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id 1AB224876;
        Mon, 17 Feb 2020 12:42:58 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Mon, 17 Feb 2020 12:42:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=LSh1lPCDqxLO7Bib4LTPMBWDfsX
        YnGwYBlDhYAcksF8=; b=b0JTk3fpnH2iEvcdnGSPGCzgWS4ca+cN7nDmuXFsV0S
        OWEG8L1FS5bSt1/CHbIkkdxHibHJxYdUO7LrBCLKNKlHy4it36RSWB949z4snssM
        v53A4n2KRwrX9EfFHyvAC5gcBqLJQ/B+nYuC71HgWY3dHQrr6QCbNg2RnX3kS+PP
        ONrQjLxRmBcJAeXzuQOtn8tK3rCvxi/t57k6oNBsgSTQvIiKgdfVexO8eMq5lPx+
        m3tHPtkSbxlU+WmLc2CrnF893fgsHBLCfA5CeHNNuB/HmC+oD8y0SlxLmuLSAPpW
        qpoGETK0LWPyIBPUyK0CCT4fklQqdLXrBS0ziJPX7Sg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=LSh1lP
        CDqxLO7Bib4LTPMBWDfsXYnGwYBlDhYAcksF8=; b=1i5/8d8UeLz8dClE3oGsmn
        lFQr0W0jozQM1AAid1YGPD1CEsNlvn0Qn0e469lXKMFAUbiCznsko4L4EByFfmMG
        79v3hlIoF13qUGbNSbaAN/Ii/Feiw67Esxb8tAtZB5XfEu+ODbde4dtwafketsmD
        ztJhHaOohxXo98uiFwDvjaqff1o6KOhYGRuJlcsBsVSa5kCl6kc6ieytjx3ZEofj
        SNvgh7HGN2jt/pMwx9IE0l+Ce2mAFfMfSmXvZKzi0N7sQgOaJeZAzTNolnZaz6RP
        NNJcUUSdsEG/j6BUqLYp/cK+hmnteBqlaiR6ZfAyeC5ET5rFgQlSGwXd10juoJ1w
        ==
X-ME-Sender: <xms:n9BKXuepCW-mHLb-2p1TtTR_BbrxpyeL9Wbdhz8Ibs2mTYEaeaOAsw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrjeeigddutdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltd
    drkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
    lhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:n9BKXsfW24k8ACvYT0625gyL6vS_efXRG1Ydu0NJblaqQvFzXcV1JA>
    <xmx:n9BKXqgpsIhvLY4lwotvOAfbTv0xW-AoM2yfxmJ5TTyOh5FJqfNDSQ>
    <xmx:n9BKXgS2TZ5HbQ0pIDUbkQaJGiH1rTWmuQhRyfrqQEb3V5bhSj94Tg>
    <xmx:otBKXkNji56iaFxQ7Oqv68jgbmGGBiS-InCCgRuUIpNNBwkhCyH-mw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id B8A8B328005D;
        Mon, 17 Feb 2020 12:42:54 -0500 (EST)
Date:   Mon, 17 Feb 2020 18:42:53 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Chen-Yu Tsai <wens@csie.org>, dri-devel@lists.freedesktop.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Sean Paul <seanpaul@chromium.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>, devicetree@vger.kernel.org,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: display: sun4i-tcon: Add LVDS Dual Link
 property
Message-ID: <20200217174253.mj53us4bb7h2lyca@gilmour.lan>
References: <20200214123244.109300-1-maxime@cerno.tech>
 <20200214131025.GI4831@pendragon.ideasonboard.com>
 <20200214154405.f5zuicm6uhhiczfs@gilmour.lan>
 <20200214154953.GJ4831@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="qacjjsbo4tknjumh"
Content-Disposition: inline
In-Reply-To: <20200214154953.GJ4831@pendragon.ideasonboard.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--qacjjsbo4tknjumh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 14, 2020 at 05:49:53PM +0200, Laurent Pinchart wrote:
> On Fri, Feb 14, 2020 at 04:44:05PM +0100, Maxime Ripard wrote:
> > On Fri, Feb 14, 2020 at 03:10:25PM +0200, Laurent Pinchart wrote:
> > > On Fri, Feb 14, 2020 at 01:32:43PM +0100, Maxime Ripard wrote:
> > > > SoCs that have multiple TCONs can use the two set of pins on the first TCON
> > > > to drive a dual-link display. Add a property to enable the dual link.
> > > >
> > > > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > > > ---
> > > >  .../bindings/display/allwinner,sun4i-a10-tcon.yaml         | 7 +++++++
> > > >  1 file changed, 7 insertions(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
> > > > index 86ad617d2327..aa6dd8409dbc 100644
> > > > --- a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
> > > > +++ b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
> > > > @@ -105,6 +105,13 @@ properties:
> > > >          - const: edp
> > > >          - const: lvds
> > > >
> > > > +  allwinner,lvds-dual-link:
> > > > +    type: boolean
> > > > +    description: |
> > > > +      On a SoC with two TCON with LVDS support, the first TCON can
> > > > +      operate over both pins sets to output in a dual-link setup. This
> > > > +      will be triggered by setting this property.
> > >
> > > Could you maybe provide an example of how this property is supposed to
> > > be used ? I'm especially wondering what ports are used in that case and
> > > how they're connected.
> >
> > It's pretty trivial to support, it's only a property to set on the
> > encoder node itself.
> >
> > I'm not really sure what you meant by your question with the ports
> > though :/
>
> I assume that, in the single-link case, you have two TCON instances that
> operate independently, each of them with one port that models an LVDS
> connection to a panel.

Indeed,

> In the dual-link mode, how does that look like ? Does the TCON
> instance that operate in dual-link mode have two ports in DT ? There
> are two physical ports, so I think it makes sense to always have two
> ports in DT. That's what we're doing for the LVDS encoders on R-Car
> Gen3, in order to specify in DT which LVDS input of the dual-link
> panel is connected to which LVDS output of the SoC. That allows
> configuring the LVDS encoder to send the even and odd pixels on the
> right port.

As far as I can tell, you can't control that in our TCON. It just on
more lanes, that's it. Also, we currently have multiple ports, to map
another feature of the TCON, which is that it can drive directly a
panel, or will send its output to the HDMI / TV encoders. Adding
another port in that will break the current binding we have.

Maxime

--qacjjsbo4tknjumh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXkrQnQAKCRDj7w1vZxhR
xYyzAP9aURz+zTYWHC5IhPxfSni9jc9Q1CStAZuL2lmltDlckwD/ev90hA7s+dfA
ovuGwNHceNKd9m5Ieuk4gimi8XgkbgA=
=33cs
-----END PGP SIGNATURE-----

--qacjjsbo4tknjumh--
