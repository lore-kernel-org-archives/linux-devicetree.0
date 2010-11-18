From: Michael Ellerman <michael-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
Subject: Re: [PATCH 3/3] x86: OLPC: speed up device tree creation during
	boot (v2)
Date: Thu, 18 Nov 2010 22:02:15 +1100
Message-ID: <1290078135.22575.4.camel@concordia>
References: <20101111214546.4e573cad@queued.net>
	<reply-olpc-3-v2@mdm.bga.com> <20101112002704.50c629e2@queued.net>
	<20101114095013.GB24206@elte.hu> <4CE0B54E.6000101@zytor.com>
	<20101115070254.GA25243@elte.hu> <4CE17133.2050101@zytor.com>
	<20101118083420.GC26398@elte.hu>
Reply-To: michael-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1668040103119706272=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20101118083420.GC26398-X9Un+BFzKDI@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Ingo Molnar <mingo-X9Un+BFzKDI@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, "H. Peter Anvin" <hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Milton Miller <miltonm-ogEGBHC/i9Y@public.gmane.org>, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Andres Salomon <dilinger-pFFUokh25LWsTnJN9+BGXg@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--===============1668040103119706272==
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature"; boundary="=-TDsR970TqK/BnEdaUhgh"


--=-TDsR970TqK/BnEdaUhgh
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2010-11-18 at 09:34 +0100, Ingo Molnar wrote:
> * H. Peter Anvin <hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org> wrote:
>=20
> > On 11/14/2010 11:02 PM, Ingo Molnar wrote:
> > >=20
> > > * H. Peter Anvin <hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org> wrote:
> > >=20
> > >> What?  What is wrong with static variables in functions?  It really =
doesn't seem=20
> > >> to be a good idea to make them file-scope if they don't need to be.
> > >=20
> > > They are very easy to overlook and mix up with regular stack variable=
s and i've seen=20
> > > (and introduced myself) a number of bugs due to them.
> > >=20
> > > They also often are used in buggy ways (with SMP not taken into consi=
deration), so=20
> > > overlooking them during review compounds their negative effects. Putt=
ing them in=20
> > > front of the function isnt a big deal in exchange.
> > >=20
> > > There are people who never overlook them (like yourself), but my brai=
n is wired up=20
> > > differently.
> > >=20
> >=20
> > However, I have to vehemently object to putting them in a wider scope
> > than is otherwise necessary.  I agree that static variables should be
> > used sparsely if at all (there really are vary few uses of them that ar=
e
> > valid), but putting them in a larger scope screams "I'm used in more
> > than one function", and that is *not* a good thing.
>=20
> That's why we sometimes use the (imperfect) compromise to put them in fro=
nt of that=20
> function, not at the top of the file.
>=20
> Look at the general balance of hardship: very little harm is done (it's n=
ot a big=20
> deal if a variable is only used in a single function) but having it with =
local=20
> variables can be _really_ harmful - for example i overlooked them when i =
reviewed=20
> this patch. I dont like important details obscured - i like them to be ap=
parent.=20
> Again, this is something that some people can parse immediately on the vi=
sual level=20
> - me and many others cannot.

What about:

int foo(void)
{
	static int bar;

	struct thing_struct *thing;
	int other_var;
	char *p;

	...
}

I think the visual wrongness of that formatting would be enough for me
to stop and look twice. Though I guess it doesn't work if you have few,
or no other variables other than the statics to declare.

cheers


--=-TDsR970TqK/BnEdaUhgh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkzlB7MACgkQdSjSd0sB4dLRiwCePlCH9Mp4T5KVXKQ+4CLamUJ1
PvEAoMnzw47YZ3Vo7s0qkh2QRNOZyGgQ
=L99G
-----END PGP SIGNATURE-----

--=-TDsR970TqK/BnEdaUhgh--


--===============1668040103119706272==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============1668040103119706272==--
