From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [RFC] DT affinity bindings/representing bus masters with DT
Date: Mon, 18 Mar 2013 14:09:28 +1100
Message-ID: <20130318030928.GG9402@truffula.fritz.box>
References: <20130215172102.GF3014@e102568-lin.cambridge.arm.com>
 <20130306215714.GC6740@truffula.fritz.box>
 <20130311170657.GD25250@e102568-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5956457904032563741=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130311170657.GD25250-7AyDDHkRsp3ZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
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
To: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Cc: "nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--===============5956457904032563741==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8bBEDOJVaa9YlTAt"
Content-Disposition: inline


--8bBEDOJVaa9YlTAt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 11, 2013 at 05:06:57PM +0000, Lorenzo Pieralisi wrote:
> Hi David,
>=20
> thanks for your feedback.
>=20
> On Wed, Mar 06, 2013 at 09:57:14PM +0000, David Gibson wrote:
> > On Fri, Feb 15, 2013 at 05:21:02PM +0000, Lorenzo Pieralisi wrote:
[snip]
> > > Each foo@2000000 reg property maps to a device that represents a bus =
master
> > > (to make it clearer, a foo@2000000 reg property defines an address sp=
ace that
> > > belongs to a bus master, ie the address space represents a programming
> > > interface specific to that master; in the bindings above address 0x20=
00000 is
> > > the address at which acme1 device can programme its "foo" interface, =
address
> > > 0x2001000 is the address at which acme2 device can programme its "foo"
> > > interface).
> >=20
> > Ok.  I think annotating the existing reg property like this is a very
> > bad idea.  I haven't seen all the previous discussion, so I'm not
> > totally clean on what this affinity concept is about.  But as I
> > understand it, these "slave" resources cannot be treated like an
> > ordinary resource in in the reg property.  That means an older client
> > will potentially misinterpret "reg" because it doesn't know about
> > "affinity".
>=20
> Not really, "reg" still complies with the current DT bindings. Affinity
> is there to associate a reg property to a "master" but the reg property
> definition does not change. I do not think backward compatibility is a
> problem per-se here.

Ok, I did not understand the problem properly.

> > Worse, again, if I've understood correctly, resources with different
> > "masters" are essentially in different logical address spaces.  "reg"
> > properties should always sit in the logical address space representing
> > the parent node's bus.  Different address spaces could also have
> > different address sizes, which would really complicate parsing "reg".
>=20
> I think we need to post what we have, it is really complex to explain
> the issue without a concrete example. To cut a long story short I
> would not say that the resources sit in different address spaces, it is
> that we need to associate those address ranges with specific bus masters.
>=20
> We have to have a way to say:
>=20
> "Address range 0x80001000 - 0x80001fff is used to programme the control
> registers associated with the port connected to master X".
>=20
> When a CPU wants to programme a control port for a specific master, it
> needs to know what address range should be programmed.
>=20
> I mentioned "resources" instead of addresses since the problem we are
> having is the same when it comes to map IRQs to set of CPUS. We need
> to associate a resource (IRQ or address) to a set of cpus (or more in
> general, masters).

Hrm.  See, I think I may be misunderstanding the problem again,
because with this description I can see no problem.  It's already up
to the device binding to describe the purpose of each entry in the reg
property.  So what's the problem with it just being part of the
binding to say which reg entry is associated with which master port?

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--8bBEDOJVaa9YlTAt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlFGhWgACgkQaILKxv3ab8Y1GQCfdLHX1CnivhoqGzLbSgQKEbz4
gr4An1CAeSVun8ojVr/q6W3pbjz+Kzkv
=tD7J
-----END PGP SIGNATURE-----

--8bBEDOJVaa9YlTAt--

--===============5956457904032563741==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============5956457904032563741==--
