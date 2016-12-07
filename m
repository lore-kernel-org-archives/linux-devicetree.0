From: Eric Anholt <eric@anholt.net>
Subject: Re: [RESEND PATCH v2 4/7] drm/vc4: Add support for the VEC (Video
 Encoder) IP
Date: Wed, 07 Dec 2016 11:18:19 -0800
Message-ID: <87inqvblac.fsf@eliezer.anholt.net>
References: <1480686493-4813-1-git-send-email-boris.brezillon@free-electrons.com>
 <1480686493-4813-5-git-send-email-boris.brezillon@free-electrons.com>
 <c1b904db-be3d-1e83-37bc-1f750ecfe224@gmail.com>
 <20161207161205.485a3046@bbrezillon>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0730851481=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20161207161205.485a3046@bbrezillon>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Boris Brezillon <boris.brezillon@free-electrons.com>, Florian Fainelli <f.fainelli@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Ian Campbell <ijc+devicetree@hellion.org.uk>, Pawel Moll <pawel.moll@arm.com>, Scott Branden <sbranden@broadcom.com>, Stephen Warren <swarren@wwwdotorg.org>, Ray Jui <rjui@broadcom.com>, Lee Jones <lee@kernel.org>, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

--===============0730851481==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Boris Brezillon <boris.brezillon@free-electrons.com> writes:

> On Mon, 5 Dec 2016 17:50:13 -0800
> Florian Fainelli <f.fainelli@gmail.com> wrote:
>
>> On 12/02/2016 05:48 AM, Boris Brezillon wrote:
>> > The VEC IP is a TV DAC, providing support for PAL and NTSC standards.
>> >=20
>> > Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
>> > ---=20=20
>>=20
>> > diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_v=
ec.c
>> > new file mode 100644
>> > index 000000000000..2d4256fcc6f2
>> > --- /dev/null
>> > +++ b/drivers/gpu/drm/vc4/vc4_vec.c
>> > @@ -0,0 +1,657 @@
>> > +/*
>> > + * Copyright (C) 2016 Broadcom Limited=20=20
>>=20
>> The standard copyright template post acquisition is just Broadcom, not
>> Broadcom Limited, nor Broadcom corporation. Can you audit your entire
>> submission and fix this up accordingly?
>
> This is the only patch adding a copyright header.
> Eric, can you fix that when applying the series or should I resend a
> new version?

I'll fix it when applying, that's fine.  (I had in v1 and forgot to tell
you!)

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlhIYHsACgkQtdYpNtH8
nuimHRAAjjWGsq7S1LElb6gZv2VThi3J9ig7BtH1e5cESwAK5J5HLi69pbSCOS1o
4InOfEfamGFXEka66k+kQb+fO51c74txarqq34NIFnEilrPqZTnat+PgxyKZ00TI
3SqtTNkDJ1q11Twq5CVH1AHPW217vbvpaeydYXZs/z9zzUbuSGpCeXX/umM5KnCG
bO7ZdPf/OOcaWrbXLmGEObOIQXq4eBHfS/BH9VGzw0eonfPpaADt16ostZ8u0t7V
FD/5hfojotzGvAKgqkhzlk7477XA72RT4jEuA8b1oGfkul+rTOxslw9SrFLFEG+v
AAJikwMG9VjYyl145SUNu5KX4FHWQ4Y5IHhgbLCroiXC4eGr9UujE5ZA6b9Y5k8j
6c4osyyzMka9e0frCH4xzfxH6sBpi/RPqbuvHZvX6MVlu2EfxHgWGu4HNpkR2uNr
k3vaATZJDboxwvAf2uVaWR3wdPrziPUrkaCi7VHJKWN0T1Tw75tyV6nxWShOsbfs
39NBCHogMd3nClvWtGNYn8StodxE6eELPL5y9/49iF++GCly/WkboQxSuqX0sZPY
JE3eCt2Lwwsd46ExgW7ajuhzEhKLOztCDh/mUilQsANZxr4zdT2QdaENuKPlnTcO
z19Gvg+iiwE78JBvcQfUE9cDY6VdauN92fzvSmwdDvtxxgxLTEs=
=K5Yk
-----END PGP SIGNATURE-----
--=-=-=--

--===============0730851481==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0730851481==--
