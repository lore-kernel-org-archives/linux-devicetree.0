From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [RFC] drm: implement generic firmware eviction
Date: Fri, 26 Aug 2016 10:58:23 +0200
Message-ID: <20160826085823.GB30441@lukather>
References: <20160826000056.12806-1-dh.herrmann@gmail.com>
 <29bc1dab-7445-8470-f59b-6df908e83a3f@redhat.com>
 <CANq1E4QFB4k+8C4eZUuUwO7mYDDYrKx2wbPJfAKe_GoOLOHv=A@mail.gmail.com>
 <345e23d3-b55b-4d4d-e585-0ec8b243feb8@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1523840133=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <345e23d3-b55b-4d4d-e585-0ec8b243feb8@redhat.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: devicetree <devicetree@vger.kernel.org>, Daniel Vetter <daniel.vetter@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
List-Id: devicetree@vger.kernel.org


--===============1523840133==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gatW/ieO32f1wygP"
Content-Disposition: inline


--gatW/ieO32f1wygP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Aug 26, 2016 at 10:43:55AM +0200, Hans de Goede wrote:
> >>I'm not sure we would want to remove the device at all, we
> >>certainly should not be removing the dt_node from the devicetree
> >>IMHO. Having that around to see how the bootloader set things up
> >>is really useful for debugging and normally we should never modify
> >>the devicetree as set up by the bootloader.
> >>
> >>Why not just unbind the driver from the platform device? That
> >>should be enough.
> >
> >That will leave IORESOURCE_MEM around, causing conflicts if
> >re-used/claimed by other devices/drivers. Furthermore, it is really
> >fragile leaving the device around, without any control over
> >possible future driver probing.
>=20
> Ah, good point. On ARM this currently typically is reserved by the bootlo=
ader
> so never touched by the kernel at all, not even when the simplefb is no l=
onger
> used, actually returning this memory to the kernel after unbinding the si=
mplefb /
> destroying the simplefb platform-dev would be really good to do. We should
> probably figure out how that should be done before getting rid of
> remove_conflicting_framebuffers... (sorry).

That would be rather easy to do. The firmware could generate a
reserved-memory node instead of passing a smaller memory size to the
kernel. That way, the kernel will know that it's actual ram that it
can reclaim.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--gatW/ieO32f1wygP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXwASvAAoJEBx+YmzsjxAghCAQAKrGY65Fy9gQqDC+ZQHacZsI
zsQkt5Skpb1xMze2jo5I3hCRwMJlcYcczt/pcEjPlfD0V/K4FGgvfptA+bTHAjL9
aqtJCGr3VRuGce0AcUn7sPS3nKbQGGryKIT6c2sCMyQAptxmOURrkQNrmBfQD8x+
2+AzTfGRki7Oitec5WVUfTf1sAvf1YNSUKqyrAi0RGiA402ULmGN7GSNa0J75AqC
WAJiSoDJsp8NJYPYOp4uaSarE1Ozp8M/J322Ufbp4gB/BqpppQqGgrhcR0yri7sO
N8dXbeFEGBsz/7z5U40vrppaAz2+R6LcqsBqCBfcgJoQSs//acPuFfkLT5SEd2Bh
DLrfNYhoRrXVdPHxfipxpulM4b0+ackutjc7J9UEsaSEt6Z+uz2ZxxCHAV7gq+Np
c5lF3QhuAt6Zb8WlRGwQPYzF3Gngv5PsPV89Lszgdf2H/c7FMqqZhjoLRSo77rKr
/2eHLnfskUwP+gnPR+FCly94U/WaRLbOQcCpOt3gigvQ9Jtj4q2RSwTm10DIc0MV
qY9OA7cJWsJQOY3t8hCAUDfZNdRf1PO/u+CSAVv3ZZWA8oIUzuS+kKcMVXxFmUy2
HpoEITWZ9Muduu6XSmzkH504xo8Q7O87JmhiVJwCH2MMkk/Cio3yVa+OLACtv/Nh
f7EQ6egXBqh0tgCNFjdP
=lgES
-----END PGP SIGNATURE-----

--gatW/ieO32f1wygP--

--===============1523840133==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1523840133==--
