Return-Path: <SRS0=EAgr=TC=vger.kernel.org=devicetree-owner@kernel.org>
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:42178 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726139AbfEBBhK (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 1 May 2019 21:37:10 -0400
Date: Thu, 2 May 2019 10:36:51 +0900
From: Mark Brown <broonie@kernel.org>
Subject: Re: Applied "spi: sh-msiof: Document r8a77470 bindings" to the spi
 tree
Message-ID: <20190502013651.GP14916@sirena.org.uk>
References: <1554969262-15028-20-git-send-email-cv-dong@jinso.co.jp>
 <20190415085333.91F9A1127B60@debutante.sirena.org.uk>
 <CAMuHMdXnZjND2f9dfrq=0+TuS3ZpAgmpAspBfbH-VvtsH=6TYg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="aMDdG8xNveJz2ruI"
Content-Disposition: inline
In-Reply-To: <CAMuHMdXnZjND2f9dfrq=0+TuS3ZpAgmpAspBfbH-VvtsH=6TYg@mail.gmail.com>
Sender: devicetree-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Biju Das <biju.das@bp.renesas.com>, =?utf-8?B?44Kr44Kq44O744O044Kh44Oz44O744OJ44Oz?= <cv-dong@jinso.co.jp>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, =?utf-8?B?56iy5ZCJ?= <h-inayoshi@jinso.co.jp>, Simon Horman <horms+renesas@verge.net.au>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, linux-spi <linux-spi@vger.kernel.org>, Hoan Nguyen An <na-hoan@jinso.co.jp>, =?utf-8?B?RHVuZ++8muS6uuOCvQ==?= <nv-dung@jinso.co.jp>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-ID: <devicetree@vger.kernel.org>


--aMDdG8xNveJz2ruI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 30, 2019 at 10:32:56AM +0200, Geert Uytterhoeven wrote:

> Is their any specific reason this was dropped from spi/for-next again?
> Upon closer look, the following seem to have been dropped as well, compared
> to last week:

No...   something seems to have been eaten by the scripting at some
point which is a bit worrying, especially since git didn't notice a
forced push anywhere.

--aMDdG8xNveJz2ruI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzKSbIACgkQJNaLcl1U
h9CgZAf/R/CagC1hqxjsWcXRC/Wf+TE2BHH84MLfgsiXuaLhk3oB23KpeJd8MK/2
9fWaGoUYnOSW9mkCtF0oQzmfFHUGqBV033wOqdntmMzS08ex2uYOEM9r705e6yDu
H8dDYCQ+PO8k4UINgNViPwcli2hhwaaVWSmDbaRMtpf5KvkHm/JLuQgMZOiGohHD
V7bKQj8AQI8mGU2zO54O892J4X4/y7PxrUlUqzKQDtBMn0IbfW3NLJxhN1EuXWOK
18JPESkfSpybQHsD0ZX1zIJsfLIFyZmDPxjqVhuerRxqv6MaNYmPrVLfKPHAvr09
vgyICe0zZnAhQ6q9OxNnGLTyN8aiVA==
=p7YA
-----END PGP SIGNATURE-----

--aMDdG8xNveJz2ruI--
