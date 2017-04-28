From: Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [PATCH] ARM: dts: r7s72100: add usb clocks to device tree
Date: Fri, 28 Apr 2017 12:47:22 +0000
Message-ID: <SG2PR06MB1165D398BD7100FAC5AAEDC68A130@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <20170427191045.21199-1-chris.brandt@renesas.com>
 <CAMuHMdXEtefpaUJbbJ7LYjYR2oHaE-epy=eZnAyE-+=GWsy9xg@mail.gmail.com>
 <20170428080400.GI10196@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20170428080400.GI10196@verge.net.au>
Content-Language: en-US
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Friday, April 28, 2017, Simon Horman wrote:
> On Fri, Apr 28, 2017 at 09:34:54AM +0200, Geert Uytterhoeven wrote:
> > On Thu, Apr 27, 2017 at 9:10 PM, Chris Brandt <chris.brandt@renesas.com=
>
> wrote:
> > > This adds the USB0 and USB1 clocks to the device tree.
> > >
> > > Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> >
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > Simon: see Section 29.3.2 (BUSWAIT) for the reference to the P1 clock.
>=20
> Thanks, I see that now.

I was going to say that I simply look at sections:
  6.10.6 Internal Clock Signals (1)
  6.10.7 Internal Clock Signals (2)

Because it lists all the IP blocks and their corresponding clock sources in=
 one place.


Chris
