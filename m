Return-Path: <SRS0=6/gx=VX=renesas.com=yoshihiro.shimoda.uh@kernel.org>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: RE: [PATCH v2 2/2] dt-bindings: usb: renesas_gen3: Rename bindings
 documentation file
Date: Fri, 26 Jul 2019 01:22:48 +0000
Message-ID: 
 <TYAPR01MB4544F226C06730C5611EB025D8C00@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <20190703083514.32385-1-horms+renesas@verge.net.au>
 <20190703083514.32385-3-horms+renesas@verge.net.au>
 <CAMuHMdVgx9N0yeeei5qcg1yz2WEdDf0gQ6GcwUOAz7u09S_D4A@mail.gmail.com>
 <20190711080302.qeotxueyvlr7pvhe@verge.net.au>
 <20190725090946.GA3311@kroah.com>
In-Reply-To: <20190725090946.GA3311@kroah.com>
Content-Language: ja-JP
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Simon Horman <horms@verge.net.au>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Magnus Damm <magnus.damm@gmail.com>, USB list <linux-usb@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS  <devicetree@vger.kernel.org>, =?iso-8859-1?Q?Niklas_S=F6derlund?=" <niklas.soderlund+renesas@ragnatech.se>
List-ID: <devicetree@vger.kernel.org>

Hi Greg,

> From: Greg Kroah-Hartman, Sent: Thursday, July 25, 2019 6:10 PM
>=20
> On Thu, Jul 11, 2019 at 10:03:03AM +0200, Simon Horman wrote:
> > On Wed, Jul 03, 2019 at 02:28:51PM +0200, Geert Uytterhoeven wrote:
> > > Hi Simon,
> > >
> > > On Wed, Jul 3, 2019 at 10:35 AM Simon Horman <horms+renesas@verge.net=
.au> wrote:
> > > > For consistency with the naming of (most) other documentation files=
 for DT
> > > > bindings for Renesas IP blocks rename the Renesas USB3.0 peripheral
> > > > documentation file from renesas-gen3.txt to renesas,usb3-peri.txt
> > > >
> > > > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> > > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > > > Reviewed-by: Niklas S=F6derlund <niklas.soderlund+renesas@ragnatech=
.se>
> > > >
> > > > ---
> > > > v2
> > > > * Accumulate review tags
> > > > * Use renesas,usb3-peri.txt as new filename as suggested by Shimoda=
-san
> > >
> > > Unfortunately the previous version has already made it into usb-next
> > > 23c46801d14cb647 dt-bindings: usb: renesas_gen3: Rename bindings
> > > documentation file
> >
> > Ok, I guess we should go with that version.
>=20
> So can you resend this series based on 5.3-rc1 so I know what to apply?

Since your usb-testing branch already has it which is merged from Felipe's =
usb-next branch,
I don't think Simon has to resend this series.

https://www.spinics.net/lists/linux-usb/msg182103.html

Best regards,
Yoshihiro Shimoda

> thanks,
>=20
> greg k-h
