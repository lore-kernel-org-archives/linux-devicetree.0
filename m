From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: KConfig and DTS files
Date: Thu, 8 May 2014 16:57:27 +1000
Message-ID: <20140508065727.GA13436@voom.fritz.box>
References: <536A697D.3020002@boundarydevices.com>
 <CAOesGMiHRQV+XngH4ABSeT8KDeP=iKn1ogvTA0j1BdyBwAaWSA@mail.gmail.com>
 <536A71AF.1010907@boundarydevices.com>
 <CAOesGMhMeLkzEeVKHM2G9Vqth6qypURN6mxbNdySVvKhQBCs5A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3MwIy2ne0vdjdPXF"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAOesGMhMeLkzEeVKHM2G9Vqth6qypURN6mxbNdySVvKhQBCs5A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Eric Nelson <eric.nelson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--3MwIy2ne0vdjdPXF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 07, 2014 at 10:55:27AM -0700, Olof Johansson wrote:
> On Wed, May 7, 2014 at 10:47 AM, Eric Nelson
> <eric.nelson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org> wrote:
> > Hi Olof,
> >
> >
> > On 05/07/2014 10:24 AM, Olof Johansson wrote:
> >>
> >> Hi,
> >>
> >> On Wed, May 7, 2014 at 10:12 AM, Eric Nelson
> >> <eric.nelson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org> wrote:
> >>>
> >>> Hi all,
> >>>
> >>> I suspect that this has been discussed previously, but I'm a
> >>> N00b to DT and Google hasn't helped identify a discussion
> >>> on the list.
> >>>
> >>> While getting my feet wet with DTS, I was quite surprised to
> >>> see that there's no support for making parts of DTS files
> >>> conditional on the kernel configuration.
> >>>
> >>> We often cost-optimize BOMs for our standard boards and omit
> >>> bits and pieces not needed for a particular build, and
> >>> it would be nice to surround optional components with
> >>> conditionals:
> >>>
> >>>      #ifdef CONFIG_BLAH
> >>>      #endif
> >>>
> >>> Please advise,
> >>
> >>
> >> The DTS is independent on what drivers the kernel is actually
> >> enabling. It should focus on what is actually there on hardware, and
> >> not what is enabled in software.
> >>
> >> I think I know where you're coming from on this -- on some board-file
> >> setups people used to not register the platform_device if the driver
> >> wasn't configured. That was also not really a good way to do it, but
> >> it made a bit more sense there, since you'd save the few bytes used by
> >> the platform_device/platform_data structures.
> >>
> >
> > It's not a question of space, but functionality.
> >
> > We had this come up recently when optimizing a BOM for use
> > without Wi-Fi. If we omit the device and associated buffers,
> > the SDIO lines are left floating, so the detection code will
> > complain.
> >
> > It seems reasonable to tell the kernel to skip this if the
> > WiFi driver isn't configured into the kernel (i.e. there's
> > no point in enumerating), so I was hoping to surround this
> > USDHC2 block with #ifdefs:
> >
> >
> > https://github.com/boundarydevices/linux-imx6/blob/boundary-imx_3.10.17=
_1.0.0_ga/arch/arm/boot/dts/imx6qdl-nitrogen6x.dtsi#L640
> >
> > The alternative aren't very nice:
> >         populate extra parts to drive these signals, or
> >         copy the DTB and strip out the unused parts
> >
> > The first is wasteful (and environmentally un-friendly), and
> > the second doesn't scale very well and pollutes the Git tree.
> >
> > Prior to DT, we surrounded the device startup calls with #ifdefs
> > like this:
> >
> > https://github.com/boundarydevices/linux-imx6/blob/boundary-jb4.3_1.0.0=
-ga/arch/arm/mach-mx6/board-mx6_nitrogen6x.c#L1409
>=20
> It is really annoying that you can't include a DTS in another DTS
> (only DTSIs). This is a major shortcoming of the tools, as far as I am
> concerned.

Um.. so I'm trying to work out exactly what you're getting at here.
dtc includes, just like CPP includes are dumb textual inclusion,
there's no theoretical difference between a "dts" and a "dtsi".  There
may be practical differences, though - like the presence of the
/dts-v1/ tag and possibly paths.

> So, the best way we've found to do this is to create a shared dtsi
> that has practically everything in it, then a skeleton DTS for the
> "full" product, and a separate DTS for the cost-reduced version. The
> cost-reduced DTS would insert a status =3D "disabled"; for the sdio
> controller. That's a solution that scales very poorly as well, though.
>=20
> Best would be if a DTS could just include another DTS for minor
> updates, such as disabling the sdio controller in this case. I'm sure
> there were some language-puritan reasons for not allowing that though.
> Someone care to fill in the history?

So, I'm not sure quite what you're envisaging and how it differs from
what we have now.  Using the "overlay" functionality, you can right
now do

/include/ "thatotherdts.dts"

&{/somewhere/in/that/other/tree} {
	adjustable-property =3D "new value";
};

The only oddity here is that if thatotherdts.dts includes the /dts-v1/
tag, you can't have it in the outer file as well.

If it helps we could make that tag optionally appear any number of
times.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--3MwIy2ne0vdjdPXF
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJTayrXAAoJEGw4ysog2bOSpUcQAIHE8oEB4MCoSZlh4FXpVnA0
d8uOAVEvVZzCeoQ5IETqx1eEDwWV4DhZtQD45SXURZBFusNosQXKexgp/vK/f1kZ
9u20vbXYj5HkaCJ+pUNDekJ5e+rD2qZQe7WTGlpJpbTaekSMNBy3dUlKfr9SSruK
LMqwUTkWggp3xU1Y4k5q2b03mRcOlagRuW33oQHPwuEkdiaHy8slOoCZ2iuSlz+D
QhlXtHXw7NBh80TMJXFGiYiTio4oOk5z6uYuLB++7Tv1vBSYzBdtkeFz1iSTDN5u
tpaStjHtefXCY1SiJk9lzoZ3OeFq0y+eur8nGyrIHkO7LZs+aTfTGrGUnRQw2GTi
5DaDfMQhxQD3CnwkRi2jLk3iNAX/NtIPdHGUqWzn3oQFoO61EgWg+aHQyzO5Wg2B
2xGoo16JAZLZjMMk+Sennbu9WrU4Zqv7Mt3bJeCadjPZjh/aZ4vdvaGtFqycZW37
k9mNsYkii8tLlIO6kyB5dQGZ9UhfQDimkPA1c2NxQiqoSqRGCXF5aSqtWmE0LxCJ
1fAOEjBZshImG99f7yzLpXqMzxPgqHgCuBdURTwdiEgckL2nwZ1VVxWVLQaMsUQb
d4xY1MWOwYet52vahYNHhMZvqvLdU6kNyoEeAT687ZGyIKfHWCgziom1pz4uHRma
Ebk5sUE8QhY/KHWoITOB
=9Mmf
-----END PGP SIGNATURE-----

--3MwIy2ne0vdjdPXF--
--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
