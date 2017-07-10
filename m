From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] libfdt.h: Define FDT_PATH_MAX
Date: Tue, 11 Jul 2017 01:30:15 +1000
Message-ID: <20170710153015.GF4083@umbus.fritz.box>
References: <1497451908-15367-1-git-send-email-pantelis.antoniou@konsulko.com>
 <20170614150522.GE2614@umbus>
 <1497468241.28265.22.camel@hp800z>
 <20170710044358.GA4083@umbus.fritz.box>
 <20170710113616.GR22707@bill-the-cat>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="aZoGpuMECXJckB41"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170710113616.GR22707@bill-the-cat>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--aZoGpuMECXJckB41
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 10, 2017 at 07:36:16AM -0400, Tom Rini wrote:
> On Mon, Jul 10, 2017 at 02:43:58PM +1000, David Gibson wrote:
> > On Wed, Jun 14, 2017 at 10:24:01PM +0300, Pantelis Antoniou wrote:
> > > Hi David,
> > >=20
> > > On Wed, 2017-06-14 at 23:05 +0800, David Gibson wrote:
> > > > On Wed, Jun 14, 2017 at 05:51:48PM +0300, Pantelis Antoniou wrote:
> > > > > Declare the maximum path size of an FDT node.
> > > > > It is useful for manipulation methods that need to know a maximum=
 value.
> > > > >=20
> > > > > Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> > > >=20
> > > > Why do you need this.  I've really tried to avoid adding arbitrary
> > > > size limits on things.
> > > >=20
> > >=20
> > > The stacked overlay patch needs it; has to 'read' in a path into a
> > > buffer and manipulate it. Otherwise it I would have to add a new meth=
od
> > > that walks the path and returns the size of it so that I can allocate
> > > the exact amount. This seems excessive IMO compared to a hard max lim=
it.
> > >=20
> > > It is similar to the way PATH_MAX works in *nix which makes things
> > > somewhat familiar.
> >=20
> > This is not necessary.  As noted elsewhere, I'm not really convinced
> > of the need of the stacked overlay application patch at all.
>=20
> How would you suggest handling the case of N baseboards and M add-on
> boards?  Creating a single overlay for each of the valid combinations of
> M is very unappealing and is one of those long-term support nightmares
> (change out the LCD panel part? Time to re-create those M combinations
> again).

Sorry, I wasn't clear.   Obviously being able to stack overlays is
useful.

What I'm not convinced of is that we need to change the overlay
application logic, rather than just the overlay generation to
accomplish that.

> > But even
> > if we took that approach I can see fairly straightforward ways to
> > eliminate the need for a PATH_MAX (removing the arbitrary limit with
> > it).
>=20
> Can you suggest some of those approaches so we can try them out then?
> Thanks!

I'm disinclined to comment in depth on the current series, until I see
a reason that it's actually a better approach than the compile time
only change I'm suggested.

In short, though, you can use fdt_subnode_offset_namelen() and
fdt_appendprop() in order to do the __symbols__ merging without
needing to explicitly construct the resolved path in a temporary
buffer.  That avoids the need for an arbitrary PATH_MAX limit, as well
as the malloc(), which libfdt isn't supposed to be using anyway.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--aZoGpuMECXJckB41
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJZY52FAAoJEGw4ysog2bOSLKkQAIwKa/ZKfjn183FluJggJMhK
XMIU6zSp3XVlrAxYHmckPwwKfGIaXU0el9Llx1SUvSZP+rrXv25gEJ3zQuPjqLfT
dcmchxkI9Yk+6JMfODvrw3bHdZokTjZ5oUcwbR7/AnyBfM8+I/9z5vaS5VU1tv74
Vr0cDeL6gQb4UeAtD3pLmgwp8mNIpxyrNRxGUQZCnNyO+Z91WPEJ8Su/y+xuRWFs
2w3+U+SfeH1ttuNto7pqxPCg+6UqpG9uCwCON2zJ36byOdFO/RXYyuvOhD7xSBwR
vD78lZi7PObvh3HUyGWGScwmHLbGqff5ddjhd1QYJzVVO1Px0b4rKtLfv+bMW2j8
c2AiDGXPaLipTc3IqsL6QAxoqynPMmJB+7GOY6c1IXk//Hq2o/FAmpZD32endJ6M
kHsd+p2ZM20Vt/IeeSxDqN2kcsHH0oj/jiDilLF6PBB79BWvez6awCd9kuKKzbIx
/6QQh2vlhg18FIL3LWSYIzcKzh5B0Hjw8xCzMDWu+9O4+maTMdK+0Rvv4O38tmh9
RUNPQ20NNCKg9CrmwBFdSlF7n8yqIvszRNuJYHxREle6+NRMvueL+WQWjVu/J1Zt
cUD0Am/ldUpNocvIDFfk3a9OSx+RowUtreUdi3fbu6H+qKfOiyCaL8yP5880pHOO
T7ubzv9fYG1Dews1naLA
=1pOA
-----END PGP SIGNATURE-----

--aZoGpuMECXJckB41--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
