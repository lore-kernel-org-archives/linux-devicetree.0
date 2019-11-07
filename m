Return-Path: <SRS0=C4ig=Y7=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DD27C5DF60
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 Nov 2019 11:55:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 635CE2166E
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 Nov 2019 11:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573127754;
	bh=iHlXGtTG3blZ6wKTwLxKq3oEwBwhxS47/spmMRLMzdY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=kLzSXq0pb9eqWizyfUh1FgKj/ALPDFzN2XVrd/pjjqpFTe/7sP/k5yLtkpekMdG3w
	 fd+oOnN+ADbW0VPDgB8d8vmJJLOuXmVkrFsAUGPbZAXIgszPMQjlNztqFELojwHvGJ
	 hShdvA7MawmHrDf5PkfVKmkHg53qY3DNwfi92Jhg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388157AbfKGLzx (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 7 Nov 2019 06:55:53 -0500
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:49616 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727178AbfKGLzx (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 7 Nov 2019 06:55:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=iHlXGtTG3blZ6wKTwLxKq3oEwBwhxS47/spmMRLMzdY=; b=K/UJzHdCs9fwV96Yji6p6gWE/
        jMLeuXh+3eUByTdf2+mklAcdNAqP3OIGRCfrSlyf0pYM2buraM2dWLRx2gdJb6YIkSXbT0QEljedz
        3B+7cDRAiw74kq1pZ6Qb0+CmMlIagDCI/9wkzhOsntg9x62ieTcaWY+8+P6uNEwgtrRIc=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1iSgOC-0004FS-V1; Thu, 07 Nov 2019 11:55:48 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 50BC527431AF; Thu,  7 Nov 2019 11:55:48 +0000 (GMT)
Date:   Thu, 7 Nov 2019 11:55:48 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Christoph Fritz <chf.fritz@googlemail.com>
Cc:     Fabio Estevam <festevam@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Support Opensource <support.opensource@diasemi.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/4] dt-bindings: regulator: describe da906x buck
 regulator modes
Message-ID: <20191107115548.GC6159@sirena.co.uk>
References: <1573121050-4728-1-git-send-email-chf.fritz@googlemail.com>
 <1573121050-4728-4-git-send-email-chf.fritz@googlemail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="JWEK1jqKZ6MHAcjA"
Content-Disposition: inline
In-Reply-To: <1573121050-4728-4-git-send-email-chf.fritz@googlemail.com>
X-Cookie: I've read SEVEN MILLION books!!
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--JWEK1jqKZ6MHAcjA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 07, 2019 at 11:04:09AM +0100, Christoph Fritz wrote:
> This patch adds DT description of da906x buck regulator modes.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--JWEK1jqKZ6MHAcjA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3EBkMACgkQJNaLcl1U
h9DFYwf+K+6Qv4srSebiFY++rlxALTFBrd/T7KJR2yrAhocBG0I9XWBns9OzMgQi
1Ff7vMnWBiE0CAVpK1MTPD0E86pxX5EoSGS65rl9gq5SRCXLSje+va3qbzUW7x79
20f0+cGUdTyaROEauNYrrLdxJnW3c/dNEqGtOnQfYQ72ejDQYSXX5bZwO5ay8oU3
7S2ByVjf1qUXnpBH0W6kbDmnwRdvtRN7gh9Pbc0tcItDop6bQmVPckRYw3Qll7Y4
Qe53MkwaODM5Mv97D4pGUGVkW0eYLPNckegdlGmS8jZg5Ubh4uGchTplFVj8eu3d
FNuOOMzELazOxzyjsbSG7MeGZPY0Hg==
=NCpx
-----END PGP SIGNATURE-----

--JWEK1jqKZ6MHAcjA--
