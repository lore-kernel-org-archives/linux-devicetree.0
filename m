Return-Path: <SRS0=21hy=4I=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5F54C11D15
	for <linux-devicetree@archiver.kernel.org>; Thu, 20 Feb 2020 17:53:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7600A24673
	for <linux-devicetree@archiver.kernel.org>; Thu, 20 Feb 2020 17:53:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech header.b="f1hD521j";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="AgvqZ90L"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728356AbgBTRxN (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 20 Feb 2020 12:53:13 -0500
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:33463 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728517AbgBTRxN (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Thu, 20 Feb 2020 12:53:13 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id 6AF3F45C6;
        Thu, 20 Feb 2020 12:53:11 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Thu, 20 Feb 2020 12:53:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=/ilAHo2sD8DPbarnR+eiZM1rIcY
        n1q22Nc/a+Tg05HI=; b=f1hD521jZfmjXhb2Ix5sj5gSKqUVPAXbw6V3y9kE6to
        Cll7dmh1ytx1gz0v7/WzNRkO017HHxEVzRsEfZYA36oZWZ9toV3BM/IW2c5nah9B
        1WCwYv2NVPAqppW5jUf3IAiX61sG0O4PTWthwM/vEsZAy6FT4JCUb9y/x+tVaLaG
        m44s7f5lD10J/Jpw0zSIiaypESbdgai2wam5PUGGo67kBVdY7Vcdvp2i0opakcCe
        FIKrdBRtMs6kBBm/ZOlOUZefss7+jVUzBrGzpDzbWHAK30uudPdUeh1PD+qYfS2S
        tlIpYlLjfroJrQcomnBnmLa83nQ4+tu09px9McT3BQg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=/ilAHo
        2sD8DPbarnR+eiZM1rIcYn1q22Nc/a+Tg05HI=; b=AgvqZ90LDH3mg6xf3AmP0+
        8lLwrAeegt4SKMn8A9U5nzO399hyVW11EKkH1o0+cMXq1hWPHEQ16kW/VNFhWFOZ
        wYwfEDJnszpJDMOfr09xeV4PKlpQ2z0X1jsfMG4aohU/gV5ORABH9wiMnoPX4ZiM
        lDgJ9zZdXmv/wIPHDOMwkurMPHQmtfU7TvzemD/65KJs+7ZtRXGp+UkjbnxzwQg2
        EFWkjx53S5gNm+pgmSnYRhFO2TAMGAPW3QBwJV6/+HUWm4FBBcA2/A+q6egp0Y+r
        y8XzF1e8cyQshaRYFQmgayC16/yG33jLyGj/SJH9+NVkiLlMUXOqoVDr33ePFdiw
        ==
X-ME-Sender: <xms:hcdOXrHALdbQKHZDF-p5-V8U6h6NgOsgZV7Wlr5no_8FOvCfK5aSlg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrkedvgddutdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltd
    drkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
    lhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:hcdOXsmtwDvPaLgeLEHxx2j4cLwJjScGaARsUg-I99Jqz_bs0ve5fw>
    <xmx:hcdOXguIyRKNu6lVir6e10c7mhQS-VgW-Alp2MxTtX_o-8p7Eg6heg>
    <xmx:hcdOXoPfWFzbyApop1EhhdLZpJ6CPfeQ3lfOKDQzHO90pEWhXT9g1Q>
    <xmx:h8dOXkkOITkjN6nbD5jPx4U_IsLY2jD4xnSKGOWk05WsgkQcD2MHMw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 90EBE3280059;
        Thu, 20 Feb 2020 12:53:09 -0500 (EST)
Date:   Thu, 20 Feb 2020 18:53:07 +0100
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
Message-ID: <20200220175307.qool442lm7qjqb5h@gilmour.lan>
References: <20200214123244.109300-1-maxime@cerno.tech>
 <20200214131025.GI4831@pendragon.ideasonboard.com>
 <20200214154405.f5zuicm6uhhiczfs@gilmour.lan>
 <20200214154953.GJ4831@pendragon.ideasonboard.com>
 <20200217174253.mj53us4bb7h2lyca@gilmour.lan>
 <20200217181006.GE4830@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="o5bnojo4ldqgcpzr"
Content-Disposition: inline
In-Reply-To: <20200217181006.GE4830@pendragon.ideasonboard.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--o5bnojo4ldqgcpzr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 17, 2020 at 08:10:06PM +0200, Laurent Pinchart wrote:
> Hi Maxime,
>
> On Mon, Feb 17, 2020 at 06:42:53PM +0100, Maxime Ripard wrote:
> > On Fri, Feb 14, 2020 at 05:49:53PM +0200, Laurent Pinchart wrote:
> > > On Fri, Feb 14, 2020 at 04:44:05PM +0100, Maxime Ripard wrote:
> > > > On Fri, Feb 14, 2020 at 03:10:25PM +0200, Laurent Pinchart wrote:
> > > > > On Fri, Feb 14, 2020 at 01:32:43PM +0100, Maxime Ripard wrote:
> > > > > > SoCs that have multiple TCONs can use the two set of pins on the first TCON
> > > > > > to drive a dual-link display. Add a property to enable the dual link.
> > > > > >
> > > > > > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > > > > > ---
> > > > > >  .../bindings/display/allwinner,sun4i-a10-tcon.yaml         | 7 +++++++
> > > > > >  1 file changed, 7 insertions(+)
> > > > > >
> > > > > > diff --git a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
> > > > > > index 86ad617d2327..aa6dd8409dbc 100644
> > > > > > --- a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
> > > > > > +++ b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
> > > > > > @@ -105,6 +105,13 @@ properties:
> > > > > >          - const: edp
> > > > > >          - const: lvds
> > > > > >
> > > > > > +  allwinner,lvds-dual-link:
> > > > > > +    type: boolean
> > > > > > +    description: |
> > > > > > +      On a SoC with two TCON with LVDS support, the first TCON can
> > > > > > +      operate over both pins sets to output in a dual-link setup. This
> > > > > > +      will be triggered by setting this property.
> > > > >
> > > > > Could you maybe provide an example of how this property is supposed to
> > > > > be used ? I'm especially wondering what ports are used in that case and
> > > > > how they're connected.
> > > >
> > > > It's pretty trivial to support, it's only a property to set on the
> > > > encoder node itself.
> > > >
> > > > I'm not really sure what you meant by your question with the ports
> > > > though :/
> > >
> > > I assume that, in the single-link case, you have two TCON instances that
> > > operate independently, each of them with one port that models an LVDS
> > > connection to a panel.
> >
> > Indeed,
> >
> > > In the dual-link mode, how does that look like ? Does the TCON
> > > instance that operate in dual-link mode have two ports in DT ? There
> > > are two physical ports, so I think it makes sense to always have two
> > > ports in DT. That's what we're doing for the LVDS encoders on R-Car
> > > Gen3, in order to specify in DT which LVDS input of the dual-link
> > > panel is connected to which LVDS output of the SoC. That allows
> > > configuring the LVDS encoder to send the even and odd pixels on the
> > > right port.
> >
> > As far as I can tell, you can't control that in our TCON. It just on
> > more lanes, that's it. Also, we currently have multiple ports, to map
> > another feature of the TCON, which is that it can drive directly a
> > panel, or will send its output to the HDMI / TV encoders. Adding
> > another port in that will break the current binding we have.
>
> This will create one issue though, in that the dual-link sinks are
> supposed to have two input ports, in order to expose the odd and even
> pixels ordering. If you have a single ouput port in your TCON, how will
> you interface with such sinks ?

I guess we could create multiple endpoints in the same port? That's
not going to be trivial either though given the current binding we
have :/

Maxime

--o5bnojo4ldqgcpzr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXk7HgwAKCRDj7w1vZxhR
xcM8AQCpa6c0h8xK/CcS02Pjk8iW05AziHyjvBQHFtCVXRiR8gD+JzClYTbONPVl
oCYyx0aKehSbr6qn6kDEgIeDEfuHoQ0=
=TIhH
-----END PGP SIGNATURE-----

--o5bnojo4ldqgcpzr--
