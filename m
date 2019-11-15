Return-Path: <SRS0=ud5f=ZH=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38DEDC432C3
	for <linux-devicetree@archiver.kernel.org>; Fri, 15 Nov 2019 17:15:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1119E20728
	for <linux-devicetree@archiver.kernel.org>; Fri, 15 Nov 2019 17:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573838110;
	bh=RSU9xSqNeXK85aOMIM/PzLN1ORp5RwSgqA3qb8ti8io=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=F1iXV7TrWAKBdQnG9QUeDf0a7FDrERg0ZO/WVkZ7qkCN0syXJAs+2tUMgpGYEn4ms
	 s9aTUDvvuW7ITXDBnXBs7OMXnmrC6RBYWAw37PpcLJbCN4QlGLy3npysGIuHO08r7a
	 6vWYCSaGI9RBtxwVImmFrBcOXM2qWpTzCe7C+CSA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727625AbfKORPD (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 15 Nov 2019 12:15:03 -0500
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:40360 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727665AbfKORPD (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 15 Nov 2019 12:15:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=RQJdKvZKfMsKQBwkCaC47KvblkeBygS3Ak3RT8kxRFU=; b=hGfqb+/mHc6s3XI50svFEuIPK
        jIXYHIDS3rfz8GPADtDIHhbe1ZJEbh4BPb+OTVbg4qbTvwH2kXzast2yWKmRS+Zo0BU85SGYK4fI4
        v85PwxDYKsoAXrKfrfcMAI6NAQFBAln4xoWyuH/XNnxHjXETf6bcXt69ZgdrN/qMfpwYQ=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1iVfBP-0000m4-L6; Fri, 15 Nov 2019 17:14:55 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 7B0D727429D2; Fri, 15 Nov 2019 17:14:54 +0000 (GMT)
Date:   Fri, 15 Nov 2019 17:14:54 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     robh+dt@kernel.org, KCHSU0@nuvoton.com,
        thomas.fehrenbacher@siedle.de, kernel@pengutronix.de,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/3] ASoC: nau8810: add aux input control, available on
 NAU8812
Message-ID: <20191115171454.GC4210@sirena.co.uk>
References: <20191115160819.15557-1-m.felsch@pengutronix.de>
 <20191115160819.15557-4-m.felsch@pengutronix.de>
 <20191115161210.GB4210@sirena.co.uk>
 <20191115162053.fgsd45seg526gafv@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="eHhjakXzOLJAF9wJ"
Content-Disposition: inline
In-Reply-To: <20191115162053.fgsd45seg526gafv@pengutronix.de>
X-Cookie: Tell me what to think!!!
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--eHhjakXzOLJAF9wJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 15, 2019 at 05:20:53PM +0100, Marco Felsch wrote:
> On 19-11-15 16:12, Mark Brown wrote:

> > It'd still be better to only register these controls if the device isn't
> > a nau8812 so that userspace doesn't see them.

> That's the thing I tought about 10min.. Imagine that: You have an
> embedded device with a very good codec driver (all codec controlls are
> available) but the hw-guys didn't connect all the in-/outputs. So
> switching those controls are useless too. IMHO this is exactly the same
> thing here.

We do have the start of facilities to mask out unreachable controls
already (a machine driver could use them manually as things stand).  If
we ever get the graph API done properly that work is more likely to get
finished.

--eHhjakXzOLJAF9wJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3O3Q0ACgkQJNaLcl1U
h9ABdAf+JGTslv/txd8VsZLn4CfToO1Tctrdfr1vcqrb3bsI9hAKjuUuLFO1ffNR
Rh7dZLXeQx54u4KsAiqF8EUuFYIfzaDR2OSk8nKxCxheKSrcx92YyBN9zL2tBvj3
lW3B+pa+/o1Ioa2uP+TB7wd4UYy3w0uQXGky/Ihs5EYgc8ermvkwhgihQ25AwVyk
PtfCYFvAbGMivk3HzIGL4nffYs618v7LWeEzC3f+ZUr0iUlbAa+sYdQAuownwQHD
3PZqgTIJeQPyovRHK82B+nxf49KFfxrOUDDbkYCk8BFPsBOm8yTOVftdW2JCBmhK
qwdb+7uYDn6OH+mABTq0Erpv/vghsg==
=ozqw
-----END PGP SIGNATURE-----

--eHhjakXzOLJAF9wJ--
