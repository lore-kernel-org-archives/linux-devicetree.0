From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 4/4] checks: Add bus checks for PCI buses
Date: Tue, 14 Feb 2017 13:12:55 +1100
Message-ID: <20170214021255.GC2169@umbus.fritz.box>
References: <20170210164717.1234-1-robh@kernel.org>
 <20170210164717.1234-5-robh@kernel.org>
 <20170213050355.GZ25381@umbus>
 <CAL_JsqLkfbFhL34y=xyKB0ooSWDUKON2may50MH6zfFG_YVEaQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="xo44VMWPx7vlQ2+2"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqLkfbFhL34y=xyKB0ooSWDUKON2may50MH6zfFG_YVEaQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--xo44VMWPx7vlQ2+2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 13, 2017 at 02:49:45PM -0600, Rob Herring wrote:
> On Sun, Feb 12, 2017 at 11:03 PM, David Gibson
> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > On Fri, Feb 10, 2017 at 10:47:17AM -0600, Rob Herring wrote:
> >> Add PCI bridge and device node checks. We identify PCI bridges with
> >> 'device_type =3D "pci"' as only PCI bridges should set that property. =
For
> >> bridges, check that ranges is present and #address-cells and
> >>
> >> For devices, the primary check is the reg property and the unit addres=
s.
> >> Device unit addresses are in the form DD or DD,F where DD is the
> >> device 0-0x1f and F is the function 0-7.
> >>
> >> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> >> ---
> >> v2:
> >> - Remove bus_type functions. Combine test for bus_type and bridge check
> >>   into single check.
> >> - Add a check that PCI bridge node name is pci or pcie.
> >>
> >>  checks.c | 83 +++++++++++++++++++++++++++++++++++++++++++++++++++++++=
+++++++++
> >>  dtc.h    |  7 ++++++
> >>  2 files changed, 90 insertions(+)
> >>
> >> diff --git a/checks.c b/checks.c
> >> index 16d17d20caec..9ebb148f947a 100644
> >> --- a/checks.c
> >> +++ b/checks.c
> >> @@ -702,6 +702,86 @@ static void check_ranges_format(struct check *c, =
struct dt_info *dti,
> >>  }
> >>  WARNING(ranges_format, check_ranges_format, NULL, &addr_size_cells);
> >>
> >> +static const struct bus_type pci_bus =3D {
> >> +     .type =3D PCI_BUS_TYPE,
> >
> > Since you can use the struct pointer itself as a handle on the bus
> > type, I don't think there's any value to having the enum-style type
> > value.  What _would_ be useful is a human readable bus type name.
>=20
> Okay.
>=20
> >> +};
> >> +
> >> +static void check_pci_bridge(struct check *c, struct dt_info *dti, st=
ruct node *node)
> >> +{
> >> +     struct property *prop;
> >> +
> >> +     prop =3D get_property(node, "device_type");
> >> +     if (!prop || strcmp(prop->val.val, "pci"))
> >> +             return;
> >> +
> >> +     node->bus =3D &pci_bus;
> >> +
> >> +     if (strncmp(node->name, "pci", node->basenamelen) &&
> >> +         strncmp(node->name, "pcie", node->basenamelen))
> >> +             FAIL(c, "Node %s node name is not \"pci\" or \"pcie\"",
> >> +                          node->fullpath);
> >
> > Please use the strneq() macro - I frequently get confused about
> > whether strcmp()/strncmp() comparisons need an ! or not for equality
> > testing.  streq() / strneq() help me remember.
> >
> >> +
> >> +     prop =3D get_property(node, "ranges");
> >> +     if (!prop)
> >> +             FAIL(c, "Node %s missing ranges for PCI bridge (or not a=
 bridge)",
> >> +                          node->fullpath);
> >> +
> >> +     if (node_addr_cells(node) !=3D 3)
> >> +             FAIL(c, "Node %s incorrect #address-cells for PCI bridge=
",
> >> +                          node->fullpath);
> >> +     if (node_size_cells(node) !=3D 2)
> >> +             FAIL(c, "Node %s incorrect #size-cells for PCI bridge",
> >> +                          node->fullpath);
> >> +}
> >> +WARNING(pci_bridge, check_pci_bridge, NULL,
> >> +     &device_type_is_string, &addr_size_cells);
> >> +
> >> +static void check_pci_device(struct check *c, struct dt_info *dti, st=
ruct node *node)
> >> +{
> >> +     struct property *prop;
> >> +     const char *unitname =3D get_unitname(node);
> >> +     char unit_addr[5];
> >> +     unsigned int dev, func, reg;
> >> +
> >> +     if (!node->parent || !node->parent->bus ||
> >> +         (node->parent->bus->type !=3D PCI_BUS_TYPE))
> >
> > You can just use node->parent->bus !=3D &pci_bus here.
> >
> >> +             return;
> >> +
> >> +     prop =3D get_property(node, "reg");
> >> +     if (!prop)
> >> +             return;
> >> +
> >> +     reg =3D fdt32_to_cpu(*((cell_t *)prop->val.val));
> >> +
> >> +     dev =3D (reg & 0xf800) >> 11;
> >> +     func =3D (reg & 0x700) >> 8;
> >> +
> >> +     if (reg & 0xff000000)
> >> +             FAIL(c, "Node %s PCI reg address is not configuration sp=
ace",
> >> +                          node->fullpath);
> >> +
> >> +     if (dev > 0x1f)
> >> +             FAIL(c, "Node %s PCI device number out of range",
> >> +                          node->fullpath);
> >> +     if (func > 7)
> >> +             FAIL(c, "Node %s PCI function number out of range",
> >> +                  node->fullpath);
>=20
> BTW, I just noticed these 2 checks I can drop. They can never be true
> since I'm masking the values.

Ah, good point.  It looks like ther should be more to check though -
dev and func are 8 bits, and you don't allow anything in the top 8
bits, but there's no checking of the remaining 16 bits.  Or the other
2 address cells for that matter.

> >> +
> >> +     if (func =3D=3D 0) {
> >> +             snprintf(unit_addr, sizeof(unit_addr), "%x", dev);
> >> +             if (!strcmp(unitname, unit_addr))
> >> +                     return;
> >> +     }
> >> +
> >> +     snprintf(unit_addr, sizeof(unit_addr), "%x,%x", dev, func);
> >> +     if (!strcmp(unitname, unit_addr))
> >> +             return;
> >
> > So as mentioned in my comments to 3/4, the test above, I would put
> > back into unit_address_vs_reg, using a callback in the bus_type which
> > formats a reg into the correct unit address.
>=20
> Humm, that doesn't really work. The unit address can be in 2 different
> forms when func# is 0. We can have either <dev> or <dev>,0.

Ah, good point.  Alright leave it as is for now.  When we get more bus
types we can see if it makes sense to generalize something.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--xo44VMWPx7vlQ2+2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYomenAAoJEGw4ysog2bOSankP/33//v39hOIchKdfyitFu7Ir
/PARvDb1GFu+ILWJy15GQqMZ3p2e/05R9W0s0kI3cY9X3Zy3abZI7SZ6JcGl3O2U
Uc2Z2pYuCjZpIajA5CReo5iQiMHF4NkIm3YTzghMvfG6Q0+Gox1uqS8nP/CsHQb1
VfJvC1yJis51jleE9U4xqwuOqessHsOibyTvfuEW5MQ4oh8vUBhN3IEfH3trU7pr
91tOd/v2svy05oDRH3ddXecimv1xQrq2KqPPRQjfZlYUxdXjgT0YpUK0zMauQehY
eaCM/XUgKI4uLSq0ps9mo0XCV0CVreEyQHy408rQS3eyptIgC5QTIaSAhimIb/SL
2QDOWkHl7Fm4aZ7z105CCh1Gv6zMC11myThNKDidCFlXx9xs9//VEsCSKCSpoShu
Bq7wYweYBYfCyhwwNIx+97cR4QWGqhKtVnOX/U6Td4OT6nOvtJhQ6/htEHveFbDA
399hzQYSWsqpqHtTTkjf+eUeC31itqKrBuzIclzVzEVuIAxzOjKOL29LyWWpn3SJ
+iZRquqYNNCMavxtKloWhM0C8vpdItNMjLl8pAikJdKcGqeealxt28btmC3mFrjB
QIdlNEYdOx/x2rEx0DCNVMZCGI3qyRpmidHMWmrdBzvG5F8w3ZYbvg+sdZO8Mxrk
kdTvTjSe7VeidL3v9iGX
=WU6g
-----END PGP SIGNATURE-----

--xo44VMWPx7vlQ2+2--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
