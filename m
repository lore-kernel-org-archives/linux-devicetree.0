From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [Ksummit-discuss] Devicetree Workshop at Kernel Summit Prague
 (26 Oct 2017)
Date: Fri, 20 Oct 2017 21:01:41 +1100
Message-ID: <20171020100141.GI13245@umbus>
References: <20171017114823.58476908@bbrezillon>
 <CAGb2v67GU4uW7uPMrqFjTW0qBR6LPNeX4Md+tf9S=HRWT_GVqA@mail.gmail.com>
 <20171018110958.mh76pngzluazmc7y@sirena.co.uk>
 <20171018175910.GP12015@bill-the-cat>
 <FD387FCC-3F95-48DF-B412-3384EF96FCFC@fubar.geek.nz>
 <CAL_JsqJTE5p0zjm-66D2143dEx+xQ0uKCV-20kMt-kq=SOa-8Q@mail.gmail.com>
 <23a238d7-0b3d-8b46-b2fe-88b9d0841aa1@st.com>
 <CAL_Jsq+p=-yTY4BNKXdSccPcBWsCUkP8HPQ-ergZXPB8msY5ig@mail.gmail.com>
 <59E8F2EC.5090602@gmail.com>
 <fea62563-6629-6d79-06a9-3d17c97ad238@st.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="AptwxgnoZDC4KQWS"
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <fea62563-6629-6d79-06a9-3d17c97ad238-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Kumar Gala <kumar.gala-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "ksummit-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org" <ksummit-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org>, Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Andrew Turner <andrew-/GQUgJ3qWXsIvnNNuaVxrw@public.gmane.org>, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--AptwxgnoZDC4KQWS
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 20, 2017 at 11:55:20AM +0200, Alexandre Torgue wrote:
> Hi Frank,
>=20
> On 10/19/2017 08:46 PM, Frank Rowand wrote:
> > On 10/19/17 07:59, Rob Herring wrote:
> > > On Thu, Oct 19, 2017 at 9:00 AM, Alexandre Torgue
> > > <alexandre.torgue-qxv4g6HH51o@public.gmane.org> wrote:
> > > > Hi Rob,
> > > >=20
> > > >=20
> > > > On 10/19/2017 01:53 AM, Rob Herring wrote:
> > > > > On Wed, Oct 18, 2017 at 6:28 PM, Andrew Turner <andrew-/GQUgJ3qWXt9iftTYHNiNg@public.gmane.org=
=2Enz>
> > > > > wrote:
> > >=20
> > > [...]
> > >=20
> > > > > >   From the FreeBSD perspective I=E2=80=99d like it if there was=
 a common repo for
> > > > > > all devicetree consumers to share. We are trying to not have Fr=
eeBSD
> > > > > > specific properties as this has caused issues in the past where=
 we had (and
> > > > > > still have) FreeBSD specific dts files. We are trying to remove=
 these as
> > > > > > drivers are updated to handle the common bindings.
> > > > >=20
> > > > >=20
> > > > > Are you aware of this repo[1]? I don't have a sense for how widely
> > > > > used it is. If not, it is intended to provide a common repository=
 of
> > > > > binding docs and dts files. If so, what are your issues with usin=
g it?
> > > > > It's generated from the kernel tree with git-filter-branch and th=
rough
> > > > > the kernel tree is the only way to add things currently. But ther=
e's
> > > > > no requirement that you add a Linux driver to submit a binding or=
 dts
> > > > > change. We could consider taking patches against the tree directl=
y,
> > > > > and the maintainers (me) can fixup the paths and apply to the ker=
nel
> > > > > tree.
> > > > >=20
> > > > > If there's bindings in the kernel tree you think are crap and Lin=
ux
> > > > > specific, I'd like to know that too. We should start flagging tho=
se.
> > > > >=20
> > > > > > I have also spoken with some NetBSD and OpenBSD developers. The=
y are both
> > > > > > using devicetree to handle device enumeration. Having all 5 pro=
jects using a
> > > > > > common set of dts files and binding would simplify keeping them=
 in sync.
> > > > >=20
> > > > >=20
> > > > > There's more than 5 likely: linux, 3x BSD, u-boot, barebox, zephy=
r,
> > > > > ARM trusted firmware?, UEFI?, ?
> > > >=20
> > > >=20
> > > > First, sorry to come late in this discussion (please be tolerant if=
 you
> > > > already respond to following requests/interrogations in precedent m=
ails :)).
> > > >  From STmicro point of view we have the same kind of requests/needs=
 than
> > > > Andrew. We think about the possibility to use same DTS files for Li=
nux,
> > > > U-boot, ATF and Zephir (others could come with other vendors). Curr=
ently our
> > > > main concerns about this are:
> > > >=20
> > > > 1-How to reduce dtb size:
> > > >          --> Reading some thread, you already start this task with =
Nicolas.
> > > > Does it concerns only XiP system ?
> > >=20
> > > That's the main focus ATM. Nico has looked at shrinking code usage too
> > > such as the tty layer and scheduler, but those have faced resistance.
> > > We need actual products to prove the value (and that's a chicken and
> > > egg problem).
> > >=20
> > > >          -->For example, I want to use the same dtsi files between =
Linux and
> > > > U-boot. If in u-boot dts file I overload several "status" entry by
> > > > "disabled", is it possible that compiler doesn't build it ? And wha=
t about
> > > > not used phandle ?
> > >=20
> > > You certainly could remove disabled nodes in dtc. I'm not sure how
> > > hard it would be to plumb into dtc. I think phandle properties are
> > > already only created if there's a reference to them. If that is
> >=20
> > Yes, phandles are only created if referenced, unless compiled
> > for loading overlays into:
> >=20
>=20
> Are there DTC "extra" options to use to not build those useless phandles =
? I
> just tried to revert the dtb to dts (using following command:
>  ./scripts/dtc/dtc -I dtb -O dts -o stm32f469-disco-flat.dts
> arch/arm/boot/dts/stm32f469-disco.dtb)

As he said, phandles are only created if referenced in the normal mode
of operation.  Only if you add extra options for allowing overlays
(-@) will phandles be created for all labelled nodes (because it's
impossible for dtc to determine which ones are necessary).

> I see that phandles not used are in the dts output file.

Uh.. what do you mean by that?  Do you just mean you don't see any
&whatever in the dts output?  You'll never get that - once the
phandles are resolved, they're just integers, when decompiling there's
no way for dtc to determine which integers used to be phandles.

> It is especially an
> issue for pinmux phandles. All pinmux groups possibilities are written
> inside (in my case) stm32f4-pinctrl.dtsi. This file is included in each
> stm32 board dts files, and in those stm32 board dts files only required n=
ode
> are enabled. But I see that all pinmux definitions are embedded inside dtb
> binary (even ones not used in board dts file).
>=20
>=20
> regards
> Alex
>=20
> > $ cat test1.dts
> > /dts-v1/;
> > / {
> > 	mynode: node {
> > 	};
> > };
> > $ cat test2.dts
> > /dts-v1/;
> > / {
> > 	mynode: node {
> > 		myprop =3D < &mynode >;
> > 	};
> > };
> > $ scripts/dtc/dtx_diff test1.dts
> > /dts-v1/;
> >=20
> > / {
> >=20
> > 	mynode: node {
> > 	};
> > };
> > $ scripts/dtc/dtx_diff test2.dts
> > /dts-v1/;
> >=20
> > / {
> >=20
> > 	mynode: node {
> > 		myprop =3D <0x1>;
> > 		phandle =3D <0x1>;
> > 	};
> > };
> >=20
> >=20
> > If symbols are enabled for a base device tree, so that overlays
> > can later reference them, then all symbols generate phandles:
> >=20
> > $ dtc -@ -O dts test1.dts
> > /dts-v1/;
> >=20
> > / {
> >=20
> > 	mynode: node {
> > 		phandle =3D <0x1>;
> > 	};
> >=20
> > 	__symbols__ {
> > 		mynode =3D "/node";
> > 	};
> > };
> >=20
> > > created before you deleted nodes, then it would probably be hard to
> > > find and remove all of those. It would be similar to solving the
> > > device dependency problem. Or do you mean something like disable the
> > > clock controller node if there are no enabled references to it? I
> > > don't think we could do something like that generically and reliably.
> > >=20
> > > We did recently stop creating both "phandle" and "linux,phandle"
> > > properties by default in dtc, so that will save some size.
> > >=20
> > > > 2- The place of DT files (sources/scripts). I see (and clone) your
> > > > "devicetree-rebasing.git" tree, it's a good start point. Currently =
(correct
> > > > me  if I'm wrong) the Kernel seems to "lead" the devicetree binding=
s and
> > > > devicetree dts(i) files.
> > >=20
> > > Yes, and there's not really any changing that regardless of where
> > > bindings and dts files live given Linux has the broadest h/w support.
> > >=20
> > > > By using this external repo, it would be maybe
> > > > easier to integrate changes for other components than Linux Kernel ?
> > >=20
> > > Yes, barebox at least regularly imports it.
> > >=20
> > > > We
> > > > could have (per vendor), same dtsi files which describes the hardwa=
re (SoC +
> > > > board) and a extra dts files (at least at beginning) per software c=
omponents
> > > > to overload nodes (to disable some nodes not required (see (1)), to=
 change
> > > > bindings which are different regarding component ...).
> > >=20
> > > You mean dtsi files to disable nodes for linux, u-boot, etc. That may
> > > make sense for mutually exclusive things like FreeBSD vs. Linux, but
> > > for say u-boot, we really want u-boot and Linux (or whatever OS is
> > > loaded) to use the same dtb. Having different dtbs is going to
> > > increase your memory usage.
> > >=20
> > > > It will also allow to have all dt script / tools for all components=
 at only
> > > > one place.
> > > >=20
> > > > Once again, sorry if I repeat things already discussed but I wanted=
 to
> > > > expose what STMicro has in mind for DT. It will be a good topic to =
discuss
> > > > at Prague.
> > >=20
> > > Yes, but I won't be there.
> > >=20
> > > Rob
> > > _______________________________________________
> > > Ksummit-discuss mailing list
> > > Ksummit-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org
> > > https://lists.linuxfoundation.org/mailman/listinfo/ksummit-discuss
> > >=20
> >=20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--AptwxgnoZDC4KQWS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlnpyYMACgkQbDjKyiDZ
s5KUOhAAvJojK1dWU9QzgRnAaqJwgfy0V6WaSegtqwmjZJS49EwKua/ZWm/Pp4uF
aNgtlEz0LU8nXw13kH56FtWmBKPOlj2f2qTb4sBKG4BUBXASrOmY4LLx/1phNbKA
+SQGbnqnD81e7YJXhoc+ld9aTEF45bnNq+1D2AutAluuFGXIPXIJTGQ4tTRQtVye
ukgjlRV2e3z08Bzvdjl2ROQdryPWkRJA3KPpbuqQcFUA4hzUwc+1UICwewas3edA
6Oq5xqGi9ailA+tbwW4DTy1szDAIvfuM57Nrr3+vLfyBK50FGTl+jg+R82Pk33SD
AxA/loR8sCBrmIItIBCi0qzWWe3vdHZgkJtm7yTyDJWm9PTtxcbrFtivSf8s2kPu
4QBRXBJM37cc1iyA3Jb0uc/RZDA0cH8TOjNixvPK/jyE49ve5VlkJq7b1qoMdwtI
zjGbzJazFNqrK67kjdL0qodeF4eSQWxHQSEIrlf5hF/3dTMcXASQ9OviFyHZHNhj
PTwzOIYeqdQcsRzR+l+SbYsIn9CBzDM0vEys2iTs3aLuURYlCz//yZKvfSxg9n41
r37QgRBr3VSosx88h2p6n+QlcNUR8Y1OcK0Egk0+apJEH32DRx7INuNx+4L+nPnr
e6/WYmrnWQWTumMN11w18KJWV3CVUUJf6USojfd07JN6j1GjjBA=
=ImKx
-----END PGP SIGNATURE-----

--AptwxgnoZDC4KQWS--
