Return-Path: <SRS0=KHJB=AD=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F320AC433E0
	for <linux-devicetree@archiver.kernel.org>; Mon, 22 Jun 2020 13:41:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D06CC2075A
	for <linux-devicetree@archiver.kernel.org>; Mon, 22 Jun 2020 13:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1592833308;
	bh=76HPA8Jkij2jZjdlFrIktZ6XRSDMq4kt1S8rTegc1Bk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=V8PdoUcmM54Gb08Km878jzVqg1tNDgWqmyLR+tJJp2Yw0UxN5MsjUZqiAXDBjo7KU
	 tU/bN9ZuIhr86mCSbJ+At+YCgzuwTuIICJwBBW8X9T1+uxewXDmmv1Boimy9/6rObf
	 aqBquAVJ07POB9IiWaXzGNkpn9EVbYVAk6Ioqg5w=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728628AbgFVNls (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 22 Jun 2020 09:41:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:50706 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729214AbgFVNls (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 22 Jun 2020 09:41:48 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1CDA62074D;
        Mon, 22 Jun 2020 13:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592833307;
        bh=76HPA8Jkij2jZjdlFrIktZ6XRSDMq4kt1S8rTegc1Bk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=B21oTPIkWw7OBXxlK3V4+IxJeFImDbaXVpPpAU2gG+fIdJtM6deJyZw1VTWTDW6PM
         FXVyLdPn2rpawBpfjrCUhCR7BsoB9VZSPYJsJ26gumHDkEFPXbq5q4tfdIun86CO1b
         VLZ42OmyCzXhcYu5zNsCnOQWebv/CcBZxTHjTxxA=
Date:   Mon, 22 Jun 2020 14:41:45 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Pantelis Antoniou <pantelis.antoniou@linaro.org>
Cc:     Stephan Gerhold <stephan@gerhold.net>, alsa-devel@alsa-project.org,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Matthew Porter <mporter@konsulko.com>,
        Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: sound: Device tree bindings for the
 apq8039 sound complex
Message-ID: <20200622134145.GJ4560@sirena.org.uk>
References: <20200619193831.12528-1-pantelis.antoniou@linaro.org>
 <20200619193831.12528-2-pantelis.antoniou@linaro.org>
 <20200619214126.GA1251@gerhold.net>
 <2070B433-83E0-4ACE-A470-36401934FC5A@linaro.org>
 <20200622120409.GD4560@sirena.org.uk>
 <519B5FAC-4DB8-4968-B9D4-96E376D74F1E@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="tKy6e3LXpfmanBFM"
Content-Disposition: inline
In-Reply-To: <519B5FAC-4DB8-4968-B9D4-96E376D74F1E@linaro.org>
X-Cookie: laser, n.:
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--tKy6e3LXpfmanBFM
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 22, 2020 at 04:32:46PM +0300, Pantelis Antoniou wrote:
> > On Jun 22, 2020, at 15:04 , Mark Brown <broonie@kernel.org> wrote:

> > No, you're encoding use case decisions into the DT here - for example
> > your example will break use cases like ring tones and shutter sounds
> > which should play through both speaker and headphones.  It's also
> > setting volumes which may be inappropriate or may be not and interferes
> > with userspace using those same physical volume controls.

> It is completely optional whether you use this functionality or not.

It's optional for whoever writes the DT and flashes it, it is not
optional for whoever's doing the OS configuration - these may not be the
same people.

> In that case you don=E2=80=99t use the automatic routing you merely set i=
t to off
> and everything works as before. Or you merely use the route setup for
> the function from userspace.

Userspace shouldn't have to be fighting with the kernel for control of
the device.

> The device in question is not a mobile phone so there is no requirement
> to have speaker and headphone active at the same time. It is possible to
> create a function that would be headphone+speaker active at the same time
> for that case.

That may be true for your OS configuration but that doesn't mean that
some other user of the same hardware won't want to do something that
needs both simultaneously.

--tKy6e3LXpfmanBFM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7wtRgACgkQJNaLcl1U
h9DCVwf9FpSeXGVTR/Zcbu24YOawrtka4GsPPSyOzc72t16OmdGnrJ0hROsl8K6n
sDqhp3MUcOd12L4ljog/75Ewggs5KqUtRcAX+R2EmTDxMnErBwRd9U/JoKmV70y1
6WdDPh18iAXPGO6fyX3I8ZdJxA7NFTJCsANM44oUDJOv8XZmYyY5vkbDl0bqMAqh
Gewyh8N0uGlLbGAlWGaXruLxPqkAAugJQXnNQ5nhwZsSeHakCzl5J3ALXE3A8J7R
QhsxOcaU9gfqkK2Si89Dt03ifwcauVzvzG5YFBgzuj1pjFOLfgwT8c56t1b1ZkSa
miOXn6WI7XaQr2+ouRo174Dd/Dszkw==
=h2v/
-----END PGP SIGNATURE-----

--tKy6e3LXpfmanBFM--
