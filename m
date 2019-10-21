Return-Path: <SRS0=tRzh=YO=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99ACACA9EAF
	for <linux-devicetree@archiver.kernel.org>; Mon, 21 Oct 2019 14:52:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6BED02053B
	for <linux-devicetree@archiver.kernel.org>; Mon, 21 Oct 2019 14:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1571669563;
	bh=Cl4SFYYSIDTMj3GUDISXtr+bUlNzJ4lPzxVAaEKBSV0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=Q58wPgtnFyDgInxSy5mkpuQHJtArapoevoDQK5z4rSmqftVso40EcT3UM7frAmTOG
	 On6H+zbSpXkA82hgpjlHk3xVBwqsPK3pB8XH2UGfNi9fJUcRVvNhMqMFRFvZ34k4aR
	 cTO93jTWl9xfO4Fp0985h/hR1dZa2gYv2hE9SxuY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727582AbfJUOwl (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 21 Oct 2019 10:52:41 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:33234 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729438AbfJUOwl (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 21 Oct 2019 10:52:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=Cl4SFYYSIDTMj3GUDISXtr+bUlNzJ4lPzxVAaEKBSV0=; b=U9FNaa4jnmUGmPgBoZievN6Pt
        1/7cWEfjp0R4M1H2Jq2JRpcSqOgN3+bGUybu/rqPCW59VoWbL2HeNen5Tn+Zb3b8DvvCcVoEA+X6S
        oqBdweM5fa51AOpzKiZjg04F3ezKCmf6R4MRhdTdJFnEbZi9uEG7vMkJ86uaAy8ViLuiw=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1iMZ2o-0004M1-6A; Mon, 21 Oct 2019 14:52:26 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 2CF1A274301C; Mon, 21 Oct 2019 15:52:25 +0100 (BST)
Date:   Mon, 21 Oct 2019 15:52:25 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Cc:     alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        Liam Girdwood <lgirdwood@gmail.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: asoc: adau7118: Cleanup
Message-ID: <20191021145225.GG4691@sirena.co.uk>
References: <20191021140816.262401-1-nuno.sa@analog.com>
 <20191021140816.262401-2-nuno.sa@analog.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="VACxsDaSTfeluoxK"
Content-Disposition: inline
In-Reply-To: <20191021140816.262401-2-nuno.sa@analog.com>
X-Cookie: Why are you so hard to ignore?
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--VACxsDaSTfeluoxK
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 21, 2019 at 04:08:15PM +0200, Nuno S=E1 wrote:
> This changes are in accordance with the review done to this bindings.
> This is a follow-up patch to 969d49b2cdc8.

Please include human readable descriptions of things like commits and
issues being discussed in e-mail in your mails, this makes them much
easier for humans to read especially when they have no internet access.
I do frequently catch up on my mail on flights or while otherwise
travelling so this is even more pressing for me than just being about
making things a bit easier to read.

--VACxsDaSTfeluoxK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2txigACgkQJNaLcl1U
h9DjAgf+PV9vOpdiw8ZF/t9vOrEiceLN50X7baJ1t7kS8qZ1Mkw5/Sis1mO3C8Ix
mszvAMdJB3xQD3N8x/KLiaBAqHtgvSemGIlP6Vt5kl59eOfOxOT7eN+ulUjplu3m
Vwkt4tSca6Uz8TmsjD6QinZPtOjIwM2slJABC6opepYhR93LwoeC35OnUuaGnLyU
KBWwzwtqUr0QtsT9Ch773O5DqB+IODJ40D9Iuse+dXAVozjievXEr0Q89P5Nirke
lwdIZ1ky5DLhB09wa0TkiZR4stZad5weCDrgGjk/X6d+hqjqLZT67Li75rO8y2aD
caJM7bJQefvSs3IvTolTsdKoYJ7b1w==
=s/Xl
-----END PGP SIGNATURE-----

--VACxsDaSTfeluoxK--
