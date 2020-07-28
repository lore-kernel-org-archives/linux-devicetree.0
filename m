Return-Path: <SRS0=YUp6=BH=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEC42C433DF
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Jul 2020 16:55:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 82EAA2065C
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Jul 2020 16:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1595955317;
	bh=rJVDQqY5WUvFsOu1EgRX9G1KnNLENwbxshwoQwQR3p4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=cK566WaqoFOuwLBhQlMFHCnvUiChgjArw12UVZP3GZX60J4UToJXKamk+cu7YlupV
	 cYHi3s7AbPuUnBbXnyVOZAdaSIycobj2SkwugIfihboSuMHMTYiPJDNILl4JfezWyB
	 5kIljathfHUYYEsO0Jvv390qf7ux+Cy6UFc7G4cY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731529AbgG1QzR (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 28 Jul 2020 12:55:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:57748 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731504AbgG1QzQ (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 28 Jul 2020 12:55:16 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C20702053B;
        Tue, 28 Jul 2020 16:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595955316;
        bh=rJVDQqY5WUvFsOu1EgRX9G1KnNLENwbxshwoQwQR3p4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=wphuh2vgRP2NmEjnKL/5WhUCKFXp+LcT7YqJVHmw80vzlb5hYsg1+TCnZNO1xijV3
         ff3mBUbM5YPw7DzfyjG55DZ5fKlsnV7zhOQm6hOxsiIaLs7EcdXUiB4yoQjM3s8ouI
         CBtWyKxHVMqPKp5uH2ReQkcjAPv3ltdxZ9Zb+XUk=
Date:   Tue, 28 Jul 2020 17:54:58 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Linux-ALSA <alsa-devel@alsa-project.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3] ASoC: dt-bindings: ak4613: switch to yaml base
 Documentation
Message-ID: <20200728165458.GC24701@sirena.org.uk>
References: <87y2nk2tfd.wl-kuninori.morimoto.gx@renesas.com>
 <CAL_JsqJ8PyuZLXj4bLwyConb+GdH83hjPPj2mHbqNy=w9m-joA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="zCKi3GIZzVBPywwA"
Content-Disposition: inline
In-Reply-To: <CAL_JsqJ8PyuZLXj4bLwyConb+GdH83hjPPj2mHbqNy=w9m-joA@mail.gmail.com>
X-Cookie: You will be misunderstood by everyone.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--zCKi3GIZzVBPywwA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 27, 2020 at 08:39:23AM -0600, Rob Herring wrote:

> I haven't seen any follow-up to my audio-graph-card.yaml comments, so
> please revert this.

OK, Morimoto-san please resubmit as a series with the audio-graph-card
when you get back to that.

--zCKi3GIZzVBPywwA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8gWGEACgkQJNaLcl1U
h9DjEgf/flTiTV9yDbY8qM8OA6yHxLt7VbCKxsA1FUtPKBoCgMfbawzKmYcVLArI
aamcAdgU1VXbJivony07qipiIF2I4fND1DcK5h1tjgH4UmRGe/4geoZfSJ8xxlTJ
5FnL0ojGnsCuM2hi20XAFHBNoRAcAD0irnyOUR/HXrRA6N1r6Jlhih1tkP9FH740
FFZwwyGtlBZ09/nPdig1dzfkxqqtkgupTRxdBmaA3WNAFU9y5XL1QQ7Bhlu8f4yM
ibjmpePvAYbcUqIYp5q5VH6PgDzmhwUtd/mC2SGedAlVpq2kiocMgpnKbScApN7W
+iwbD1kRjKBsHeI4rCdUxkdAhMDnBA==
=Evbh
-----END PGP SIGNATURE-----

--zCKi3GIZzVBPywwA--
