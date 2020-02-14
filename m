Return-Path: <SRS0=lsCC=4C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BED8DC2BA83
	for <linux-devicetree@archiver.kernel.org>; Fri, 14 Feb 2020 12:11:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 927DD222C2
	for <linux-devicetree@archiver.kernel.org>; Fri, 14 Feb 2020 12:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1581682308;
	bh=Yn4F4SdSsd+XSkCw+g3LZFq63exK1dyPDTlS0HWvtvA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=WN0ze81hLZTTOiGhDmmhJU5EVlgjIPGM6EN7g45Optb7QYCNTvVuhJNxX2bpslnbW
	 A8OZbdXmnQqS0Y9mSTc+5j30QgPzirynq8q4iRgTsQJGand61f21tys4YARWg42mOg
	 9yde1f2sVhQev1kzaND5sf6CL0dCW/wICOGMu3bM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729080AbgBNMLs (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 14 Feb 2020 07:11:48 -0500
Received: from foss.arm.com ([217.140.110.172]:60558 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728864AbgBNMLr (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 14 Feb 2020 07:11:47 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 767FA1FB;
        Fri, 14 Feb 2020 04:11:47 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EE0063F68F;
        Fri, 14 Feb 2020 04:11:46 -0800 (PST)
Date:   Fri, 14 Feb 2020 12:11:45 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>
Cc:     "Ramuthevar,Vadivel MuruganX" 
        <vadivel.muruganx.ramuthevar@linux.intel.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-spi@vger.kernel.org, Vignesh R <vigneshr@ti.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, dan.carpenter@oracle.com,
        cheol.yong.kim@intel.com, qi-ming.wu@intel.com
Subject: Re: [PATCH v9 0/2] spi: cadence-quadpsi: Add support for the Cadence
 QSPI controller
Message-ID: <20200214121145.GF4827@sirena.org.uk>
References: <20200214114618.29704-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <CAAh8qsxnRSwonuEPrriuS=gUMTjt8ddUVy5HxegmoCk-FoE4qg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Zi0sgQQBxRFxMTsj"
Content-Disposition: inline
In-Reply-To: <CAAh8qsxnRSwonuEPrriuS=gUMTjt8ddUVy5HxegmoCk-FoE4qg@mail.gmail.com>
X-Cookie: Shipping not included.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--Zi0sgQQBxRFxMTsj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 14, 2020 at 01:02:22PM +0100, Simon Goldschmidt wrote:
> On Fri, Feb 14, 2020 at 12:46 PM Ramuthevar,Vadivel MuruganX
> <vadivel.muruganx.ramuthevar@linux.intel.com> wrote:

> > Add support for the Cadence QSPI controller. This controller is
> > present in the Intel Lightning Mountain(LGM) SoCs, Altera and TI SoCs.
> > This driver has been tested on the Intel LGM SoCs.

> This is v9 and still, none of the altera maintainers are on CC?
> How will it be ensured that this doesn't break altera if it is merged?

Given that this is a new driver I'd be very surprised if it broke other
users?  I can imagine it might not work for them and it would definitely
be much better to get their review but it shouldn't be any worse than
the current lack of support.

--Zi0sgQQBxRFxMTsj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5GjoAACgkQJNaLcl1U
h9DFowf/dUPgpqg67TDIxYiZvaUkTs4lN9TTlwny0tuP3jzOHCtCJKrCCH+4T1M3
WMPmx9MBpmgvd6ELTmOVYJDIOzmXEDYvqadQWhIoRdVlBakgeF89sPjs2P0VWiJk
1QqNtnf9BJxhFAsGsSRh+pR1PtKG8POJ3TCjcexvAYV3byEeG6/+aTP3/Sb7s2s1
YfvHfS8PVQoXhMAddcqO1BF8WA69chxlJjheCHMYflTX/331JqhO0wRyZ82qIx0P
lPh1e6BCzlui3pydHcFJDBxyVxeNj7mEYG2QA59SQH1SbzmKnRx9gNFeywncgpHt
QeSbR4+jGK2zIzfI9cH6vFGu48znRw==
=RGMb
-----END PGP SIGNATURE-----

--Zi0sgQQBxRFxMTsj--
