From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [RFC PATCH 3/7] doc: dt: mtd: partition: add on-flash format
 binding
Date: Tue, 15 Dec 2015 17:00:56 +1100
Message-ID: <20151215060056.GB3011@voom.redhat.com>
References: <1449292763-129421-1-git-send-email-computersforpeace@gmail.com>
 <1449292763-129421-4-git-send-email-computersforpeace@gmail.com>
 <CAOiHx=nz2bdA_R610ozsQHhccdcrHVVCamTtne5ReHrA-FcaaQ@mail.gmail.com>
 <CAOMqctTbUNd0GtY07YJuxem9HkU1WZ-NtO556=Yg2QrsF49Xjw@mail.gmail.com>
 <20151207013628.GC20139@voom.fritz.box>
 <20151210204324.GK144338@google.com>
 <20151212055105.GA17011@voom.fritz.box>
 <CAMuHMdXA4-BZpvtCM8_9fYWLzoVsuCXDqvF3G4cVd50Cqsfv0g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="v9Ux+11Zm5mwPlX6"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdXA4-BZpvtCM8_9fYWLzoVsuCXDqvF3G4cVd50Cqsfv0g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Simon Arlott <simon-A6De1vDTPLDsq35pWSNszA@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, MTD Maling List <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--v9Ux+11Zm5mwPlX6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 14, 2015 at 11:22:46AM +0100, Geert Uytterhoeven wrote:
> On Sat, Dec 12, 2015 at 6:51 AM, David Gibson
> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > On Thu, Dec 10, 2015 at 12:43:24PM -0800, Brian Norris wrote:
> >> On Mon, Dec 07, 2015 at 12:36:28PM +1100, David Gibson wrote:
> >> > On Sat, Dec 05, 2015 at 10:33:30PM +0100, Michal Suchanek wrote:
> >> > > On 5 December 2015 at 12:39, Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org> wrote:
> >> > > > On Sat, Dec 5, 2015 at 6:19 AM, Brian Norris
> >> > > > <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >> > >
> >> > > >> +
> >> > > >> +Examples:
> >> > > >> +
> >> > > >> +flash@0 {
> >> > > >> +       partitions {
> >> > > >> +               compatible =3D "google,fmap";
> >> > > >> +       };
> >> > > >> +};
> >> > > >
> >> > > > I wonder if this wouldn't be better served in a separate binding=
 doc
> >> > > > with its compatible name as the filename, like we do with
> >> > > > driver^Whardware blocks, especially if we want to add more parse=
rs.
> >> > >
> >> > >
> >> > > I find that *very* counter productive for bindings that go to the =
same
> >> > > node. You have a description of a node, and then suddenly there you
> >> > > have another file with another description of the same node. Total=
ly
> >> > > awesome.
> >> >
> >> > I can't actually work out from that if you're agreeing with the
> >> > original post or the first reply.
> >>
> >> Perhaps I'm biased, but I think he was agreeing with the first reply.
> >> (Particularly, "I find that *very* counter productive" uses the word
> >> "that" to refer to "separate binding doc[s]".)
> >>
> >> > > Also how do you plan to write partitioning schemes with parameters
> >> > > like with non-zero offset of the partition table.
> >>
> >> If you are directing this question at me: I don't have a specific plan
> >> for it. MTD parsers don't currently take external input for this; many
> >> scan the whole device, but some might also have conventions built into
> >> the parser itself too, so this just gets hooked based on "compatible".
> >> But if the need arose, I would hope we could work out a common binding.
> >>
> >> > Presumably with properties in the patitions node.  Not seeing the
> >> > problem here.
> >>
> >> I believe Michal is bringing up the (important, IMO) point that if
> >> distinct partition types are being described in the same node, then any
> >> use of additional properties *must* be closely coordinated. We can't
> >> have two parsers "foo" and "bar" defining conflicting uses of the same
> >> property in the same node, like this:
> >>
> >>       partitions {
> >>               compatible =3D "foo", "bar";
> >>               property-baz =3D ...; // e.g., reg =3D <...>;
> >>       };
> >>
> >> where if "foo" is not found, we fall back to "bar". But what if "foo"
> >> and "bar" use "property-baz" differently?
> >
> > Ah.. that is an excellent point, and leads me to realise that using
> > compatible in this way is wrong.  The whole point of compatible is
> > that the node is, well, compatible with *all* the things in the list,
> > and therefore the things in the list are compatible with each other.
> >
> > Using it for a list of entirely different things to attempt in order
> > is not correct.
>=20
> Isn't the idea behind a partition table that all partition information is
> stored on the device in a well-known format, so you don't need additional
> properties?

I guess that's the idea, but I wouldn't like to count on it.

And more importantly, it's still abusing the 'compatible' property.  A
node is supposed to be compatible with *everything* in 'compatible',
not just one of the things listed there.

> If the only property needed is the partition table offset, it can be enco=
ded
> in the unit-address, and the "reg" property:
>=20
>         partitions {
>=20
>                 partition-table@xxxx {
>                         reg =3D <0xxxx ...>;
>                         ...
>                 };
>=20
>                 ...
>         };

Urgh.. and that's abusing the unit address.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--v9Ux+11Zm5mwPlX6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWb6yYAAoJEGw4ysog2bOShi4P/RcRwUSyoUc5z4HCUkRbGLXK
iZQQraFXZhrxO/37VA4+Zk0xzkdgyLYOF4v3/tZV1rntW6lA2Ezqf3n3ad7pJqak
0i/VbaFHcW+GdoJbWmZRmrW2kLqAAEdgzo73H1QklXoroCTFY0+FzqdLcRyi6Ukj
6btJbkfzXxKqw4qGQ7glw4wP0TJ6/DurULMkW1uOhQDdGXA93JzK6F936DQxBoLk
dFzIp1z1Q9LoRT0PqmPFFMTGSbRNRPjWDkbZQBnOiIhXY198s9/KOqD3iZpIAR/x
A44UKIY/C+T0tabG+Et0HjoblfR/yCSRl4ANLckbYddhHAlcw0paV1oB3atEmCiK
Mb2hiR5pE/KYPpTek8rgCIVWlrC7PFKFkXsru5+bIlZnUWlqCKgoYIBOPyZojXjG
hcuYLC4jPXC5LKKWSDeGbSbYM2kpI1+XSPr1105mA1frrqKO3b6SD3U4x8GRAxxo
idCZStMOAUIvmOjDEnRvR+tStXErPONph2ctc9UmcdFE6kd0GxW4mJayrpIt7EnU
qoOk92OsONO4Ybh/ZGW7iUs5Ai+/BUsX6er58blI0ZaahYyqCfgUwYBOGx5N67jB
91UYyoWc/T4zjAzfe76yJ/ZVLXFMSd2enSO+W3psIh5iFlnAgTZKl6wSaSnqZIZ6
BWMU/9zqtOwjVKYB4DlS
=Tuwi
-----END PGP SIGNATURE-----

--v9Ux+11Zm5mwPlX6--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
