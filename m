From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: DTs, Linux drivers & PCI Devices
Date: Tue, 5 Feb 2013 15:28:09 +1100
Message-ID: <20130205042809.GJ821@truffula.fritz.box>
References: <20130129051244.GH16729@truffula.fritz.box>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0851692985468032567=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: "Saridakis, Dean   (US SSA)" <dean.saridakis-IHqVjY1oUdQxoycv7ERPSQ@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--===============0851692985468032567==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1y6imfT/xHuCvpN0"
Content-Disposition: inline


--1y6imfT/xHuCvpN0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 30, 2013 at 12:58:59AM +0000, Saridakis, Dean   (US SSA) wrote:
> > > I've been diving into Linux kernel drivers & device trees for a new p=
roject &
> > am looking for some help.
> > >
> > > First, is it reasonable/possible to define a PCI (PCIe) device in a
> > > device tree? Seems like you'd have to reference a BAR#s to do this (&
> > > still have addresses mapped by enumeration).  A couple reasons I'm
> > > interested in doing this:
> > > - The PCI device logic will be migrated to a system bus
> > > - DT properties provide a nice way to pass in driver configuration
> > > data
> >=20
> > It's certainly possible.  On traditional OF systems, PCI devices are al=
ways
> > shown in the device tree (and only OF, not the OS does the PCI probing).
> > Only including the host bridges in flattened trees is essentially a rel=
axation of
> > the usual rules, because it's usually not necessary and can be awkward =
for a
> > flat tree system.
> >=20
>=20
> I'm learning as I go here, thanks for your patience:

> - I'm using U-boot & just discovered it modifies the device tree

> - From what I read in the spec's you referenced, seems like the
> assigned-addresses (assigned-address?) property would be the how the
> BAR window addresses would be passed to the OS.

That's right, IIRC.  That's assuming that the firmware does actually
assign BARs.  That would always be the case in traditional OF, but not
necessarily in the flat tree world.  In that case I think a firmware
that did not assign BARs could just leave assigned-addresses missing.

> So not sure if U-boot boardsetup can be convinced to create or fill
> in PCI device nodes in the DT. Looks like it's based on your libfdt
> (thank you!), but details are "left as an excercise for the reader."
>=20
> And if I could get U-boot to fill things in, it's not clear if/how
> linux kernel init would handle it.

On ARM, I don't know.  On powerpc I know our PCI code can deal with
PCI device nodes being either present or absent, but I think the
platform code usually tells it which to expect.

> (Saw a reference to "PCI OF bindings" in booting-without-of.txt, but
> wasn't sure what that was referencing...)
>=20
> If that were to all come together, I'd also like to define child
> nodes under a PCI device BAR node. (That'd be the most elegant
> approach.) Since "reg" is used to define the child register offsets
> within the BAR address space, but the BAR address is established w/
> assigned-addresses, not sure how those dots would connect.=20

Child nodes under a BAR?  Um.. I really have no idea what you're
looking for here.


> I guess an example of how a traditional OF system would represent a
> PCI device would clear up some of my confusion - any pointers?

The device tree on any server class powerpc machine or a sparc machine
with a PCI bus should show you that.  Where to get access to such a
machine is less obvious, sorry.

> > > It's not clear to me how the linux kernel interprets/processes the
> > > device tree. I'm working w/ powerpc (fsl QorIQ). E.g., shouldn't
> > > everything from the DT show up in /sys/bus/platform/devices ?
> >=20
> > Not necessarily, no.  platform devices are sort of a last-resort place =
for things
> > that aren't on a well defined bus.  That usually includes top level dev=
ices from
> > an fdt, and often includes things further down the fdt for platform spe=
cific
> > buses.  But things like PCI devices, or i2c devices or what have you wi=
ll still
> > appear under the appropriate bus types.
> >=20
> > > I
> > > noticed that not everything is there, e.g., only 2 of the 4 PCIe RCs.
> > > (Noticed this after trying to add my own simple dummy entry to a
> > > reserved reg space as an experiment).
> >=20
> > Hrm.  Not showing all the RCs is a bit odd, though.
>=20
> Looks like U-boot boardsetup filtered these out.
>=20
> >=20
> > > Ultimately I'd like to use the DT to describe a set of logic cores on
> > > a subordinate bus. There is also a subordinate interrupt controller,
> > > which I think I can figure out how to describe, but am not sure how
> > > kernel glue works -- somehow I'd need to bind that controller to
> > > routing code I provide.
> > >
> > > Documentation I've been reading includes:
> > > - ePAPR
> > > - DT wiki
> > > - kernel doc (driver-model, devicetree)
> > > - Linux DDs v3 (no coverage of platform drivers) Any other recommended
> > docs?
> >=20
> > Although large parts of it won't be terribly relevant to you, you should
> > probably look at the original OF spec - IEEE 1275, and also the PCI Bus=
 binding
> > document for IEEE 1275.
> >=20
> > http://www.complang.tuwien.ac.at/forth/1275.ps.gz
> >=20
> > http://www.openfirmware.org/ofwg/bindings/pci/pci2_1.pdf
> >=20
>=20
> Hope I didn't ramble too much -- getting tired...
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--1y6imfT/xHuCvpN0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlEQilkACgkQaILKxv3ab8bLMACdFjSM+AEiu8r1AFapJvvnn3hw
2WoAnjksC0N4VXw5KY3FOl3zF/1RqIhB
=JgR2
-----END PGP SIGNATURE-----

--1y6imfT/xHuCvpN0--

--===============0851692985468032567==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============0851692985468032567==--
