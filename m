Return-Path: <SRS0=KHJB=AD=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE12DC433DF
	for <linux-devicetree@archiver.kernel.org>; Mon, 22 Jun 2020 12:04:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C320C20760
	for <linux-devicetree@archiver.kernel.org>; Mon, 22 Jun 2020 12:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1592827452;
	bh=OtCXs6qM/P9EkBQOGbFbsuL3yixXLWMZlDM2pS2KULw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=AmIdwdXnEFUSlgB7HRrn+QVFRz04lipTFP6V2Fku2qZT4D8kJFHFdNkcY6gGPloL5
	 oVzZat+awQ/nUQHi0yRhTHy3srwcZFwKx/4dc0Sa8HEGkE+v9x270Zu4avldvulzEv
	 4hidmwwAgYDr8b8p/aJ4Kuscv8ObF1JOtMLJn0uE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728003AbgFVMEM (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 22 Jun 2020 08:04:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:60552 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727864AbgFVMEL (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 22 Jun 2020 08:04:11 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 12E432071A;
        Mon, 22 Jun 2020 12:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592827451;
        bh=OtCXs6qM/P9EkBQOGbFbsuL3yixXLWMZlDM2pS2KULw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lLSiwOPq3kFltNjGmVtUTR8bqdRAZLMPunIKPq/ormr3CcYLEKhYqR99c7sOWbm6j
         QGDp3guukz+KDDmVFZZbM801EPjtvCQJHQ1Jn22iv/gzYz0+zqTS2g6Agann7ySK64
         D7rgZz7rr4H84BwzotL1cGZN6bQDlsmoSWEjnkqs=
Date:   Mon, 22 Jun 2020 13:04:09 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Pantelis Antoniou <pantelis.antoniou@linaro.org>
Cc:     Stephan Gerhold <stephan@gerhold.net>, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Matthew Porter <mporter@konsulko.com>,
        Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: sound: Device tree bindings for the
 apq8039 sound complex
Message-ID: <20200622120409.GD4560@sirena.org.uk>
References: <20200619193831.12528-1-pantelis.antoniou@linaro.org>
 <20200619193831.12528-2-pantelis.antoniou@linaro.org>
 <20200619214126.GA1251@gerhold.net>
 <2070B433-83E0-4ACE-A470-36401934FC5A@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="zS7rBR6csb6tI2e1"
Content-Disposition: inline
In-Reply-To: <2070B433-83E0-4ACE-A470-36401934FC5A@linaro.org>
X-Cookie: laser, n.:
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--zS7rBR6csb6tI2e1
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 22, 2020 at 02:34:23PM +0300, Pantelis Antoniou wrote:

> > This looks much like a replacement for ALSA UCM and userspace audio jack
> > detection coded into the device tree.

> I wouldn=E2=80=99t call it a replacement exactly. It=E2=80=99s merely a w=
ay to bundle all
> of this information about codec glue in the kernel (where it should belon=
g IMO).

No, you're encoding use case decisions into the DT here - for example
your example will break use cases like ring tones and shutter sounds
which should play through both speaker and headphones.  It's also
setting volumes which may be inappropriate or may be not and interferes
with userspace using those same physical volume controls.

--zS7rBR6csb6tI2e1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7wnjgACgkQJNaLcl1U
h9Dz/Af/ajnJ98C2qreuaWAPQ8PgLd/GE3P0ukq/sBXHzyMUg16weomHiWdIrtEZ
/78/EQEqwb8rigyHLVLC7P/BBmLH2XqpNu0tB0hhv4iN5ywyvri2U6LbDUIlSdKM
VieAO/eLiOmM7lC34jf5n6JJllQJGAFQlsJMeSdsBMim/xILhPXPAZ8Vw10PakkK
VWBCA2z5kQLlqU7R/90f9HqXaQFegxQJzJN4otivtTr0bNq3fYVnjs/l8cGoIM78
hHTm7Gg5dIPxG6u5SL+s6073hlMRzS1NOPCjz/9nuJgNV49BR9kvHT25GE2wPmLP
Pbq2xpkHMsSQSpnRaK81eKX9f3gp1Q==
=IFZO
-----END PGP SIGNATURE-----

--zS7rBR6csb6tI2e1--
