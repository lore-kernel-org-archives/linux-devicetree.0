From: Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v3 3/3] drm: bridge: anx78xx: Add anx78xx driver support.
Date: Thu, 14 Apr 2016 16:32:04 +0200
Message-ID: <20160414143203.GD32237@ulmo.ba.sec>
References: <1460119972-8658-1-git-send-email-enric.balletbo@collabora.com>
 <1460119972-8658-4-git-send-email-enric.balletbo@collabora.com>
 <20160414131013.GA32237@ulmo.ba.sec>
 <570F9E4D.7040401@collabora.com>
 <CACvgo50ku9FZJU4YqdFsa6_=FqeDsq2UiCZkSVTLuTKsPRf7qw@mail.gmail.com>
 <570FA46B.2080706@collabora.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1713387094=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <570FA46B.2080706@collabora.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: devicetree <devicetree@vger.kernel.org>, drinkcat@chromium.org, Emil Velikov <emil.l.velikov@gmail.com>, "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>, ML dri-devel <dri-devel@lists.freedesktop.org>, Rob Herring <robh+dt@kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>
List-Id: devicetree@vger.kernel.org

--===============1713387094==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mSxgbZZZvrAyzONB"
Content-Disposition: inline

--mSxgbZZZvrAyzONB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 14, 2016 at 04:08:43PM +0200, Enric Balletbo i Serra wrote:
> Hi Emil,
>=20
> On 14/04/16 16:06, Emil Velikov wrote:
> > Hi Enric,
> >=20
> > On 14 April 2016 at 14:42, Enric Balletbo i Serra
> > <enric.balletbo@collabora.com> wrote:
> > > The patch was implemented first without OR'ing error codes. The reaso=
n why I
> > > changed this is because I received the comments that checking the err=
or on
> > > every regmap_* didn't help the readability of the driver and is likel=
y to
> > > not fail if the first call doesn't fail.
> > >=20
> > > For example, originally the code was like this:
> > >    http://pastebin.com/rPgyji8k
> > > but I changed to this
> > >    http://pastebin.com/rPgyji8k
> > >=20
> > Both links are the same ;-) But I believe we all get what you meant.
> >=20
>=20
> Ooops, sorry. This is the other link
>=20
> http://pastebin.com/e2KpGxHy

I like the explicit checks better. Like I said, OR'ing the error codes
makes you loose all context and likely give you many similar failures if
for some reason regmap accesses always fail.

Also you're code most likely is required to run in entirety for an
operation to be successful. If the first part of the operation doesn't
succeed it is natural to assume that the whole operation will fail, so
there's no need (and a waste of time) to attempt any subsequent steps.

Thierry

--mSxgbZZZvrAyzONB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXD6njAAoJEN0jrNd/PrOhMz0QALbcy9IisIaqY8As0VaQ7vYV
lZ+b78Xm4Ooll4yJLEo9SBZmz2fx7mXcd9coADsvLGqSLUn4PgxEzNLEs3XnMDnY
oZV/ckTICrxp5EghTS8AyR+okK+d6vEICbsPf+R0syAgDbhZ4dO4jP5BTPsD5b8w
dWFwyJjeZJNF5d4vsylAEGQFzVBY+RzowmVhisSuKYiAX8vC58NLI+b0SmOVuE2a
H90PNk5N1V5RmT4IR4pa0xk7BWYnjGnmDECPWiB4De4jQj/8EkKLjjL9Az8qtE21
kB1GarEx8tZko3L0mR+7wv+yY9Mfubsj43vnAeSkJdpoAdbeqMi+4Q+Z3FowOzMS
OW3M1vhj/mMkf/faQRlEN59rnC8b0DBL3yLfXfiggpremIXGY+7Q/Ar28vfdyOCH
WP2fAHM8MjKY1Y/KTtj5ZbgKyRAYghMEh53LEq8N1l0eEagzCba7PaNURMKseLXW
As2qVBpkFT+rRMcLiBfaZ5G553p28UWm44DKO46/60u94VKPbldvjDuSGGEtCObx
NtCLTkkVL3eyZNFdS10hlqGlb4d657TdAeiCDGOec7QUNz9ayiMv/rDgtqlvKpW4
8iUlqNBrXyPgU3aPA8Fjvs0TB1V3QWDc0pCcrS1ytosikDSDYi3p8D80jknjtf64
h/qv05JHyUd4LqGvpJ4G
=hnMl
-----END PGP SIGNATURE-----

--mSxgbZZZvrAyzONB--

--===============1713387094==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1713387094==--
