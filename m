Return-Path: <SRS0=lsCC=4C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D03DBC2BA83
	for <linux-devicetree@archiver.kernel.org>; Fri, 14 Feb 2020 12:31:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9ADAB2086A
	for <linux-devicetree@archiver.kernel.org>; Fri, 14 Feb 2020 12:31:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech header.b="XtRM0egZ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="XQZnzuG+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728173AbgBNMbg (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 14 Feb 2020 07:31:36 -0500
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:38697 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728036AbgBNMbg (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Fri, 14 Feb 2020 07:31:36 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id 53DA54A6E;
        Fri, 14 Feb 2020 07:31:35 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Fri, 14 Feb 2020 07:31:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=LUuxcNfSOwWscQIzR0So/9bxPwg
        KSUZdiJhu4bV4RMY=; b=XtRM0egZ9LFEDkRTeXdhuM9gUjP39GO4ceL2zKVwwxp
        MMmUN8x5JFgL6/19NIiBbwRu/P67nPc5qb1G4g9E0qWrm9+M5C5AtCMeqYzPWLTg
        pMUMq99QrKojNTQJ5AFtJoXLPlfD4xSzEzXfS16fjUixXsdPWYkWGxAqvrY1H1j7
        4bQRbnaUrnPlRcZcmI6nUR23mTXtir72naeeVPC73uckanpbbwwzEARwV2b3vTQX
        Dbq2RuItrh4czV83wfvX5KqNXL4g5HPqbI7BDUwxH3ZbNAwMSYIzFqwmTWheBkXA
        GAxBDjsFCh8WKdm1hEeOoYEkel+Vp2ZYGBo2qg2+bGw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=LUuxcN
        fSOwWscQIzR0So/9bxPwgKSUZdiJhu4bV4RMY=; b=XQZnzuG+cKkjMP8GtT93yn
        2USAOWihi/JiMXsSVVo5Xle6gBbPoyWw1qOlJh5BekWkq0zBerhOVB/59WTZSiM5
        1X7+T553CpRxxUmX/55GjZCl8Br3RQd19u3LTdHbETHlbRXxVeJDsrk+pOGd+GyB
        GI23zMTn8ICYXiFf9A5Btn5VzbpbiFtBNTuGBYS64ZZex9sVjbPc82+6mFZeWPQF
        rTxeefUSgBcDvyq3F7OCaiTOMsHMfC5/N8Gle6Y+d3Ec2jENbZEPK6CQi5Wirnbb
        Q/XzhVjll6jBlPvAlasIn6XYQE7GLxo2zMLzjIRVJ0Rjs2Q680Rn8DMRClzWhSSw
        ==
X-ME-Sender: <xms:JJNGXtvxKMhvkoe2jIj6PoUIdWliTZewrnHDKfkLDlOHhUIez1MqfQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrjedtgdegvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkphepledtrd
    ekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:JJNGXk-nAqy58gO4J9jhlotpUkkgw-5gF3qoJOVA8jp6WMwRq7dNsQ>
    <xmx:JJNGXnG7vFKRr2zyhSUVwhQneV0N39HzAwStXJTSZ6WJKeax34xmpQ>
    <xmx:JJNGXqyQcNoZafwr-8OoOXMw3LwM6OUuXeORQpcWFZplz8Ic-1TUHw>
    <xmx:J5NGXh2kB6Otp6KfMhVdkrTLvPEyU7P1Z_WnG2mx4n3Jq0ulNi38Aw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id DB06C3280067;
        Fri, 14 Feb 2020 07:31:31 -0500 (EST)
Date:   Fri, 14 Feb 2020 13:31:30 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Chen-Yu Tsai <wens@csie.org>, dri-devel@lists.freedesktop.org
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Sean Paul <seanpaul@chromium.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>, devicetree@vger.kernel.org,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] drm/sun4i: tcon: Support LVDS on the A33
Message-ID: <20200214123130.7bfn7d2imgpkief5@gilmour.lan>
References: <20200214122427.108675-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="cedtemy3eui6wleb"
Content-Disposition: inline
In-Reply-To: <20200214122427.108675-1-maxime@cerno.tech>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--cedtemy3eui6wleb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 14, 2020 at 01:24:27PM +0100, Maxime Ripard wrote:
> The A33 TCON supports LVDS, so we can toggle the support switch.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Sorry, that one was a spurious send-email run ...

Maxime

--cedtemy3eui6wleb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXkaTIgAKCRDj7w1vZxhR
xTM8AQDH1yyQdstxuKVzuZ87kQMF0t43L3SxHNcDVWVfUvSrpAD+O73ZNqlaoy4F
iNxK0jcWKBWBernguIgzQyobw/ovbgA=
=7Hpy
-----END PGP SIGNATURE-----

--cedtemy3eui6wleb--
