From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: st_fdma: Firmware filename in DT?
Date: Tue, 8 Sep 2015 13:14:40 +1000
Message-ID: <20150908031440.GB24774@voom.redhat.com>
References: <20150903144944.GC7093@griffinp-ThinkPad-X1-Carbon-2nd>
 <201509041504.38412.arnd@arndb.de>
 <20150904132617.GB4796@x1>
 <201509051117.59751.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZoaI/ZTpAVc4A5k6"
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201509051117.59751.arnd-r2nGTMty4D4@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>, Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>, Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--ZoaI/ZTpAVc4A5k6
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 05, 2015 at 11:17:59AM +0200, Arnd Bergman wrote:
> On Friday 04 September 2015, Lee Jones wrote:
> > On Fri, 04 Sep 2015, Arnd Bergmann wrote:
> >=20
> > > On Friday 04 September 2015, Lee Jones wrote:
> > > > > > If we flip it the other way round, some subsystems derive the f=
irmware
> > > > > > name from the 'node name'.  For instance, our zeroth General Pu=
rpose
> > > > > > Co-Processor RemoteProc driver has a corresponding node called
> > > > > > 'st231-gp0@40000000'.  RemoteProc adds an 'rproc-' prefix and a=
 '-fw'
> > > > > > suffix and et voil=E0, we load file:
> > > > > >=20
> > > > > >   lib/firmware/rproc-st231-gp0-fw
> > > > >=20
> > > > > IMO deriving from the node name seems fragile. Also imposing a li=
nux'ism
> > > > > "rproc" prefix on the firmware name doesn't seem correct as the f=
irmwares
> > > > > can be shared across OS's. Although this is how remoteproc subsys=
 core
> > > > > is currently working. It seems a generic DT firmware binding woul=
d actually
> > > > > be most useful for the remoteproc subsystem.
> > > >=20
> > > > The "rproc-%s-fw", where %s =3D=3D driver name, is only a fall-back=
=2E  The
> > > > RProc driver is welcome to supply a different firmware name if it
> > > > desires.  This is where I think a generic 'firmware' property would=
 be
> > > > of use.
> > >=20
> > > The firmware file name is agreed on between the device driver and the
> > > file system, so encoding the linux driver name in it seems appropriat=
e.
> > >=20
> > > Generally speaking, I'd say a good policy would be to try basing
> > > the firmware name on the "compatible" property strings. That property
> > > already contains a hierarchical list of models, which makes it partic=
ularly
> > > easy to have firmware files for specific models or those that are sha=
red
> > > across multiple variations if necessary. Just ask for the most specif=
ic
> > > compatible string first and try the more specific compatible strings
> > > (with an appropriate prefix and/or postfix added by the driver) until
> > > a file is found.
> >=20
> > It depends what you mean by "basing the firmware name on the
> > \"compatible\" property" here.  If you mean actually renaming the
> > firmware binary file to match a driver's compatible string, that's
> > absolutely out of the question.  Firmwares are not only OS agnostic,
> > but are also independent of any H/W description language a particular
> > OS or platform might be using.  Using DT'isums to rename these
> > binaries is not logical.
>=20
> I was thinking of naming the firmware and the compatible string the
> same, and often enough that makes sense when both names are picked
> by the same person. However, you make a good point that there are cases
> where the firmware file already has a name based on some other
> decision process and there may be good reasons not to rename the
> file. In that case a driver writer can do a lookup table from
> one to the other.

> The downside of a lookup table of course is that you have to modify
> the driver for each new firmware, but then again a lot of drivers
> already require that, and others can come up with a policy that lets
> you do a programmatic mapping from one to the other by picking
> clever compatible strings.

You can avoid an in-driver lookup table, though, if you use the
compatible string as an "alias" name to the canonical firmware name -
implemented with a symlink in userspace.

> > However, if you mean simply match on compatible string and supply the
> > name from within the driver, that's closer to the mark (as then we can
> > at least keep it in-house [kernel]), but it's still not particularly
> > practical for the aforementioned reasons mentioned by Peter earlier.
> >=20
> > Why not just create a new 'firmware' property?  Simples! [0]
> >=20
> > [0] http://www.oxforddictionaries.com/definition/english/simples
>=20
> My main thought was that loading a different firmware practically
> always means that the device behaves in a (sometimes more, sometimes
> less) different way, and we want to reflect that with a different
> compatible string. Having a 1:1 relation between the two strings
> enforces this.

I think this is an excellent point.  Enforcing that the compatible and
firmware travel together is actually a really good idea.  As I see it
there are two cases where separating them seems like a good idea, but
actually isn't:

1) The hardware is identical, and different firmware is used to apply
   it in different ways.

   In this case the firmware change is a usage question rather than
   hardware description and doesn't belong in the device tree.

2) There are several low-level variants on the hardware, which require
   different firmware images in order to present the same programming
   interface to the OS.

   In this case there's a very high chance that some firmware revision
   will have bugs meaning it's not *quite* compatible with the common
   programming interface.  So, it's correct to present a different
   compatible property which a driver can use if it needs to work
   around those bugs.

So, I think selecting the firmware based on the compatible property is
the correct choice for the DT.

Whether the OS uses an in-driver lookup table to go from compatible
property to firmware name, or the firmware images are renamed to match
the compatible property, or symlinks are used to put the lookup table
into the filesystem is an OS design question that shouldn't affect DT
binding design.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--ZoaI/ZTpAVc4A5k6
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJV7lKgAAoJEGw4ysog2bOSvQYP/2IpFfRZ1LhR/L3BFfnHsC63
dZrCmAScBDjRF8UqKlGp3VPcjDWyEsknBhBe7l4uotJxgCH/tMUVJbSRnpBZJct3
3CFi8kQSLqIdM4xzU30y1nPMHgx25X/hr/NQ2RKFL2vAPhuibHSXUEjCiVaB0Yv/
6YaxgAZwIHKo1tiU/iCZt7kIdi3MyD5gcSji7XVDt1y1nkLJH+kIhmBuL3O7GD2C
tVFWOjcnBeLraKvSkqVHwo5hEaHfTQm/KnH7T/LVjN+3bfQshMBn4jfq9NAHn1jI
QDDXu5Qaox1gdLNcevflSBFUE2a/cVYPTz9hPBZwh4bcPgwhGmIzeu+i6VfHbE23
0Ax8nDglspzXelIrtU3PfKe2SKmiZp0NwcqCKpbndNIHSAr9DGjkd9xVyPfgO1CO
w3tw+V8wFaSNGE2sSpjewI0foJQXoF+8/Qa40VOmMnIXOQZvIuO3D3dedGSWPc5T
vCN8MNR0RhedZhcKdhsRuwpao1JGFYTv0Fpqr1fmTFMl+nOvK2ERP5XFMSWbqLL5
6yNOWr+F/bNpJy/uInkBqOMMBJB1diLGMp6ODGYsaPkHbgOBZlql2h1bbWqBVoB3
vyxZUuXXACj+5WIyJJ7F3ZNszUhFvuUA+0vMiAgz2bFAUt3bbVhtbWEBHy40MAFg
EmQ5hAKRWgPJrwsJk1VI
=l1Up
-----END PGP SIGNATURE-----

--ZoaI/ZTpAVc4A5k6--
