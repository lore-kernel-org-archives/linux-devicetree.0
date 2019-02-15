From: Andreas Kemnade <andreas@kemnade.info>
Subject: Re: [PATCH v2 0/2] drm/omap: panel-tpo-td028ttec1: add backlight
 support
Date: Fri, 15 Feb 2019 08:12:42 +0100
Message-ID: <20190215081242.21cc9953@kemnade.info>
References: <20190205063813.14873-1-andreas@kemnade.info>
        <a54e7427-ff84-d105-aab7-c5eab42e6df9@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/CwJMaOvMR+688fpUkYv3koC"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <a54e7427-ff84-d105-aab7-c5eab42e6df9@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: airlied@linux.ie, daniel@ffwll.ch, laurent.pinchart@ideasonboard.com, sre@kernel.org, dri-devel@lists.freedesktop.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org
List-Id: devicetree@vger.kernel.org

--Sig_/CwJMaOvMR+688fpUkYv3koC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, 8 Feb 2019 11:13:33 +0200
Tomi Valkeinen <tomi.valkeinen@ti.com> wrote:

> On 05/02/2019 08:38, Andreas Kemnade wrote:
> > This panel has a backlight, so add a property describing that and
> > add the code to use that.
> > This makes things like xset dpms force off
> > also turn off the backlight, so we do not need to rely on additional
> > userspace programs to do that.
> >=20
> > Andreas Kemnade (2):
> >   drm/omap: panel-tpo-td028ttec1: add backlight support
> >   dt-bindings: panel: td028ttec1: add backlight property
> >=20
> >  .../devicetree/bindings/display/panel/tpo,td028ttec1.txt       |  2 ++
> >  drivers/gpu/drm/omapdrm/displays/panel-tpo-td028ttec1.c        | 10 ++=
++++++++
> >  2 files changed, 12 insertions(+)
> >  =20
>=20
> Thanks, I'll pick these up.
>=20

hmm, that sounds like: patch accepted, will appear in linux-next soon.
I have not seen it there, or is it just in some branch not merged into
linux-next. Any new obstacles?

Regards,
Andreas

--Sig_/CwJMaOvMR+688fpUkYv3koC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEPIWxmAFyOaBcwCpFl4jFM1s/ye8FAlxmZmoACgkQl4jFM1s/
ye9+8xAAqmwCufiIjNGhDbgZP4jQZyAq8wV/Mfq8XHJLGVThdnHzE/AoKrEwa1/Y
snw2s4+AcBHwLwqPbKTzAyY+hZoWlzuTDmRUepnoKxusJerbsSe3DBH0brqb2NR5
Wsjn7s0JHVv0XPo3cDQOw6igQ+ca/nJak8OweR9QZFs1raoqfDldUCVQH9zFGRkk
Ec5sBfd+/YWxpdmDpREB5QCYeW4CJsWWcDTzMSp8uY69IpXv2+uU0+eao3HSjAli
pdYaPMiaw52Rr31ERmG2icWiYkEQETH52xoPVe85yut5fIO9WjGd37UTW1QaeFLN
j02Jc9YWmjPgXmxqoLC1gD0ODuVMEVwFvQmzejtTYRWJYaz4MrYuGi4EL+LYW3gU
1w5FD0D80vxm55nRog/pWHD42IPPqQ+svj0SqKoUrjof3Pv13PnsvcGKV82dNPnP
MFTre8QnxpAlP6YjHDJaRGVqtMEMM1Ny2c0u3euTDCtzeYINx77Q4j576Ichb6K7
gi7zMBhPhvtVkcxnu1jYQYSTodjHD5aCkhxIqFkvxsN/oCZId7pekTOaalhdz97m
3em2ct49+LyYJU9POAxyOwzNPg7Ikwm/uNLV/rspwJQL4z58SBq3Uxq8+bmFt4oX
eWEOlH1NUhFcYTU19JJ+xeE9lJ6K98pxMntwgIHlvWX/LqGRL4g=
=85hg
-----END PGP SIGNATURE-----

--Sig_/CwJMaOvMR+688fpUkYv3koC--
