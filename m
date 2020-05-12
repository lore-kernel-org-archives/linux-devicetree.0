Return-Path: <SRS0=NYOC=62=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C1B2C54E4A
	for <linux-devicetree@archiver.kernel.org>; Tue, 12 May 2020 12:45:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 60A6220736
	for <linux-devicetree@archiver.kernel.org>; Tue, 12 May 2020 12:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1589287528;
	bh=B8EsQkIZ4mWzMFetp7c3r9TqEBFzsY2l1zuTizTYPB4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=vJF17hfBwriI0LT96pl2xsvo2XEd8ERsfK8O+YSYOAJGieAY1pmadBZCA0W0zvr1H
	 aj5DN7dUP1GmmwVRAsjyY86Po48DfddPpmTJOkWpoAWrOwTntCbOrwwZsN0bpNmMsC
	 ceiWBZhyDkBIodX52gmYxb9lSg5wmpFz0ayYSNl4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729436AbgELMpX (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 12 May 2020 08:45:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:53848 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727783AbgELMpX (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 12 May 2020 08:45:23 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BE13A20674;
        Tue, 12 May 2020 12:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589287523;
        bh=B8EsQkIZ4mWzMFetp7c3r9TqEBFzsY2l1zuTizTYPB4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Mez8boHcMnR+mev15Qse9ch6E4/Ezv+JCkJDwFG9E8tW1tilmUDFKHY1Ah04d6BaH
         Aig7VFji0wMpoH0NpnAqDOuDS+tTWi+z3cieLPwzSxsc04qLUd8ixLtn+9mb0jgCzN
         BryR2K1An27QybVGN8qEiBY50g9twxf+3cLm4pH0=
Date:   Tue, 12 May 2020 13:45:20 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Lubomir Rintel <lkundrak@v3.sk>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 07/11] ASoC: mmp-sspa: Prepare/unprepare the clocks
Message-ID: <20200512124520.GH5110@sirena.org.uk>
References: <20200511210134.1224532-1-lkundrak@v3.sk>
 <20200511210134.1224532-8-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="smOfPzt+Qjm5bNGJ"
Content-Disposition: inline
In-Reply-To: <20200511210134.1224532-8-lkundrak@v3.sk>
X-Cookie: The only perfect science is hind-sight.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--smOfPzt+Qjm5bNGJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 11, 2020 at 11:01:30PM +0200, Lubomir Rintel wrote:
> The driver enables the clocks without preparing them and disables
> without unpreparing afterwards. Fix that.

This fix should've been earlier in the series so it could be sent as a
fix.

--smOfPzt+Qjm5bNGJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl66ml8ACgkQJNaLcl1U
h9CzLgf+Jh8LwbiE+tnUKFZaCx9Xvm8TpBqizolD7ds1chpXzCKwvsCD05D6xK1c
+pHm2YbWUn9S8j1WfrsfjyVqFVs04kBNbEl4gN4zNhNfT+t8bZ96c8MJLaJDBNO8
8rjXWZwanFpNCHI3PMqZ9mtMMZciEnKCzvxOfh0Cf//nPoExjVNYu6RkdRlxhOYB
gxWXMJhfDryXdkfiCpigwLeePjFdME9Pwfdt+i02oKnLZKGZJXJyEmzHxdWa66Wp
7XMKQYf81z5vDKteF4X4osscnFuMDKtcbW/Jmy6PRYz00zsJF6pnrfe47bRxOSmy
i75Py2lUbkbyLBjn/oBevQ1588aDlw==
=3JaX
-----END PGP SIGNATURE-----

--smOfPzt+Qjm5bNGJ--
