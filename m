From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Ksummit-2013-discuss] ARM topic: Is DT on ARM the solution, or
 is there something better?
Date: Wed, 23 Oct 2013 23:07:16 +0200
Message-ID: <20131023210715.GF8828@mithrandir>
References: <20131021085420.GA21518@ulmo.nvidia.com>
 <52658C49.80400@wwwdotorg.org>
 <5265AFED.1040503@roeck-us.net>
 <52665314.2040904@imgtec.com>
 <232aa6e4-19fe-4460-8101-8bf1d639ff3c@email.android.com>
 <20131022164922.GA29852@roeck-us.net>
 <20131022203546.GC8037@mithrandir>
 <20131022211000.GA30394@roeck-us.net>
 <20131023075758.GA7404@ulmo.nvidia.com>
 <20131023160131.GA20675@roeck-us.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Il7n/DHsA0sMLmDu"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131023160131.GA20675-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org" <ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--Il7n/DHsA0sMLmDu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 23, 2013 at 09:01:31AM -0700, Guenter Roeck wrote:
> On Wed, Oct 23, 2013 at 09:57:58AM +0200, Thierry Reding wrote:
[...]
> > 	pic1i2c: i2c-controller {
> > 		...
> >=20
> > 		eeprom@55 {
> > 			/* insert all other properties here */
> > 		};
> > 	};
> >=20
> If I add the above to the i2c controller node, the kernel will try to
> instantiate the eeprom when the system comes up. If no card is
> inserted at that time, this will fail. The above describes the devices
> which needs to be instantiated after a card is inserted into the connecto=
r,
> and only then (and removed when the card is pulled).
> In addition, I use the 'ideeprom' property to establish a callback
> to be able to read the eeprom contents and trigger loading the DT overlay.

That's an interesting setup and a pretty elegant solution.

> > But that breaks down once you start needing to represent more than just
> > a single EEPROM behind the connector.
> >=20
> And if insertion is dynamic, triggered by card insertion.
>=20
> There are actually several additional i2c devices on the same bus.
> To instantiate those I use devicetree overlays, but that is done
> after the eeprom is read and I know which overlay to load.

Yes, I see why you need something less traditional to pull that off. And
we should be able to describe that kind of setup using DT as well. The
world would of course be much better if this was all discoverable and we
didn't have to describe it in the first place...

> > > > > not the very least because DT isn't supported on x86 and I have t=
o deal with
> > > > > that situation as well (and, no, ACPI doesn't solve my problems t=
here either).
> > > >=20
> > > > Actually DT is supported very well on x86. There's at least one pla=
tform
> > > > in mainline that uses it (arch/x86/platform/ce4100/falconfalls.dts)=
 and
> > > > I've ported a platform that I worked on in the past to use DT on x8=
6 as
> > > > well.
> > > >=20
> > > But presumably that was DT only, or was it a system that needs to use
> > > DT on top of ACPI ? If so, I would be very interested in that experie=
nce,
> > > especially if you had any issues to get it working.
> >=20
> > I'm not quite sure I understand what you mean by "on top of ACPI". The
> > device certainly did support ACPI, but I was using DT more as a
> > supplement to describe what ACPI and PCI couldn't.
> >=20
> > To be somewhat more specific, the platform used an FPGA connected to the
> > chipset using PCIe. That itself was excellent because all of a sudden
> > devices were actually discoverable. So it was easy to just implement a
> > GPIO, SPI or I2C controller and whatnot within that FPGA, but once a
> > device behind SPI or I2C needed to be hooked up, you loose all benefits
> > from having something like PCI and you're back to square one.
> >=20
> > One example where this became essential was that the touchscreen on the
> > device was controlled by an I2C chip, and the touchscreen controller's
> > interrupt pin was connected to the GPIO controller on the PCI bus. So
> > what we ended up with looked roughly something like this:
> >=20
> > 	pci@3fc {
> > 		[...bunch of nodes to describe PCI hierarchy...]
> >=20
> > 		pci@2,0 {
> > 			/* GPIO expander */
> > 			gpio: pci@0,0 {
> > 				...
> > 				interrupt-controller;
> > 				...
> > 			};
> > 		};
> >=20
> > 		[...more nodes...]
> >=20
> > 		pci@8,0 {
> > 			/* I2C controller */
> > 			pci@0,0 {
> > 				touchscreen@48 {
> > 					...
> > 					interrupt-parent =3D <&gpio>;
> > 					interrupts =3D <1 0x8>;
> > 					...
> > 				};
> > 			};
> > 		};
> > 	};
> >=20
> > That's a *very* simplified form. The complete device tree is much more
> > complex because it requires the exact hierarchy of PCI to be represented
> > in order for the right device nodes to end up attached to the right PCI
> > devices.
> >=20
> > But perhaps that doesn't help you at all with the problems that you've
> > encountered?
> >=20
> Actually, the use case sounds pretty similar, so maybe you have solved the
> problem at least to some degree. In my case, I'll also need devicetree ov=
erlays,
> since I also need to be able to handle OIR capable cards, but that is a s=
eparate
> set of problems.
>=20
> Was this just a matter of enabling OF on this platform, or do you have an
> out-of-tree set of patches ? If the latter, is it available somewhere
> to look at (including the complete devicetree from your above example) ?

It was mostly a matter of enabling OF and writing the device tree. Most
of the generic kernel code changes I even got merged, but there were a
few patches that I never got around to merge. Some weren't anywhere
close to a mergeable state either.

I no longer work for the company and don't have access to the patches.
But I can ping a few people and see if I can dig up something for you.

Thierry

--Il7n/DHsA0sMLmDu
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSaDqDAAoJEN0jrNd/PrOhK3cQALI2wwydqAPRzAN8Bu6rMu/9
t1b5lsNER4pImA5XrizN0FfX3gG3OtJHcpt9G69ekZvg785ktdD0qNEpiOe9Xp6C
ee29STLiLJeTMfqhDnU0v6mRArdsS64sGjCMLAHcZ/4U66P2nHicbFDES1VK38c+
FaXsY+jPdg7fRrYO/27tx5OQ+aE3GBEg90SPJU5b8LOXwbL07lcFy1R0+3Ei7V1O
eVmNF1Lm7KUea9+qgfYhpEfhhawjH3DJErGN/d+ReG4UkkeB1f+xVHVj382wiM3I
HuOHyKWLRt5HQWqtIY+oJ++CrfeZRSD+LBwNNHEwzXQofMf6YvtXNViMlUwSHXef
39blwLUZunqfDlxHCatwBFyZQuX9GThdg8s6ARwFXyjoLTMM7Hn/R9b30EAOHR0i
F6dOHwdRWw0+ge8YwqU2YxndguhIRedFOXPsTKkqgim8Ljymefe756xIQ22hjzEp
J/gf7T4h9U1RR7H5G6V7LVlC45CBS/zHEMmGbpm5/ZFQAKKtC/2SED4mDG2gR6sg
G0zw17WovNEIMoGUgMyy1L50423BxT4gdGruGBXC4ln3Jvv3G4szdIL4AWGWBuvS
vWiGLszB2PyM/czHR+BBtjP0NAaaRmP6m3bJNSSKPsdUNK+Kuz/plP57GWmILwLT
WTVwNlkIn82IjUoQuUW+
=QaZe
-----END PGP SIGNATURE-----

--Il7n/DHsA0sMLmDu--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
