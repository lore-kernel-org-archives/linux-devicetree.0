From: Niklas =?iso-8859-1?Q?S=F6derlund?=
	<niklas.soderlund@ragnatech.se>
Subject: Re: [PATCH 00/30] ARM: dts: r8a779[0-4]: Reference both DMA
 controllers
Date: Fri, 11 Mar 2016 01:23:26 +0100
Message-ID: <20160311002326.GC1111@bigcity.dyn.berto.se>
References: <1457609782-24108-1-git-send-email-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdXF4FMLg=Y_cZ2chjzGWAV90N=vLsCkPKGmmYx5mFY64Q@mail.gmail.com>
 <20160310134325.GA1111@bigcity.dyn.berto.se>
 <20160310233855.GD7423@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160310233855.GD7423@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Magnus Damm <magnus.damm@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-renesas-soc@vger.kernel.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 2016-03-11 08:38:56 +0900, Simon Horman wrote:
> On Thu, Mar 10, 2016 at 02:43:25PM +0100, Niklas S=F6derlund wrote:
> > Hi Geert,
> >=20
> > On 2016-03-10 13:20:56 +0100, Geert Uytterhoeven wrote:
> > > Hi Niklas,
> > >=20
> > > On Thu, Mar 10, 2016 at 12:35 PM, Niklas S=F6derlund
> > > <niklas.soderlund+renesas@ragnatech.se> wrote:
> > > > R-Car Gen2 have two DMA controllers, which are equivalent. Howe=
ver DMA
> > > > slaves were tied only to a single DMA controller in .dtsi. This=
 series
> > > > add references to to both DMA controllers for all nodes that pr=
eviously
> > > > only referenced one of them. It also adds dma references to the=
 SDHI
> > > > nodes for r8a7794 which according to the datasheet should work =
but I
> > > > have not access to HW to verify.
> > > >
> > > > Tested on Koelsch (r8a7791) by altering the compatible value of=
 either
> > > > dmac0 or dmac1 and verifying that the DMA slaves pick the DMA c=
ontroller
> > > > that is instantiated.
> > >=20
> > > Thanks for your series!
> > >=20
> > > If you fix the subject of patch 30:
> > > Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >=20
> > Thanks for your review and that you found my error in the subject.
> >=20
> > >=20
> > > I guess this is against v4.5-rc7? It doesn't apply against
> > > renesas-devel-20160308-v4.5-rc7.
> > > Unfortunately you'll have to rebase against Simon's tree, and add=
 scif2
> > > on r8a7790, and i2c[6-8] on r8a7793.
> >=20
> > I will rebase and update the relevant patches to include the additi=
ons=20
> > to r8a7790 and r8a7793.
>=20
> If its not too much bother could you provide a git branch as well as
> patches posted to the mailing list.  For larger series that is helpfu=
l to me.

No problem I will include a link when i send v2.

--=20
Regards,
Niklas S=F6derlund
