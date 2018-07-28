Return-Path: <SRS0=l4Wd=KM=renesas.com=Chris.Brandt@kernel.org>
From: Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [PATCH v2 0/3] serial: sh-sci: Add support for RZ/A2
Date: Sat, 28 Jul 2018 15:55:14 +0000
Message-ID: 
 <TY1PR01MB1562F9D26B585AEF757E31518A290@TY1PR01MB1562.jpnprd01.prod.outlook.com>
References: <20180725143850.32985-1-chris.brandt@renesas.com>
 <CAMuHMdV=GDmte8uqi2hoy6Cu190uX6stdPkipmsDjan8L5oZRA@mail.gmail.com>
 <TYXPR01MB1568B3A6928B55E665AA626F8A2B0@TYXPR01MB1568.jpnprd01.prod.outlook.com>
 <CAMuHMdX1piAAJeX+C=xr2ZG6Pe4_W+XH6ugURWny0rcJ3En0ew@mail.gmail.com>
 <20180728145515.GB19385@kroah.com>
In-Reply-To: <20180728145515.GB19385@kroah.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Greg KH <gregkh@linuxfoundation.org>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS  <devicetree@vger.kernel.org>, Linux-Renesas" <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms+renesas@verge.net.au>
List-ID: <devicetree@vger.kernel.org>

On Saturday, July 28, 2018 1, Greg KH wrote:
> > > In your opinion, which one would be better (revert or rebase)?
> >
> > [looking at the incremental differences]
> >
> > I think the easiest for Greg is to rebase, and send 3 patches:
>=20
> Greg does not rebase his public trees.  Nor should anyone else :)
>=20
> I can revert patches if you want me to, just let me know what ones.  Or
> send incremental patches on top of my tree please.  But no reverts are
> going to be happening.

Yesterday I sent a new patch series that will apply on top of the=20
current tty-next and basically reverts what I did and replaces it with a=20
new version that incorporates Geert's suggestions. So no reverts are
needed.

I assume now I'm just waiting to see if Geert has any feedback on the=20
new series.

Chris
