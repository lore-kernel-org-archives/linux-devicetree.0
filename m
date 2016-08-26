From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [RFC] drm: implement generic firmware eviction
Date: Fri, 26 Aug 2016 14:52:53 +0200
Message-ID: <20160826125253.GB21452@lukather>
References: <20160826000056.12806-1-dh.herrmann@gmail.com>
 <29bc1dab-7445-8470-f59b-6df908e83a3f@redhat.com>
 <CANq1E4QFB4k+8C4eZUuUwO7mYDDYrKx2wbPJfAKe_GoOLOHv=A@mail.gmail.com>
 <345e23d3-b55b-4d4d-e585-0ec8b243feb8@redhat.com>
 <20160826085823.GB30441@lukather>
 <04f9cb51-94f3-a26d-4966-385175340dd7@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0057438060=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <04f9cb51-94f3-a26d-4966-385175340dd7@redhat.com>
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


--===============0057438060==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/e2eDi0V/xtL+Mc8"
Content-Disposition: inline


--/e2eDi0V/xtL+Mc8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 26, 2016 at 11:02:17AM +0200, Hans de Goede wrote:
> Hi,
>=20
> On 26-08-16 10:58, Maxime Ripard wrote:
> >Hi,
> >
> >On Fri, Aug 26, 2016 at 10:43:55AM +0200, Hans de Goede wrote:
> >>>>I'm not sure we would want to remove the device at all, we
> >>>>certainly should not be removing the dt_node from the devicetree
> >>>>IMHO. Having that around to see how the bootloader set things up
> >>>>is really useful for debugging and normally we should never modify
> >>>>the devicetree as set up by the bootloader.
> >>>>
> >>>>Why not just unbind the driver from the platform device? That
> >>>>should be enough.
> >>>
> >>>That will leave IORESOURCE_MEM around, causing conflicts if
> >>>re-used/claimed by other devices/drivers. Furthermore, it is really
> >>>fragile leaving the device around, without any control over
> >>>possible future driver probing.
> >>
> >>Ah, good point. On ARM this currently typically is reserved by the boot=
loader
> >>so never touched by the kernel at all, not even when the simplefb is no=
 longer
> >>used, actually returning this memory to the kernel after unbinding the =
simplefb /
> >>destroying the simplefb platform-dev would be really good to do. We sho=
uld
> >>probably figure out how that should be done before getting rid of
> >>remove_conflicting_framebuffers... (sorry).
> >
> >That would be rather easy to do. The firmware could generate a
> >reserved-memory node instead of passing a smaller memory size to the
> >kernel. That way, the kernel will know that it's actual ram that it
> >can reclaim.
>=20
> So when would the kernel reclaim the RAM then?

When we kickout the framebuffer driver?

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--/e2eDi0V/xtL+Mc8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXwDulAAoJEBx+YmzsjxAgkTIP/RAbddk7wybXW0cuJntieUoT
+NHRf9EMTAOaMU+ZKBLam+bIuaB4RxZBpegfS4enijxeHPLxYJMP2VYtzovPQtqG
2ITvU7cydZYzIoJScnviLtaib3dKSrThyQ+H4n1U1zu7bFk9wIZWNoFK/SwiQSy5
Vr3Jivy8+4CCsVlvPwtd9MdDPr0XMb4W1+w9fK55AzBaYjn9akFWW3I8aO6RtSE4
BAjMimnwezdrS0E63FLcMMOWHRtmP3zyPeROP7J21GJK4U03jQ8kjQZFCgjJLhlZ
z1gqpo9JBIctsm8UAYqAatT56QoljJu7hkAcyPOR4+4VTR5R+NJ4hQKypzO6IOvL
QRgMagmnRDy/6woL4KtXFKGDrHaGdlCNNt5r+wcC4iiClCAcg7JzBpmaBQGBEVdJ
/6yHb3yV4SbASrciWgTYuhgY+sx+NKaUrUsmR90RCGEw5lkND/d8nOrCFI5ibQd9
isz22lb4KbZKjdqHQ0wk7TVcpXWUdg2NK25cadGeL569KBgg4dsJpjVfyWzw5tAp
XyxOdAHmk7WGSj4RHtdtlwYMztiQvXXGV+wsbHuEkvM+JGPGV79omF8jknZ0XJpt
98o6B+pUkBX/1Q7mBux5nJUd7hX6BOPDef7gAoaXr6l2RGiGhZeEIYMRsLmz/oTa
QLbdGf9f3+pyj+3pfHp8
=1jP2
-----END PGP SIGNATURE-----

--/e2eDi0V/xtL+Mc8--

--===============0057438060==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0057438060==--
