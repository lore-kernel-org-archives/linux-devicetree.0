From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [Celinux-dev] Invitation and RFC: Linux Plumbers Device Tree
 track proposed
Date: Wed, 6 May 2015 13:28:46 +1000
Message-ID: <20150506032846.GC1407@voom.redhat.com>
References: <8251B150E4DF5041A62C3EA9F0AB2E0603A53FE1082E@SELDMBX99.corpusers.net>
 <5543EE80.5060109@landley.net>
 <CAL_JsqKkZYEMdYmh=JkA6O34a+7mKy=SgB2XxzgTM70mihgQeQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="w7PDEPdKQumQfZlR"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqKkZYEMdYmh=JkA6O34a+7mKy=SgB2XxzgTM70mihgQeQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, "Rowand, Frank" <Frank.Rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "celinux-dev-idqoXFIVOFIh9xQPArXXUATG8MYbGj4l@public.gmane.org" <celinux-dev-idqoXFIVOFIh9xQPArXXUATG8MYbGj4l@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--w7PDEPdKQumQfZlR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 04, 2015 at 06:20:35PM -0500, Rob Herring wrote:
> On Fri, May 1, 2015 at 4:22 PM, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org> wrote:
> > On 04/11/2015 02:20 PM, Rowand, Frank wrote:
> >> In recent years there have been proposed tools to aid in the creation =
of valid
> >> device trees and in debugging device tree issues.  An example of this =
is the
> >> various approaches proposed (with source code provided) to validate de=
vice tree
> >> source against valid bindings.  As of today, device tree related tools,
> >> techniques, and debugging infrastructure have not progressed very far.=
  I have
> >> submitted a device tree related proposal for the Linux Plumbers 2015 c=
onference
> >> to spur action and innovation in such tools, techniques, and debugging
> >> infrastructure.
> >>
> >> The current title of the track is "Device Tree Tools, Validation, and
> >> Troubleshooting".  The proposal is located at
> >>
> >>    http://wiki.linuxplumbersconf.org/2015:device_tree_tools_validation=
_and_trouble_shooting
> >
> > Want I want to do is:
> >
> > 1) Download an archive of device tree files describing a bunch of
> > boards. (Both dts and corresponding dtb files, with maybe a .txt telling
> > me about the board and the -append line qemu needs to give it any
> > board-specific kernel command line stuff like "console=3Dmyserialport".)
>=20
> The dts half is here[1]. It is a kernel repository automatically
> stripped of everything but dts files.
>=20
> > 2) Feed one of the dtb files to qemu to instantiate a bunch of devices.
>=20
> I'd like this too. The QEMU maintainers don't really agree. I think
> the ARM virt platform is the wrong way around with QEMU generating the
> DT. There was a patch series to allow sysbus devices to be created on
> the command line like you can with PCI. This would have allowed a
> front end script to generate a QEMU command line from a DT. I'm not
> sure if it ever got in.

I suggested something like this several years ago to Anthony Liguori
who didn't much like it.  However qemu has changed a fair bit since
then, so it might be worth revisiting.

It's a big job though - lots of integration work with qemu's
configuration core.  In particular allowing this without breaking
migrations or the various qapis is not straightforward.

> It would lower the bar to adding new platforms to just writing models
> for blocks perhaps. I'm not sure there's enough interest. The number
> of ARM platforms supported in QEMU is much less than the kernel.

I havea presentation proposal for KVM Forum covering some ideas which
could be at least first steps towards doing this.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--w7PDEPdKQumQfZlR
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVSYpuAAoJEGw4ysog2bOScBgP/379nPcKZQkphTVwW+t19PEZ
FwJGCDw+OESy7nhwTkD4mHehZiw40+H+ptf7r6Z4+pBz0Vn0t+obiFSwZc7buRu1
H7PxSaHDcq6eok9lHJRrgia02UhmZSk4BBI/goSlFw04+mqLwHKkAKMezO8N4r15
IkGXRGqvpXkzsVeSHsz0Ml60FQ3Q3TcYV5a4rIEjHOIaAOXXi+0gEVUQ1PQBjkEg
ukQP+qum1sTUSi6xL2JYvBa2O6VI3ejRuFEZVeys+/xWL95eUQdxREzUVGv1D/iA
IbnyDAit4+6kJXw9VdD8kGB2uzZ8Fn9LdbhR4yCqna0tXEHhR3o2lQfhGrc7zt0O
7v3Q6uSzQwGtB+owugiiuzBsk/lz150dW/0NgOxxK16JV+LK7dzoiHgpFW8LnkQx
DfllkET8az3vKfgsAEGJsyAt0Ar5YS2gzhb4C3TXhYzXhhgo2LENMKhBO8bH2aC8
paO+AmsM6yJ8ucD4lthlw9bSGKSd0r4OVUgwYWj3RMeAKUiTyWTCxpWhfDzWFnS7
eKeMnwMUJLR4lllMyFJxnRO5H76A2/iywQy9QjsyWmb+VHV+3mdkPWlSx+vpEpB0
m8hJoSuWVbdh1Sk1WVpCPb5kkjfo/z+ajzaNsAv4uhLLH4toY/hObFWe8JtDhJUV
BlgMOZfbWAJsxB0gCx8x
=ASLL
-----END PGP SIGNATURE-----

--w7PDEPdKQumQfZlR--
