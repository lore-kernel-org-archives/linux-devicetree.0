Return-Path: <SRS0=LTWd=4A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76213C2BA83
	for <linux-devicetree@archiver.kernel.org>; Wed, 12 Feb 2020 11:56:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4A5D92082F
	for <linux-devicetree@archiver.kernel.org>; Wed, 12 Feb 2020 11:56:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech header.b="YY82rS9M";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="wcGmpKj9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727982AbgBLL40 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 12 Feb 2020 06:56:26 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:54923 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726775AbgBLL40 (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Wed, 12 Feb 2020 06:56:26 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 9A41E21AF2;
        Wed, 12 Feb 2020 06:56:25 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Wed, 12 Feb 2020 06:56:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=ig3VE7Ch1wmeLx6+eFIshUeCqU0
        kCITiUOshPsali/I=; b=YY82rS9MDXXwvt3mPH0C/r3qvLku5CFAnzoDVuHymO4
        aJKkn1pOSE7xCyb9cfRtDxrXF2zGWfBrGrwmQ6X8r9suMqmSfsTtXGFy1BI25xL+
        q1pLicBS9p1em+SkmIvCsCQ8QnGLeVDRgwBQiTkYMzfrXY3czh5fSvrDQ7FkrgIV
        kAY1v7aj0cPvb42vvRoXoLywULT/wsJTyAWQDhgQ0NvhVnCHzctMJvNYOSyEIEZi
        s3ojSo8NlOSgKEOI6kEPMaqr7sQsdoBQktbHTKMq/gWzQzXv38/d7shCtTNFKdN0
        phaMm2tx1O+fnIMzTqS4aUg4zji8tUN0Mxn+cN2ob6g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=ig3VE7
        Ch1wmeLx6+eFIshUeCqU0kCITiUOshPsali/I=; b=wcGmpKj9d5YJEU3dLDyrwV
        XVSztzMvVvycPfgjouz1aQ7G/cH+dcQJYNJCZYInAhrkpypgBiRXU5Uv37cf+ma6
        /9shG6/Q2ghnAdXlaxl0wbjav8743a7g2H3OIDD36lzVxDtRBDiN+HLynHlRLmfM
        66opEHDvAnzAg04K4cSdCfBtbVLinnUyrLttKHFUOzDKM6NNWSWt7NTtSqCqiP+b
        TtJTlAPS+TJ5wl4SOROmZMiCyatSLQiqoO5ALlXpu252V5u3lpx12CgJgBYXrn+x
        WKcTYNJ2UDVwgfDJ+2LIv2++0BNgRcFWHRaVunpLmgD0mrARx+eAshJuJ7kCkusw
        ==
X-ME-Sender: <xms:6edDXiqHPW2xe6o1DT6dfOevi9tk_ZFiyPTwNWyMhk8wvQvr-BLstw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrieehgdefhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucffohhmrghinh
    epghhithhhuhgsrdgtohhmpdhnrghsuggrqhdrtghomhenucfkphepledtrdekledrieek
    rdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:6edDXtTrm2pjpBdaJyD4qZvkZCufviFgbL-TTFtBJlDxxtOSUZJrbg>
    <xmx:6edDXi_PrqihsjBgdiLhQUUAx4Btrxntgo01sLonIqP7_gs3o2RFww>
    <xmx:6edDXlsnhRzGu-ZfqJodc1Tg8OhadGhi85kQUgqX8korHb2qD0f_Iw>
    <xmx:6edDXkd_gOGzYJLZzVfiCab1OapiOTDYO4lvYvzTBhqpEIZNEy0YHQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id D5780328005E;
        Wed, 12 Feb 2020 06:56:24 -0500 (EST)
Date:   Wed, 12 Feb 2020 12:56:22 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Benedikt Spranger <b.spranger@linutronix.de>
Cc:     bage@linutronix.de, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 1/5] dt-bindings: Add vendor prefix lx for Linutronix
Message-ID: <20200212115622.2vsg4tycbfpdbj5q@gilmour.lan>
References: <20200206113328.7296-1-bage@linutronix.de>
 <20200206113328.7296-2-bage@linutronix.de>
 <20200210074310.c6adwjegqouzs6uc@gilmour.lan>
 <20200212103942.6f2dc5ec@mitra>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="zxg6crwczmz2arin"
Content-Disposition: inline
In-Reply-To: <20200212103942.6f2dc5ec@mitra>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--zxg6crwczmz2arin
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 12, 2020 at 10:39:42AM +0100, Benedikt Spranger wrote:
> On Mon, 10 Feb 2020 08:43:10 +0100
> Maxime Ripard <maxime@cerno.tech> wrote:
>
> > Vendor names are usually either the vendor name itself or the stock
> > name, so you should really use linutronix here
>
> May you kindly enlighten me why?
>
> "lx" is used internaly and externaly in projects, publications,
> contracts, etc. as common abbreviation by the Linutronix GmbH.
> Therefore it was self-evident to use this abbreviation in the device
> tree.

Googling "linutronix lx" returns approximately 0 meaningful results,
so it's really not "common", at least externally.

"lx linux" doesn't return much either.

> As I did not found any documented rule in the kernel documentation,
> which denote a restriction for the vendor abbreviation in the device
> tree bindings the decision for "lx" was clear.

It's in the devicetree specification:
https://github.com/devicetree-org/devicetree-specification/releases/download/v0.2/devicetree-specification-v0.2.pdf

Section 2.3: Standard Properties

"The recommended format is "manufacturer,model", where manufacturer is
a string describing the name of the manufacturer (such as a stock
ticker symbol)"

> A quick look into
> "Documentation/devicetree/bindings/vendor-prefixes.yaml"
> assured me in the decision to use "lx".
> Here some example not fitting your rule:
> "^ad,.*":
> "^adi,.*":

https://www.nasdaq.com/market-activity/stocks/adi

> "^al,.*":
> "^anvo,.*":

That's the name of the company

> ...
>
> In summary I would be encouraged if "lx" gets in, as it is *our*
> abbreviation.

How using the name of your company that *everybody* knows it by would
be discouraging?

Maxime

--zxg6crwczmz2arin
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXkPn5gAKCRDj7w1vZxhR
xVbHAP44TSwjociYihkBUbtAqeUG73/Gs8eIaXsdMtfjeUcHxgEAsdXP+bjh4sDq
c5dDoN4CP11voRS33qWeRjfPzl+ktwk=
=AYd1
-----END PGP SIGNATURE-----

--zxg6crwczmz2arin--
