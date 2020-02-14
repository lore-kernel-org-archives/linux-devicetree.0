Return-Path: <SRS0=lsCC=4C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 391ADC3F68F
	for <linux-devicetree@archiver.kernel.org>; Fri, 14 Feb 2020 15:44:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0B3A024680
	for <linux-devicetree@archiver.kernel.org>; Fri, 14 Feb 2020 15:44:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech header.b="k+dQmLVj";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="rIA7N4Tg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728791AbgBNPoK (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 14 Feb 2020 10:44:10 -0500
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:35693 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728529AbgBNPoK (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Fri, 14 Feb 2020 10:44:10 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id 40E905CD1;
        Fri, 14 Feb 2020 10:44:09 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Fri, 14 Feb 2020 10:44:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=n5v7Ksf5fN+HGYZQY4Cr6/EpGn+
        eFDk1rQovPH6zOQU=; b=k+dQmLVjp1h/yH4XaeEmVKsC8XumRaOXMNNVI1cAaOI
        uVDVHEwtAtIDB4hEB2Popc9ifkFA4dteIs/9nbd2RMvo40dmSBxaFJzbS+oa2gvW
        7UiMSSe3GRgN91WEOuZ6Xz9JOuPKjWENc3xQhOTaGEIlG/JKPEEvce0/PSa9Eg9P
        O4uPJ7DbxXrCAyoMzCNYRZO8sxDihm+p5fR5SjPWlLvhicYiCuTjqMxjBxNJBOeN
        viet7Cgi18ytKXsrZpVm+6cl79xYBiZ57o/axsPEEOTmJs+RWgOzXir+7xOV9XL0
        scedVSGvykOerXakEMOaA3/iYkZ+vGvH/XMiIQOwTJQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=n5v7Ks
        f5fN+HGYZQY4Cr6/EpGn+eFDk1rQovPH6zOQU=; b=rIA7N4TgCEXQwu43DKUW2L
        W4++wGCiAERQclPw/7jCi/4LxxIpBDbsWUhz2Bf8azP+AUkSt+9Y3xQrHditj2pQ
        uAJrx0xSRzp+moxYhgCPi8D5/kJkviLEKLScvhUZrcOZ8zad3RruSLo+pyGynmkH
        u1ZfpsDKfPiBPiUaZXP4e9TvxR5yqgXJ9Md4+LyRp06TP/5nd/l9IAkhw52WJEyw
        2Z56cPbIW+XbzKpfH3Sqe3ukv8ojpGkZEgiF9oWYLOrs6rdAPPPV1LdD6Aeu/Cr/
        PAOS9R1KQPhuUa614o9nCmt6ln5+zBK2QcmBLuh2pEV9kxoPyZB2mOSb1a54KT1Q
        ==
X-ME-Sender: <xms:R8BGXrT0Z-LrkYPf54YX95PM3kh0W0mk0CCcITPa8_Hvzi8QGsl8PQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrjedtgdekudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkphepledtrd
    ekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:R8BGXvvKwDo-3MEP4nIBCAsXoc1LBpljPg3kX3YUlAGQpXApwUL41g>
    <xmx:R8BGXkNWpig5YSHaEkc9zD-IcbYVcAO5yuZtUUlZ-m-b46PgjX2C8Q>
    <xmx:R8BGXijZhTpEesb32RwtqSX5HFkfNgzcVCAKoNw5nw-6SvAFI5TOVA>
    <xmx:ScBGXphAPunMvxwS9HvlUFBGO3sk2OaMZiwuMs5fA-XN0hEjfpHlVw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 20A1530606E9;
        Fri, 14 Feb 2020 10:44:07 -0500 (EST)
Date:   Fri, 14 Feb 2020 16:44:05 +0100
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
Message-ID: <20200214154405.f5zuicm6uhhiczfs@gilmour.lan>
References: <20200214123244.109300-1-maxime@cerno.tech>
 <20200214131025.GI4831@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ocew46sopze2pn2e"
Content-Disposition: inline
In-Reply-To: <20200214131025.GI4831@pendragon.ideasonboard.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--ocew46sopze2pn2e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Laurent,

On Fri, Feb 14, 2020 at 03:10:25PM +0200, Laurent Pinchart wrote:
> Hi Maxime,
>
> Thank you for the patch.
>
> On Fri, Feb 14, 2020 at 01:32:43PM +0100, Maxime Ripard wrote:
> > SoCs that have multiple TCONs can use the two set of pins on the first TCON
> > to drive a dual-link display. Add a property to enable the dual link.
> >
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > ---
> >  .../bindings/display/allwinner,sun4i-a10-tcon.yaml         | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
> > index 86ad617d2327..aa6dd8409dbc 100644
> > --- a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
> > +++ b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
> > @@ -105,6 +105,13 @@ properties:
> >          - const: edp
> >          - const: lvds
> >
> > +  allwinner,lvds-dual-link:
> > +    type: boolean
> > +    description: |
> > +      On a SoC with two TCON with LVDS support, the first TCON can
> > +      operate over both pins sets to output in a dual-link setup. This
> > +      will be triggered by setting this property.
>
> Could you maybe provide an example of how this property is supposed to
> be used ? I'm especially wondering what ports are used in that case and
> how they're connected.

It's pretty trivial to support, it's only a property to set on the
encoder node itself.

I'm not really sure what you meant by your question with the ports
though :/

Maxime

--ocew46sopze2pn2e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXkbARQAKCRDj7w1vZxhR
xWgZAQCoX6IPh3nfofCSZf7uxIEwmYH/acb4D64t70G8fNoW4AEA0scufZoOcED6
nd6GkciRxgxAXhF3LhkXYBnzHA7tnQY=
=1YtU
-----END PGP SIGNATURE-----

--ocew46sopze2pn2e--
