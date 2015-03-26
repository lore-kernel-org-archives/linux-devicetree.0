From: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Subject: Re: [Gta04-owner] [PATCH 3/3] tty/slaves: add a driver to power
 on/off UART attached devices.
Date: Thu, 26 Mar 2015 06:56:39 +0100
Message-ID: <20150326055639.GA20912@amd>
References: <20150318055831.21025.33670.stgit@notabene.brown>
 <C53A3E5D-5AEA-4F0F-88A9-F9BC8CB0D0D6@goldelico.com>
 <20150320195451.146a7915@notabene.brown>
 <14FB51CF-9568-4BF4-B917-2C019D992FDB@goldelico.com>
 <20150321103122.23603014@notabene.brown>
 <C091D3C1-CE79-469A-BEA4-25E03F6E9164@goldelico.com>
 <20150325014543.GA967@earth>
 <6B657A35-68BD-45F6-BD55-A3D6AC1055C8@goldelico.com>
 <20150325205344.GD381@amd>
 <1F3B5E32-1330-457C-AE25-791319293C38@goldelico.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1F3B5E32-1330-457C-AE25-791319293C38-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Dr. H. Nikolaus Schaller" <hns-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>
Cc: Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, NeilBrown <neilb-l3A5Bk7waGM@public.gmane.org>, List for communicating with real GTA04 owners <gta04-owner-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, One Thousand Gnomes <gnomes-qBU/x9rampVanCEyBjwyrvXRex20P6io@public.gmane.org>, Peter Hurley <peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jiri Slaby <jslaby-AlSwsSmVLrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi!

> >>> Main reason is, that I would need to go
> >>> through the UART to =E2=80=9Ccommunicate" with the w2sg0004.
> >>=20
> >> You can always "communicate=E2=80=9D through the UART. Even withou=
t DT. As long as
> >> the connected chip is powered up by any means (could be some fixed=
-regulator
> >> or hard wired).
> >=20
> > But you don't know "how" to communicate through the uart.
>=20
> Maybe we are talking using different assumptions. As long as you have=
 a user space
> gpsd daemon that talks to the gps chip the kernel simply has to trans=
parently (except
> line disciplines) pass the data to the uart.

=46orget userspace, some other operating system (or future linux) may
want to put gps handling into the kernel. (To hide differences between
different GPSes).

> > Because we want the phone to boot knowing "I have a bluetooth" or "=
I
> > have a GPS", as it would if it was connected using USB, and not hav=
ing
> > user figure out what commands he needs to do to enable reasonable
> > hardware support (and getting it wrong, because you need to specify
> > _many_ critical parameters to hciattach).
>=20
> Yes, this is indeed something I also would like to see for the GTA04 =
(and other)
> devices.
>=20
> So the reason is that some kernel driver wants to use the tty/uart to=
 communicate
> directly with the chip. This is very similar to a gpio that some driv=
er wants to use.
>=20
> Thus please consider the
>=20
> / {
> 	bt {
> 		compatible =3D "vendor,product=E2=80=9C;
> 		uart =3D <&uart1>;
> 		enable =3D <&gpio17 34 0>;
> 	};
> };

Would work, too, but I and everyone knows that subnode is better,
easier solution.

> approach.
>=20
> And if you want to hide uart1 from the user-space, that should be a p=
roperty
> of the uart1 node (whereever it is defined).

Sorry? That would be one heck of layering violation.
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses=
/blog.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
