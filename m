From: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] libfdt.h: Define FDT_PATH_MAX
Date: Mon, 10 Jul 2017 07:36:16 -0400
Message-ID: <20170710113616.GR22707@bill-the-cat>
References: <1497451908-15367-1-git-send-email-pantelis.antoniou@konsulko.com>
 <20170614150522.GE2614@umbus>
 <1497468241.28265.22.camel@hp800z>
 <20170710044358.GA4083@umbus.fritz.box>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="O24KMDZ/7NA1I1FI"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170710044358.GA4083-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--O24KMDZ/7NA1I1FI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 10, 2017 at 02:43:58PM +1000, David Gibson wrote:
> On Wed, Jun 14, 2017 at 10:24:01PM +0300, Pantelis Antoniou wrote:
> > Hi David,
> >=20
> > On Wed, 2017-06-14 at 23:05 +0800, David Gibson wrote:
> > > On Wed, Jun 14, 2017 at 05:51:48PM +0300, Pantelis Antoniou wrote:
> > > > Declare the maximum path size of an FDT node.
> > > > It is useful for manipulation methods that need to know a maximum v=
alue.
> > > >=20
> > > > Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> > >=20
> > > Why do you need this.  I've really tried to avoid adding arbitrary
> > > size limits on things.
> > >=20
> >=20
> > The stacked overlay patch needs it; has to 'read' in a path into a
> > buffer and manipulate it. Otherwise it I would have to add a new method
> > that walks the path and returns the size of it so that I can allocate
> > the exact amount. This seems excessive IMO compared to a hard max limit.
> >=20
> > It is similar to the way PATH_MAX works in *nix which makes things
> > somewhat familiar.
>=20
> This is not necessary.  As noted elsewhere, I'm not really convinced
> of the need of the stacked overlay application patch at all.

How would you suggest handling the case of N baseboards and M add-on
boards?  Creating a single overlay for each of the valid combinations of
M is very unappealing and is one of those long-term support nightmares
(change out the LCD panel part? Time to re-create those M combinations
again).

> But even
> if we took that approach I can see fairly straightforward ways to
> eliminate the need for a PATH_MAX (removing the arbitrary limit with
> it).

Can you suggest some of those approaches so we can try them out then?
Thanks!

--=20
Tom

--O24KMDZ/7NA1I1FI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJZY2awAAoJEIf59jXTHXZS9gkQAJ1xSRJohGb16C2nl4ON8XuL
kt5s7Uc1A/+zKws11pXqr6EIhJHe/YuHlTUpLSIx9PN+Cfmck5la+6aQfec9Hvhb
/JveaCGGiv5nykIS28F/0Me6gb7CkQXpdLB3fmGz2xufWyWhhJqQ6+eVjbqvo5Cl
MI9VPrZNWx4I9OHQWKnkaXaOHWX+eXaEK6J5gRzUlk/skJrAUevqqaWfhkWgNSx6
S4aJTbm2a2NdXlWfIEv+TxYVTdbFX/f1b8VQLaf0iLnD8XJojZ6yEdfH/Cn3ekRk
myV0WrWDio3KWdf/6fnM5vQxwR4OgOOLGAMpSvbHl3Ov1gD4p9jtT8PORRr/nCXT
KFXa6bvYl6eKF25XNI8S1urfzNm8xmNRb+SWrB8Z48K9SVDbIPai8sk213CaphCh
9pRoEot6d3m+Dsm871Asd2uBdI76pX+dVYtMLNzI7xqMsN1Z7qibEXJ1D+uxs5dg
2gRukH+ZlK3LGL2LBGHi1IW3KW9r1Qc8+IkzXVXEFBTwhhIbGNxaT1F/PY/mMh9n
ptSu7O4kalqsrZ33QAwuV4ry7rC/YVYqAnBBQHu9fMhxRA515LTJYMoRfQ65pTaE
tgHQEWLzCzwg1p7P49mWoHSq4DedSSXGrmHZ2uwpppLCNaqbiaQehwt/Cjio+StK
Erjt+tafpwrfzx+shKez
=0Doe
-----END PGP SIGNATURE-----

--O24KMDZ/7NA1I1FI--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
