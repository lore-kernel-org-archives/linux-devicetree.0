Return-Path: <SRS0=zDkl=Z2=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6523AC2BD09
	for <linux-devicetree@archiver.kernel.org>; Wed,  4 Dec 2019 11:19:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 312D1206DF
	for <linux-devicetree@archiver.kernel.org>; Wed,  4 Dec 2019 11:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1575458343;
	bh=0oKDU7ngq/jF1VXGMo9qdFGadXqK7OY/6gVdquGWF7U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=opZ75XvSK9EziY/Y0Z+97CrYayruF5STkWmGdEDXngrcr8881sbFeCSKjuqM4nv6i
	 GWRHayNaru8FFZcqvd+oGufrk9CtgzQhamnl69590or7++r1v26iJGkTZ413IJaVBO
	 gXqmHQTKDaltQstCk/lvCdGAPyuC8IsN5vzZ1miI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727446AbfLDLTC (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 4 Dec 2019 06:19:02 -0500
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:41884 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727331AbfLDLTC (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 4 Dec 2019 06:19:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=IgdR+GwEtCG42t8GqTKY8eOFc3whwkF3Fy7Z9q2Bh4Y=; b=O/0vm+HHNxowkxt+W9wfX166r
        yar9yoMb3NKPYu1P8zjnoyJzTBKirLTnJ3qo1wWgQsRb5apyUmH6HXA8YE8ge/gbooHjPU5KM6SWp
        Ri6Q0Y+5eG5lEnvlKNIxZ2n/m9nuTeSItHHrIbsKthWXqM+zQS+DxuZhLpAeZE4XUhOMs=;
Received: from fw-tnat-cam3.arm.com ([217.140.106.51] helo=fitzroy.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.org.uk>)
        id 1icSgH-0008Gy-GD; Wed, 04 Dec 2019 11:18:53 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
        id E6F6ED003B4; Wed,  4 Dec 2019 11:18:52 +0000 (GMT)
Date:   Wed, 4 Dec 2019 11:18:52 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Chris Brandt <chris.brandt@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-spi <linux-spi@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Mason Yang <masonccyang@mxic.com.tw>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 4/6] spi: Add SPIBSC driver
Message-ID: <20191204111852.GP1998@sirena.org.uk>
References: <20191203034519.5640-1-chris.brandt@renesas.com>
 <20191203034519.5640-5-chris.brandt@renesas.com>
 <CAMuHMdVAZOa7OmT0s=RsVJsny9NujDzpdg4T+QoUXGe0kJjOTw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Sk71+Upln2BLuDmg"
Content-Disposition: inline
In-Reply-To: <CAMuHMdVAZOa7OmT0s=RsVJsny9NujDzpdg4T+QoUXGe0kJjOTw@mail.gmail.com>
X-Cookie: Cleanliness is next to impossible.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--Sk71+Upln2BLuDmg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 03, 2019 at 07:28:18PM +0100, Geert Uytterhoeven wrote:
> On Tue, Dec 3, 2019 at 4:46 AM Chris Brandt <chris.brandt@renesas.com> wrote:

> > +static const struct of_device_id of_spibsc_match[] = {
> > +       { .compatible = "renesas,spibsc"},
> > +       { .compatible = "renesas,r7s72100-spibsc", .data = (void *)HAS_SPBCR},
> > +       { .compatible = "renesas,r7s9210-spibsc"},

> Do you need to match against all 3 in the driver?
> Does SPIBSC work on RZ/A1 when not setting HAS_SPBCR?
> If not, the fallback to "renesas,spibsc" is not valid for RZ/A1.

I do think it's useful to explicitly list all the compatibles in
the driver, it documents the handling needed for each of the
variants and it provides some robustness against DTs that neglect
to list the fallback compatibles.

--Sk71+Upln2BLuDmg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3nlhwACgkQJNaLcl1U
h9Brbwf/dcBCwRUmfNAlY89XoWffl62GW4c0bMC56yHTvUtdF8HuiGCGrBTSoPE2
kAxJ2VxqvfvoweZSG2kvl8gV1IRJvFVAKtgoInPVrPijQ4vIHKLnwKyaagHoDBEj
CNlOkxUbyRwC6/zi966DsDCOZn2sCwl7QiN3szeIqgPbcLpQeIdL8tkv5zKJW4kM
QNsyZMAkDcpf3yr8AdjeTIBFyA4lJaBgz6vvIdWBueHRd6b0WCsIkmS5rEox7V46
sc8Xxxik5oRS9lM94IKDOzjT7tZ+aIvD4I+EwUgXfZo2GVqvGg2ZptLaQypKZ4cx
gDFDNt6EOcWsUktnZQvYtPMBpP0Dpg==
=QZjL
-----END PGP SIGNATURE-----

--Sk71+Upln2BLuDmg--
