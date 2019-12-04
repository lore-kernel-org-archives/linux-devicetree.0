Return-Path: <SRS0=zDkl=Z2=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C1F6C2BD09
	for <linux-devicetree@archiver.kernel.org>; Wed,  4 Dec 2019 16:50:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E25CC2084B
	for <linux-devicetree@archiver.kernel.org>; Wed,  4 Dec 2019 16:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1575478218;
	bh=n2TpjN/OptBYY/G/BcEkXA4jaPFSNlIuaHlzaeouaPg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=RwSCZFgCbeoV0r1iVpHC4jEsWd9ZRMsdNdfc4QqFsqhFdxpPrJ0cmxK5uDM2M2xaC
	 EjS0QdoEKLD1gHuILWyWWlCaQPZakFEf1e91P/8Vmei/R/s1Kzrzwm/SmdTivM7Qjj
	 ianasQYq887/GuZiPQ5/AsS3v7ThOM0Flp28M300=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727912AbfLDQuR (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 4 Dec 2019 11:50:17 -0500
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:33770 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726934AbfLDQuR (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 4 Dec 2019 11:50:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=n2TpjN/OptBYY/G/BcEkXA4jaPFSNlIuaHlzaeouaPg=; b=WMWH7NGdkGTZzxQg9+gxsMtVB
        y/0M2EFDget8RQRmOCU5Yf8U1nJ0hHmrDbtxavFx1rl7q8RM6/uMeJwJTWAtU1LFjznXK8yK/RG/3
        tKbFKNgjtTIzT0p9RICpiVnv0yEfVjJ+A1KWmB8Fa5iGVI6IN1xKIVlOY7pFqZHqXBcVA=;
Received: from fw-tnat-cam6.arm.com ([217.140.106.54] helo=fitzroy.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.org.uk>)
        id 1icXqq-0001IV-CM; Wed, 04 Dec 2019 16:50:08 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
        id 02A22D00466; Wed,  4 Dec 2019 16:49:57 +0000 (GMT)
Date:   Wed, 4 Dec 2019 16:49:56 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Chris Brandt <Chris.Brandt@renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Mason Yang <masonccyang@mxic.com.tw>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 4/6] spi: Add SPIBSC driver
Message-ID: <20191204164956.GW1998@sirena.org.uk>
References: <20191203034519.5640-1-chris.brandt@renesas.com>
 <20191203034519.5640-5-chris.brandt@renesas.com>
 <20191203141944.GI1998@sirena.org.uk>
 <TY1PR01MB1562C00B477C60A6C264F2A28A5D0@TY1PR01MB1562.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Y974o0GblB/Ae/yP"
Content-Disposition: inline
In-Reply-To: <TY1PR01MB1562C00B477C60A6C264F2A28A5D0@TY1PR01MB1562.jpnprd01.prod.outlook.com>
X-Cookie: Cleanliness is next to impossible.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--Y974o0GblB/Ae/yP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 04, 2019 at 03:51:48PM +0000, Chris Brandt wrote:
> On Tue, Dec 3, 2019, Mark Brown wrote:

> > Looking at a bunch of the stuff here it looks like you could benefit fr=
om
> > regmap, it's got lots of debug infrastructure.

> Thank you for the suggestion, but I looked into using regmap, and there=
=20
> are a lot of drivers that use it, but I don't think it's going to work=20
> well for me.
> Regmap assumes that all the registers will be the same size. I have to=20
> have functions that write with different widths (8/16/32) for a reason.

You *can* have more than one regmap for a device, or if it really
only is one or two registers open code accesses to just those
registers.

--Y974o0GblB/Ae/yP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3n47IACgkQJNaLcl1U
h9Be3wf/WcxNfLSB6o1qW6xEZEOwlzwVHkE9O/D4Er+nOK513sA9f2VcM1ApH5Zu
ZQR0no8iK2XQgLRnuaKp7MjoI4tuWCR8LBYAC4eqsrgFXmaklbzHuzAnA/sVJgPA
bVk/FbV0XZzqLgKH8V7D1sdpSbWGgU4rb61/8vCAfEz1P4zF6HGcoDNDD14RAeEa
9ZIWAHioZc9JhnijqqJZiWjSUQH5aUShFqvtuCfpl3IYb0hQ97uZWkw34SK+TV4G
5cJsV52wGp22whXzizQpxUweaTQPRlMyMK6uVo9IlWRjTSdoiVF+T2v1taFo81tC
G6nx9Uxh9iA2HQmB2Rjd1ypWgKPV3g==
=rw0F
-----END PGP SIGNATURE-----

--Y974o0GblB/Ae/yP--
