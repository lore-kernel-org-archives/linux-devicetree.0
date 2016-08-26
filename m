From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [RFC] drm: implement generic firmware eviction
Date: Fri, 26 Aug 2016 15:33:37 +0200
Message-ID: <20160826133337.GD30441@lukather>
References: <20160826000056.12806-1-dh.herrmann@gmail.com>
 <29bc1dab-7445-8470-f59b-6df908e83a3f@redhat.com>
 <CANq1E4QFB4k+8C4eZUuUwO7mYDDYrKx2wbPJfAKe_GoOLOHv=A@mail.gmail.com>
 <345e23d3-b55b-4d4d-e585-0ec8b243feb8@redhat.com>
 <20160826085823.GB30441@lukather>
 <04f9cb51-94f3-a26d-4966-385175340dd7@redhat.com>
 <20160826125253.GB21452@lukather>
 <ae99ee66-e3c4-8d97-0ff1-c6764e0d9d87@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0637136080=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <ae99ee66-e3c4-8d97-0ff1-c6764e0d9d87@redhat.com>
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


--===============0637136080==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="48TaNjbzBVislYPb"
Content-Disposition: inline


--48TaNjbzBVislYPb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 26, 2016 at 02:58:51PM +0200, Hans de Goede wrote:
> Hi,
>=20
> On 26-08-16 14:52, Maxime Ripard wrote:
> >On Fri, Aug 26, 2016 at 11:02:17AM +0200, Hans de Goede wrote:
> >>Hi,
> >>
> >>On 26-08-16 10:58, Maxime Ripard wrote:
> >>>Hi,
> >>>
> >>>On Fri, Aug 26, 2016 at 10:43:55AM +0200, Hans de Goede wrote:
> >>>>>>I'm not sure we would want to remove the device at all, we
> >>>>>>certainly should not be removing the dt_node from the devicetree
> >>>>>>IMHO. Having that around to see how the bootloader set things up
> >>>>>>is really useful for debugging and normally we should never modify
> >>>>>>the devicetree as set up by the bootloader.
> >>>>>>
> >>>>>>Why not just unbind the driver from the platform device? That
> >>>>>>should be enough.
> >>>>>
> >>>>>That will leave IORESOURCE_MEM around, causing conflicts if
> >>>>>re-used/claimed by other devices/drivers. Furthermore, it is really
> >>>>>fragile leaving the device around, without any control over
> >>>>>possible future driver probing.
> >>>>
> >>>>Ah, good point. On ARM this currently typically is reserved by the bo=
otloader
> >>>>so never touched by the kernel at all, not even when the simplefb is =
no longer
> >>>>used, actually returning this memory to the kernel after unbinding th=
e simplefb /
> >>>>destroying the simplefb platform-dev would be really good to do. We s=
hould
> >>>>probably figure out how that should be done before getting rid of
> >>>>remove_conflicting_framebuffers... (sorry).
> >>>
> >>>That would be rather easy to do. The firmware could generate a
> >>>reserved-memory node instead of passing a smaller memory size to the
> >>>kernel. That way, the kernel will know that it's actual ram that it
> >>>can reclaim.
> >>
> >>So when would the kernel reclaim the RAM then?
> >
> >When we kickout the framebuffer driver?
>=20
> Yes that is when we _want_ it to reclaim the RAM, my question was when
> it will _actually_ happen ? I'm not familiar with the reserved-memory
> implementation. Does your answer mean that some driver must make an
> explicit call to get the memory reclaimed ?

The reserved-memory implementation is relying on memblock. I don't
think there is a function yet to remove a reserved memory region, but
its implementation would use memblock_free I guess.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--48TaNjbzBVislYPb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXwEUxAAoJEBx+YmzsjxAg0RYP/0ruYXx/+4cE2tQdDcOOGsQX
Dk4DHohXiHMCeGezsiX+v2IMP/cEziWpXug3GV3jxdfldIRTnZNkd7CgiXodMhmF
uFvSZ27YKEJa8av2MOvUgSv3sP005nUPdi5VVftbTkDhvYFAsL1j7r1xRJQl/t6/
h3TylYq22rbQtP2DrrAjREINZm+Cb5plRDfWRUOOZcltG1CoeiRQmMF2+AO8FEYG
3wzs6Be1sd8KBzq/qCECCh/+7qqnqhKTWo+khSfpMTxWmcACE/KIheL9455gTeHu
iup4AYPJNGim+M6pToF/sMPg4ycTFAat9//fyRpf3YN5Vw3v5EpdIXLDNxImnAhz
SnZSCMjHSpYbTiS7Lt7w2Z9WfRFp+0cNeL0U4z8hO0JzJFp2/faVuxF6pY0wxawX
rACQqX/YU0TGACJk8DDsSxukI5hvhcMNHP38NggJHCm1w8cjENkW7xz/kn4fok/B
fbVpqIsy+z7e1HaHJoyVvX597UB25TNE/yYmE3jMjbb0TaMXwAwMEkVK3zwj9/eJ
UVVWachR/0Dcw68oWfJLTU4XVNszuE6Iu5Kthvu5GDAZ2jUVPgVzJLdyuyzaiJYT
oKbvKTvw27Rlw4J3XeDFg0rggPbtl+J3z/HQQoFoNAGrO1tcaywDjvgBG58DR5on
ty/q1baEafBrcH2T8HrK
=b7Sg
-----END PGP SIGNATURE-----

--48TaNjbzBVislYPb--

--===============0637136080==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0637136080==--
