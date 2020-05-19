Return-Path: <SRS0=7YFh=7B=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59430C433E3
	for <linux-devicetree@archiver.kernel.org>; Tue, 19 May 2020 14:36:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 38295206BE
	for <linux-devicetree@archiver.kernel.org>; Tue, 19 May 2020 14:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1589898988;
	bh=C6EWjtedLGwqvy2K9YYDlSlp1wXijD0Uj/LprssIUUQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=sQSt1oQnj5RwKyjiiYkJEpyryhza+ZhNI0n7Pd9KENw/bqAPeNTPXLUs0YUfdMKln
	 DSsRCtQiOmM3N1ef7O7DSK6InbcH5cRqY+f7kSU1Tlv/aeNLSDIpEa6YlTjElYfOV7
	 0X/A1jVs2f0/D2TF9pRvTwV8hcaXIg9Cg10dAGH0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729132AbgESOg1 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 19 May 2020 10:36:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:37668 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729103AbgESOg0 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 19 May 2020 10:36:26 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BAC3E204EA;
        Tue, 19 May 2020 14:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589898986;
        bh=C6EWjtedLGwqvy2K9YYDlSlp1wXijD0Uj/LprssIUUQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HPEBnsqfBP5p2Z0eY8BUg8oZJQfjWPvKZhp/BxnLMe8Q+CGhoJeuMuw8OcXLmRkbs
         CTteO+I2FEsEXCTTw6Mhgw6LFUO1K72lr/dxPrJcB4CCWggr0BrMx/3rXEbrjCWwQi
         xtWORGVAyZEUywWO3pC3a44dmg0s+uevjnLuL3AY=
Date:   Tue, 19 May 2020 15:36:23 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        ALSA Development Mailing List <alsa-devel@alsa-project.org>
Subject: Re: [PATCH] ASoC: fsi: Add missing properties to DT bindings
Message-ID: <20200519143623.GL4611@sirena.org.uk>
References: <20200519075858.27869-1-geert+renesas@glider.be>
 <20200519124714.GA45550@sirena.org.uk>
 <CAMuHMdUHHzBNFHy07hgdryJEeHUDMOCP8XauCn7TmUK7uGZcFg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="sCNd3Ivk/oijKKf1"
Content-Disposition: inline
In-Reply-To: <CAMuHMdUHHzBNFHy07hgdryJEeHUDMOCP8XauCn7TmUK7uGZcFg@mail.gmail.com>
X-Cookie: Do not write below this line.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--sCNd3Ivk/oijKKf1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 19, 2020 at 03:33:01PM +0200, Geert Uytterhoeven wrote:
> On Tue, May 19, 2020 at 2:47 PM Mark Brown <broonie@kernel.org> wrote:

> > This doesn't apply against current code, please check and resend.

> It indeed doesn't apply to your sound/for-next branch.
> It does apply to robh/for-next, which has commit 9f60a65bc5e6cd88
> ("dt-bindings: Clean-up schema indentation formatting"), so I guess
> Rob will have to take it.

Makes sense

Acked-by: Mark Brown <broonie@kernel.org>

--sCNd3Ivk/oijKKf1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7D7uYACgkQJNaLcl1U
h9AdXwf9F+QuYk9a+SUgYNZ1Ji+henF264E7f4Bh7WdvB4oiefqaaK5meCJ0PxhV
mIUVO6ScSgRHcidWCJXIFNsmjNTS/vutR3RULzT+I9QPJIrx7IvMgnBAFsTxssOE
JdCtLWUqKYqRmbHk8ngmCu+It3I8KxOQvruZoVxrpLIrui4Ld0+2K7PosiESg8LM
xa9oNFfperdahGO4zbQ1Q6j1goTwnSO5qywsbgrfLa9Ft6GhlLdZqPsXg5WgH37G
y1SsfhFcsMjyx4UaiBBJM7Y3gVxwEt9KI0WxEfER6brc4nE5VBOAMo4cWjEXRkvZ
zoffd+yPURmu7eFDZB413wlK2Trlbw==
=DeUG
-----END PGP SIGNATURE-----

--sCNd3Ivk/oijKKf1--
