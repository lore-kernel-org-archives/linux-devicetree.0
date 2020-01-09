Return-Path: <SRS0=GIEZ=26=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38ED8C282DD
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Jan 2020 16:30:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0C22720721
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Jan 2020 16:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578587414;
	bh=QrZvthlzizcWbBIK0uVSmw0bZpQBJKO1KkJ6E+nHviE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=Mp6zw7j0/wzJcFEMdaEXhHFNq7u5JE+urUqiEjl7P1sB4SLoYghcEWqZabi87Qsu+
	 KKQYC2zZBPla98GbiHItUYM7DOpK684/hll7ciegYyW7M053QrTqzAcorheLiQC3V0
	 cTkMY8i4WcLhQJAJas045BIDNkJOj+PWloGr0Ayc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730589AbgAIQaN (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 9 Jan 2020 11:30:13 -0500
Received: from mail.kernel.org ([198.145.29.99]:33938 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728840AbgAIQaN (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 9 Jan 2020 11:30:13 -0500
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AABB82067D;
        Thu,  9 Jan 2020 16:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578587413;
        bh=QrZvthlzizcWbBIK0uVSmw0bZpQBJKO1KkJ6E+nHviE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hlMr7qfj3Stdv/x03Sd30cXsn221NPEYgT6xh88S/FpzDwFIHMPLpCWKBl/1nxHeK
         myRYc2tLIWwFpMNardIFIhi3cIOfF979ogb90+COk+vdMz5epDjIhoPCRBt4MDmHBM
         gKH5IabfTUBsb+otKAN/v8+3jM2USel4PWlveYVI=
Date:   Thu, 9 Jan 2020 17:30:09 +0100
From:   Maxime Ripard <mripard@kernel.org>
To:     Vasily Khoruzhick <anarsoul@gmail.com>
Cc:     Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        arm-linux <linux-arm-kernel@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 0/4] arm64: allwinner: a64: Enable DVFS on A64
Message-ID: <20200109163009.v4jc22jyjushbxxx@gilmour.lan>
References: <20200108042018.571251-1-anarsoul@gmail.com>
 <20200108160402.u44odtfsuhiuytfl@gilmour.lan>
 <CA+E=qVeMvJ96OZ62E_B3byr4dGgtWd3NVD6qqB40gS7ExZy5uw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="yu3dj7bbxga4rc5i"
Content-Disposition: inline
In-Reply-To: <CA+E=qVeMvJ96OZ62E_B3byr4dGgtWd3NVD6qqB40gS7ExZy5uw@mail.gmail.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--yu3dj7bbxga4rc5i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 08, 2020 at 08:38:10AM -0800, Vasily Khoruzhick wrote:
> On Wed, Jan 8, 2020 at 8:04 AM Maxime Ripard <mripard@kernel.org> wrote:
> >
> > Hi,
> >
> > On Tue, Jan 07, 2020 at 08:20:14PM -0800, Vasily Khoruzhick wrote:
> > > This series introduces new DTSI with operating points for A64,
> > > adds cooling maps and thermal tripping points and enables DVFS
> > > on all the supported A64-based boards
> >
> > Thanks for that new series.
> >
> > I'm not sure I've seen the answer, but how did you test that the OPPs
> > were stable?
>
> I've been using them for close to 2 years and haven't seen any
> issues so far.

I'm sure you did, but those issues can be easily masked depending on
your config (and the default governor you have) and the workload.

> > So far, the only method that proved to be reliable was to run
> > https://github.com/ssvb/cpuburn-arm/blob/master/cpufreq-ljt-stress-test
> >
> > Could you paste the result (one board should be enough) ?
>
> Here is a run on Pine64-LTS:
> https://gist.github.com/anarsoul/23c361b42bcdf4f2e23624f74c4c94bc

Awesome, thanks!
Maxime

--yu3dj7bbxga4rc5i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXhdVDAAKCRDj7w1vZxhR
xV2/AP4ph8ruPTTtBNeFVcqqYllFYD+dyWFzhfn+5pGAzFGHCAD+PRx5Q2rvIBUJ
FqDnaJWoTHa9HsvJgXVDvrvx6MVcsgg=
=SZCt
-----END PGP SIGNATURE-----

--yu3dj7bbxga4rc5i--
