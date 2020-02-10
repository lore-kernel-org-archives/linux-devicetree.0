Return-Path: <SRS0=E/bd=36=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A29C0C352A4
	for <linux-devicetree@archiver.kernel.org>; Mon, 10 Feb 2020 07:45:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7606320733
	for <linux-devicetree@archiver.kernel.org>; Mon, 10 Feb 2020 07:45:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech header.b="SRusOU6z";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="zhxEE/Uk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726584AbgBJHp3 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 10 Feb 2020 02:45:29 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:48407 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726118AbgBJHp2 (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Mon, 10 Feb 2020 02:45:28 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id DE2D521B74;
        Mon, 10 Feb 2020 02:45:27 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Mon, 10 Feb 2020 02:45:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=zKviTYwNtOAF1i7vdc+J8aezp5Z
        qvneeGlj2Jeyenw8=; b=SRusOU6zGkRixLRFfJR9faflBt4YqrKln+G2yKPV9re
        IcQ7u79sX47HNW6ddmjyXgNfBgifrlMeHWRaEYS8KwhOI9LH2vn75Y7HJPSzUU3y
        O0nvllLEounmmDH8ghSO9eZpm11wEe79gdbzWSG6q/n8ipMCpArH5fEcKr+NB8yd
        9FDhTeOEh6O1+w7TvxwL5+03bBLrq+Ytub/yQsztjbpLV7BjhZQ3St+8kBUzm9e+
        SQrM1cZlT5lU06TydAO+zobYk0Sj1jitCkRTFpfns30M9rRK4c7MUJaVcbZt5pFF
        VM96QQ49bvv1NGX8fAFLrGHX6pk4vyiye4pTLnQTvDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=zKviTY
        wNtOAF1i7vdc+J8aezp5ZqvneeGlj2Jeyenw8=; b=zhxEE/Uk0p6h+fmhZ9QO8w
        gJweMLGYuQQN4iGqBADuJnaEVXQGPMD4p17kwSVQlJaGlxwhs4rtqJLgmGEi0//D
        GPvnOguAqZNijUCZQt4lMUXD+mJtn+QsmGPS55+sff7ebE0hC0vEpYTRP3nJrDd4
        6HWDBFZkvw76Xs8aG+OqL0drMRwdCmF7t0qknF8+H+9BaCkBSOVRKLxTvrXnhk54
        ymgRYVcts61f5tWsi0X5lX08MCrdySJ5MXBI/vhfugS/bofxwB5sV4c7dS7pmf3g
        lGkp1RvB3DUsqRuR3zEFeAqRqOFcNf83vIGwVZDtJWOBm5oh7n7FDV7YYSxfZoEg
        ==
X-ME-Sender: <xms:FwpBXmbMdGreOvBMEhtdhtUc5a1z9hNrfcL3HIH7tCssbWgkUN5wBQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedriedtgdektdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkphepledtrd
    ekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:FwpBXuq0ZTS-ALZiRph6gbtkCCn2xPGHNjf4HIrPutHnewWjaUbYWw>
    <xmx:FwpBXirjIzyh4-p-evrIELC5pxOybrxCfLPV2ZMMYtTwzkeKpooUYg>
    <xmx:FwpBXg1rYOQaq0vFaBeYnhwJ-ZflDIaAXRxLQ_mwjutujbu9KGhmLQ>
    <xmx:FwpBXjv9EKesr1slgpQ2uVNhmd9FBRi8MV5_0qagkuaza9CN2sh_Sw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 37E1630606E9;
        Mon, 10 Feb 2020 02:45:27 -0500 (EST)
Date:   Mon, 10 Feb 2020 08:45:25 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     bage@linutronix.de
Cc:     devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Benedikt Spranger <b.spranger@linutronix.de>
Subject: Re: [PATCH 4/5] ARM: dts: sun7i: lamobo-r1: Split out commons
Message-ID: <20200210074525.xloszrupb37gcl6p@gilmour.lan>
References: <20200206113328.7296-1-bage@linutronix.de>
 <20200206113328.7296-5-bage@linutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="hyya4fcrpatydi7p"
Content-Disposition: inline
In-Reply-To: <20200206113328.7296-5-bage@linutronix.de>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--hyya4fcrpatydi7p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Thu, Feb 06, 2020 at 12:33:26PM +0100, bage@linutronix.de wrote:
> From: Bastian Germann <bage@linutronix.de>
>
> Split out common parts of the Lamobo R1 board to enable using them for
> Linutronix Testbox board integration.
>
> Co-developed-by: Benedikt Spranger <b.spranger@linutronix.de>
> Signed-off-by: Benedikt Spranger <b.spranger@linutronix.de>
> Signed-off-by: Bastian Germann <bage@linutronix.de>

Looking at the board, it looks like it's just a daughter board to the
lamobo-r1?

If so, you can just include its DTS directly, there's no need to
create a DTSI (an overlay is an option as well).

Maxime

--hyya4fcrpatydi7p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXkEKFQAKCRDj7w1vZxhR
xV7XAP9IuMT+pK1W4BlZA+yUO5fiwre81zA/synSncgzMnp9YAEAqev9jgs1BoHH
/YNnm7sUo9yrvJ0iIaTTTANGIdc6/wc=
=7/nb
-----END PGP SIGNATURE-----

--hyya4fcrpatydi7p--
