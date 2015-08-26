From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 1/7] drm/vc4: Add devicetree bindings for VC4.
Date: Wed, 26 Aug 2015 14:09:36 +0200
Message-ID: <20150826120934.GC320@ulmo.nvidia.com>
References: <1439427380-2436-1-git-send-email-eric@anholt.net>
 <1439427380-2436-2-git-send-email-eric@anholt.net>
 <55CEC25E.7070303@wwwdotorg.org>
 <874mjxwyx5.fsf@eliezer.anholt.net>
 <CAL_JsqJxiGUR5BxBPyR3-0NxqWsOxMGrWQA6cMXe2pjTom__nw@mail.gmail.com>
 <CAF6AEGu2fi0M7DsicHz+5SDHi1DyDRmvWjkmYPPgY6pZ423WcA@mail.gmail.com>
 <20150826115229.GI1367@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1803065836=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20150826115229.GI1367@phenom.ffwll.local>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Rob Clark <robdclark@gmail.com>, Rob Herring <robherring2@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, linux-rpi-kernel@lists.infradead.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


--===============1803065836==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+xNpyl7Qekk2NvDX"
Content-Disposition: inline


--+xNpyl7Qekk2NvDX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2015 at 01:52:29PM +0200, Daniel Vetter wrote:
> On Tue, Aug 25, 2015 at 04:42:18PM -0400, Rob Clark wrote:
> > On Mon, Aug 24, 2015 at 9:47 AM, Rob Herring <robherring2@gmail.com> wr=
ote:
> > > On Mon, Aug 17, 2015 at 1:30 PM, Eric Anholt <eric@anholt.net> wrote:
> > >> Stephen Warren <swarren@wwwdotorg.org> writes:
> > >>
> > >>> On 08/12/2015 06:56 PM, Eric Anholt wrote:
> > >>>> Signed-off-by: Eric Anholt <eric@anholt.net>
> > >>>
> > >>> This one definitely needs a patch description, since someone might =
not
> > >>> know what a VC4 is, and "git log" won't show the text from the bind=
ing
> > >>> doc itself. I'd suggest adding the initial paragraph of the binding=
 doc
> > >>> as the patch description, or more.
> > >>>
> > >>>> diff --git a/Documentation/devicetree/bindings/gpu/brcm,bcm-vc4.tx=
t b/Documentation/devicetree/bindings/gpu/brcm,bcm-vc4.txt
> > >>
> > >>>> +- hvss:             List of references to HVS video scalers
> > >>>> +- encoders: List of references to output encoders (HDMI, SDTV)
> > >>>
> > >>> Would it make sense to make all those nodes child node of the vc4
> > >>> object. That way, there's no need to have these lists of objects; t=
hey
> > >>> can be automatically built up as the DT is enumerated. I know that =
e.g.
> > >>> the NVIDIA Tegra host1x binding works this way, and I think it may =
have
> > >>> been inspired by other similar cases.
> > >>
> > >> I've looked at tegra, and the component system used by msm appears t=
o be
> > >> nicer than it.  To follow tegra's model, it looks like I need to bui=
ld
> > >> this extra bus thing corresponding to host1x that is effectively the
> > >> drivers/base/component.c code, so that I can get at vc4's structure =
=66rom
> > >> the component drivers.
> > >>
> > >>> Of course, this is only appropriate if the HW modules really are
> > >>> logically children of the VC4 HW module. Perhaps they aren't. If th=
ey
> > >>> aren't though, I wonder what this "vc4" module actually represents =
in HW?
> > >>
> > >> It's the subsystem, same as we use a subsystem node for msm, sti,
> > >> rockchip, imx, and exynos.  This appears to be the common model of h=
ow
> > >> the collection of graphics-related components is represented in the =
DT.
> > >
> > > I think most of these bindings are wrong. They are grouped together
> > > because that is what DRM wants not because that reflects the h/w. So
> > > convince me this is one block, not that it is what other people do.
> >=20
> > I think, when it comes to more complex driver subsystems (like drm in
> > particular) we have a bit of mismatch between how things look from the
> > "pure hw ignoring sw" perspective, and the "how sw and in particular
> > userspace expects things" perspective.  Maybe it is less a problem in
> > other subsystems, where bindings map to things that are only visible
> > in the kernel, or well defined devices like uart or sata controller.
> > But when given the choice, I'm going to err on the side of not
> > confusing userspace and the large software stack that sits above
> > drm/kms, over dt purity.
> >=20
> > Maybe it would be nice to have a sort of dt overlay that adds the bits
> > needed to tie together hw blocks that should be assembled into a
> > single logical device for linux and userspace (but maybe not some
> > other hypothetical operating system).  But so far that doesn't exist.
> > All we have is a hammer (devicetree), everything looks like a nail.
> > End result is we end up adding some things in the bindings which
> > aren't purely about the hw.  Until someone invents a screwdriver, I'm
> > not sure what else to do.  In the end, other hypothetical OS is free
> > to ignore those extra fields in the bindings if it doesn't need them.
> > So meh?
>=20
> I thought we agreed a while back that these kind of "pull everything for
> the logical device together" dt nodes which just have piles of phandles
> are totally accepted? At least that's the point behind the component
> helpers, and Eric even suggested to create dt-specific component helpers
> to cut down a bit on the usual boilerplate. dt maintainers are also fine
> with this approach afaik. From my understanding tegra with the host1x bus
> really is the odd one out and not the norm.

I agree that in many aspects Tegra is somewhat special. But the same
principles that the host1x infrastructure uses could be implemented in a
similar way for other DRM drivers. You can easily collect information
about subdevices by walking the device tree and matching on known
compatible strings. And you can also instantiate the top-level device
=66rom driver code rather than have it in DT. It should still be possible
to make this work without an artificial device node in DT. The component
and master infrastructure is largely orthogonal to that, and as far as I
remember the only blocker is the need for a top-level device. I wonder
if perhaps this could be made to work by binding the master to the top-
level SoC device.

Obviously adding the node in DT is easier, but to my knowledge easy has
never been a good excuse for mangling DT. Perhaps that's different these
days...

Thierry

--+xNpyl7Qekk2NvDX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJV3ax8AAoJEN0jrNd/PrOhNrAQAL6FDqCMdHlZr52YuLEwnNnT
0IGlew7pOa7Ai9YhqONhdG0IJUVxeBFE2t7OA9tXT7dVm4fo05aleNrbwD4qq/eC
kG8d5WBsDtXclIsBX2M7SzMGmfGb3pDY4YhznU4Gl9iqzohqyzZppprg21ZhASfB
jVt+Agn0fRCwVtLxFCvJPuUTHWAs8P7apjNP+D0CCp3+9H47zTJvaW8ZnBP1+hWH
kQ66j6PZf4fHz/lDiF8dCncHJkawbCda2evxtSf5nkw4lRx3wiTiVHxBgpUxYSlq
DemwleLJ6nwYxgmk5G04Wwl82ZvEGlFIjA/dcxvfT/Mc/wGkKEISYnxZ+Nyi3DjJ
Dt+5FeZUy048q/y/kAim4i20bwRFtpjCE497izKVH3Hy5ZUMgrK7WI/cy6sCGLpq
/KrBRx9yY3g5b7JwuM2E6/+V3/EdI4VEiDFjdCcsr+TqlISTh+sbuk2OzRdeVe/g
E8PhFjeTyRWD8HrA/xdMGKRjbuEp5XPgYEhe7CIQLZV+vJaXZ5v0PFAdC5XuEiQg
0ruRslIQdHwqNFMTxqRNUMRiq6G/vZmPCLBlLR0OLZQ1zC/4gRVbRoJqwi44ceLr
vhmbV6C7S7krZ9kndfaiAjKpaDUfNISP0MmwfzYEw4LEsQERjMJcK2yjB7f+/18A
tMleBVKTc5rG6rz1Yf6C
=oYaQ
-----END PGP SIGNATURE-----

--+xNpyl7Qekk2NvDX--

--===============1803065836==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============1803065836==--
