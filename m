From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH 3/7] drm/vc4: Mimic drm_atomic_helper_commit() behavior
Date: Wed, 21 Jun 2017 10:25:30 -0700
Message-ID: <87mv91gsmt.fsf@eliezer.anholt.net>
References: <1496392332-8722-1-git-send-email-boris.brezillon@free-electrons.com>
 <1496392332-8722-4-git-send-email-boris.brezillon@free-electrons.com>
 <87k24orheq.fsf@eliezer.anholt.net> <20170606224817.7244d0e0@bbrezillon>
 <87o9tzg06z.fsf@eliezer.anholt.net> <87d1a4u8qw.fsf@eliezer.anholt.net>
 <20170616091948.7ef27162@bbrezillon>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0642595689=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20170616091948.7ef27162@bbrezillon>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Lee Jones <lee@kernel.org>, Liviu Dudau <Liviu.Dudau@arm.com>, dri-devel@lists.freedesktop.org, Gerd Hoffmann <kraxel@redhat.com>, Florian Fainelli <f.fainelli@gmail.com>, Eben Upton <eben@raspberrypi.org>, bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ray Jui <rjui@broadcom.com>, Rob Herring <robh+dt@kernel.org>, linux-rpi-kernel@lists.infradead.org, "Hollingworth, Gordon" <gordon@raspberrypi.org>, "Cobley,
 Dom" <dom@raspberrypi.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Scott Branden <sbranden@broadcom.com>, Kumar Gala <galak@codeaurora.org>, Shawn Guo <shawnguo@kernel.org>
List-Id: devicetree@vger.kernel.org

--===============0642595689==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Boris Brezillon <boris.brezillon@free-electrons.com> writes:

> On Thu, 15 Jun 2017 16:33:11 -0700
> Eric Anholt <eric@anholt.net> wrote:
>
>> Eric Anholt <eric@anholt.net> writes:
>>=20
>> > [ Unknown signature status ]
>> > Boris Brezillon <boris.brezillon@free-electrons.com> writes:
>> >=20=20
>> >> On Tue, 06 Jun 2017 13:27:09 -0700
>> >> Eric Anholt <eric@anholt.net> wrote:
>> >>=20=20
>> >>> Boris Brezillon <boris.brezillon@free-electrons.com> writes:
>> >>>=20=20=20
>> >>> > The VC4 KMS driver is implementing its own ->atomic_commit() but t=
here
>> >>> > are a few generic helpers we can use instead of open-coding the lo=
gic.
>> >>> >
>> >>> > Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
>> >>> > ---
>> >>> >  drivers/gpu/drm/vc4/vc4_kms.c | 38 ++++++++++++------------------=
--------
>> >>> >  1 file changed, 12 insertions(+), 26 deletions(-)
>> >>> >
>> >>> > diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/v=
c4_kms.c
>> >>> > index ad7925a9e0ea..f229abc0991b 100644
>> >>> > --- a/drivers/gpu/drm/vc4/vc4_kms.c
>> >>> > +++ b/drivers/gpu/drm/vc4/vc4_kms.c
>> >>> > @@ -42,6 +42,10 @@ vc4_atomic_complete_commit(struct vc4_commit *c)
>> >>> >  	struct drm_device *dev =3D state->dev;
>> >>> >  	struct vc4_dev *vc4 =3D to_vc4_dev(dev);
>> >>> >=20=20
>> >>> > +	drm_atomic_helper_wait_for_fences(dev, state, false);
>> >>> > +
>> >>> > +	drm_atomic_helper_wait_for_dependencies(state);=20=20=20=20
>> >>>=20
>> >>> With this wait_for_fences() addition and the reservation stuff that
>> >>> landed, I think we can rip out the "seqno cb" in vc4, and just use
>> >>> drm_atomic_helper_commit() and drm_atomic_hepler_commit_tail().  Do =
you
>> >>> see anything missing, with that?=20=20
>> >>
>> >> I can't tell. I haven't dig enough to understand what this seqno cb w=
as
>> >> used for :-), but Daniel was suggesting the same thing. I'll try to
>> >> better understand what seqno cb does and if it's all safe to get rid =
of
>> >> it and use the standard helpers.=20=20
>> >
>> > The seqno cb was the thing for stalling the modeset until V3D was done
>> > rendering to the planes.  The wait_for_fences() does the same thing
>> > using generic dmabuf reservations, so the seqno cb isn't needed any
>> > more.=20=20
>>=20
>> Oh, we've got another user of the seqno cb (async flips), anyway, so we
>> can't delete it quite yet.  I've pushed this patch since it's a clear
>> improvement (less code, waits for fences from other devices if any).
>
> Ok. Did you fix the leak before applying?

I don't think I see discussion of a leak.  What are you referring to?

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAllKrAoACgkQtdYpNtH8
nuiNSw/5AR3fYf1ivYOopzdx+z4wYeREk1DDuhE/qLdDH3EH/rn92zkvfO0ZEPIw
Ax+G08xkVGjoJhIDjUWT+i90SES8Xxx8L3jLhXbBle1aIq0wkgVNBcgiyOUZrpW/
sYprhI0Jgvhjuc+yGmKq8F1Rhdn3NHZDYvBd+eso0yK7uiWWUy/ak0TT/EGFywQ6
C7v6IRlmHpv7B5vAzxFcmPRRILWZ+VMkFKc29qHAnmEeK9JNcR4+S019Pv9BPlCs
Zxm6yEdIGrFKbhuEhop7JlQsYnvdn8pMCMbQp4+zPQg8X3cMi7BJG40WHB/fbu3q
ESzU9MjwyhbUw2t8IsIxDBjSLLLM30fkttgttUoZJdCdgVpCQjcMXA7xlaz4J9nC
PWjQez8ZgwsqqB8QnQ2Mi18FY8W30RkzVtPn+0P1XXWvStHHNiahxsZGeZaynBI/
MqZAwJKHblBysInAPW+zzrTIreEOr8bRoMebjhVlE3WJNcZ4x0dfCB8zMeAJleso
tSvNA37U4mbvVp08GYiTm7Jb68c2ab/QmGClD3BTdknS2padqgaNczlWGIpkSzxA
1x+xOPONbF/nM5u9kYq5e0lyO71eAM49rhude454DMOyPN6DPtlH3SjkDkuhzgXe
23x+lP9LAdChXV/mCnHZd/2daLNLtsMUUM2mmIATiSFeTwF9RSI=
=JId3
-----END PGP SIGNATURE-----
--=-=-=--

--===============0642595689==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0642595689==--
