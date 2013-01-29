From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: DTs, Linux drivers & PCI Devices
Date: Tue, 29 Jan 2013 16:12:44 +1100
Message-ID: <20130129051244.GH16729@truffula.fritz.box>
References: <B98BBFB67D89184E8E876F332BDBC3E0A0C372@GLDMS85001.goldlnk.rootlnka.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6253452581110406718=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <B98BBFB67D89184E8E876F332BDBC3E0A0C372-2l2KXrxQdxTyDgnK/IoVOaDTYR/rgm5H+Z/3o1Xo0Lw@public.gmane.org>
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


--===============6253452581110406718==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/9ZOS6odDaRI+0hI"
Content-Disposition: inline


--/9ZOS6odDaRI+0hI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 28, 2013 at 02:39:54PM +0000, Saridakis, Dean   (US SSA) wrote:
> I've been diving into Linux kernel drivers & device trees for a new proje=
ct & am looking for some help.=20
>=20
> First, is it reasonable/possible to define a PCI (PCIe) device in a
> device tree? Seems like you'd have to reference a BAR#s to do this
> (& still have addresses mapped by enumeration).  A couple reasons
> I'm interested in doing this:
> - The PCI device logic will be migrated to a system bus
> - DT properties provide a nice way to pass in driver configuration data=
=20

It's certainly possible.  On traditional OF systems, PCI devices are
always shown in the device tree (and only OF, not the OS does the PCI
probing).  Only including the host bridges in flattened trees is
essentially a relaxation of the usual rules, because it's usually not
necessary and can be awkward for a flat tree system.

> It's not clear to me how the linux kernel interprets/processes the
> device tree. I'm working w/ powerpc (fsl QorIQ). E.g., shouldn't
> everything from the DT show up in /sys/bus/platform/devices ?

Not necessarily, no.  platform devices are sort of a last-resort place
for things that aren't on a well defined bus.  That usually includes
top level devices from an fdt, and often includes things further down
the fdt for platform specific buses.  But things like PCI devices, or
i2c devices or what have you will still appear under the appropriate
bus types.

> I
> noticed that not everything is there, e.g., only 2 of the 4 PCIe
> RCs. (Noticed this after trying to add my own simple dummy entry to
> a reserved reg space as an experiment).

Hrm.  Not showing all the RCs is a bit odd, though.

> Ultimately I'd like to use the DT to describe a set of logic cores
> on a subordinate bus. There is also a subordinate interrupt
> controller, which I think I can figure out how to describe, but am
> not sure how kernel glue works -- somehow I'd need to bind that
> controller to routing code I provide.=20
>=20
> Documentation I've been reading includes:
> - ePAPR
> - DT wiki
> - kernel doc (driver-model, devicetree)
> - Linux DDs v3 (no coverage of platform drivers) Any other recommended do=
cs?

Although large parts of it won't be terribly relevant to you, you
should probably look at the original OF spec - IEEE 1275, and also the
PCI Bus binding document for IEEE 1275.

http://www.complang.tuwien.ac.at/forth/1275.ps.gz

http://www.openfirmware.org/ofwg/bindings/pci/pci2_1.pdf

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--/9ZOS6odDaRI+0hI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlEHWkwACgkQaILKxv3ab8Yz1QCgiv/tHGztDhsIdhTMauZsMNLV
sx0Anj7d90yUS0nDeIzgRLkw6NVwTCjB
=jrY7
-----END PGP SIGNATURE-----

--/9ZOS6odDaRI+0hI--

--===============6253452581110406718==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============6253452581110406718==--
