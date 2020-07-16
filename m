Return-Path: <SRS0=XaEl=A3=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F993C433E8
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jul 2020 15:20:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2D4962065F
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jul 2020 15:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1594912845;
	bh=xvlq/EaQKoFxYAnh0dqPU7TeGNOs1bhBceWfFWYVEy0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=qoM23OkCjygZKS5SaflQuDQYbk/excypfz1cMvdZ/ahFMukdpi2bfLoq7zuY4Pfjk
	 wVJzaiHlWppB4r2YlHz75CZJAncyp6n9Jrgje18MMAHNPmS8inkwg88jRM84ZB1YA8
	 WsXne2PDEXggfWCD3se2BkLm7wnVJC/Yb44FudvY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728774AbgGPPUo (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 16 Jul 2020 11:20:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:42636 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728415AbgGPPUo (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 16 Jul 2020 11:20:44 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 902232063A;
        Thu, 16 Jul 2020 15:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594912844;
        bh=xvlq/EaQKoFxYAnh0dqPU7TeGNOs1bhBceWfFWYVEy0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=k176FucuYLZhP1LQhCHxFiJ+Kkkp02ggQMcyF7eSyNlaKZMI3w6yNmsuov3eRxKWi
         +rxQJ0D7CM3kZl235alazbw7hfG4EzQKooPOsi2yT47wJtgc6txWfFtR6GrchOujN2
         O8koDtq8bIDb1ykHRjyyI9YqyyhSlkrfE5Tn4dRw=
Date:   Thu, 16 Jul 2020 16:20:34 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3] ASoC: dt-bindings: renesas,fsi: use patternProperties
 for FSI-A/B
Message-ID: <20200716152034.GC5105@sirena.org.uk>
References: <87zh802tif.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="YD3LsXFS42OYHhNZ"
Content-Disposition: inline
In-Reply-To: <87zh802tif.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: This login session: $13.99
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--YD3LsXFS42OYHhNZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 16, 2020 at 09:29:10AM +0900, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>=20
> FSI has FSI-A and FSI-B, and has fsia-xxx/fsib-xxx properties.
> This patch uses patternProperties, and reduce verbose settings.
>=20
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Link: https://lore.kernel.org/r/87o8osxlow.wl-kuninori.morimoto.gx@renesa=
s.com
> Link: https://lore.kernel.org/r/87pn9v39eo.wl-kuninori.morimoto.gx@renesa=
s.com
> ---
> v2 -> v3
>    - add Reviewd-by
>    - add Link

Please don't resend patches for just acks and reviews, if I'm waiting
for reviews it causes confusion since I'll queue the reviewed version
then have to unqueue it when I see the resend.  I use tooling which
picks up reviews from the list.

--YD3LsXFS42OYHhNZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8QcEEACgkQJNaLcl1U
h9Cg8Qf8D7go8ENKfRGkqhGGLmyFp6v3nBVv9B8mc3+xLFGBPNTLwnfV4D7iRAd3
qe/LoipG/kht34+hk6vFz86WYJiY8hTz5vS0WN+djz4BcSaD010Fj48qQTaJhty5
o9HBv4m2IRA2cShAg8/V2OIKJy+IuIWDWw3t828If5DyMMs26AtfxBtItRR66GuE
OjXShfrW/JbX5rkzDVAbssNdsO64dtU3Z2FHYEcdPpzkuT02sAt7gkAoQPlpqdC6
UWUwWKu5byZAqPvutksobcuddHfFBZTH7oUQUlgwJYR8Jbx0RgS/1+bRS/HqjHvj
mim0pKC+93A2wzDB10hO9i0rOgVQQw==
=VdGZ
-----END PGP SIGNATURE-----

--YD3LsXFS42OYHhNZ--
