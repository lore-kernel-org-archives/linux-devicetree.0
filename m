From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v4] powerpc/mpc85xx: Update the clock device tree nodes
Date: Mon, 16 Sep 2013 15:39:30 -0500
Message-ID: <1379363970.2536.151.camel@snotra.buserror.net>
References: <1378882632-9053-1-git-send-email-Yuantian.Tang@freescale.com>
	 <1378948229.12204.486.camel@snotra.buserror.net>
	 <D07C73A334FF604B95B3CBD2A545D07B150748AA@039-SN2MPN1-013.039d.mgd.msft.net>
	 <1378997052.2536.5.camel@snotra.buserror.net>
	 <D07C73A334FF604B95B3CBD2A545D07B15089208@039-SN2MPN1-011.039d.mgd.msft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <D07C73A334FF604B95B3CBD2A545D07B15089208-RL0Hj/+nBVCMXPU/2EZmt64g8xLGJsHaLnY5E4hWTkheoWH0uzbU5w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tang Yuantian-B29983 <B29983-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Wood Scott-B07421 <B07421-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org" <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Li Yang-Leo-R58472 <r58472-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 2013-09-12 at 21:50 -0500, Tang Yuantian-B29983 wrote:
> > -----Original Message-----
> > From: Wood Scott-B07421
> > Sent: 2013=E5=B9=B49=E6=9C=8812=E6=97=A5 =E6=98=9F=E6=9C=9F=E5=9B=9B=
 22:44
> > To: Tang Yuantian-B29983
> > Cc: Wood Scott-B07421; galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org; linuxppc-
> > dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Li Yang-Leo-R5847=
2
> > Subject: Re: [PATCH v4] powerpc/mpc85xx: Update the clock device tr=
ee
> > nodes
> >=20
> > On Wed, 2013-09-11 at 20:31 -0500, Tang Yuantian-B29983 wrote:
> > > > -----Original Message-----
> > > > From: Wood Scott-B07421
> > > > Sent: 2013=E5=B9=B49=E6=9C=8812=E6=97=A5 =E6=98=9F=E6=9C=9F=E5=9B=
=9B 9:10
> > > > To: Tang Yuantian-B29983
> > > > Cc: galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org; linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org;
> > > > devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Li Yang-Leo-R58472
> > > > Subject: Re: [PATCH v4] powerpc/mpc85xx: Update the clock devic=
e
> > > > tree nodes
> > > >
> > > > This description of "reg" is overly specific (assumes how the p=
arent
> > > > node's ranges are set up), incomplete (there's a size as well a=
s the
> > > > offset), and does not apply to the clockgen node itself (you
> > > > probably shouldn't lump them together like this).
> > > >
> > > Do you mean I should explain the REG of clockgen and its child no=
de
> > respectively?
> > >
> > > > > +- clocks : shall be the input parent clock phandle for the c=
lock.
> > > >
> > > > Not required on the clockgen node
> > > >
> > > Required by child node of clockgen.
> >=20
> > My point is that you're lumping several different types of nodes to=
gether
> > with one binding, when some parts of the binding are not applicable=
 to
> > the clockgen node.
> >=20
> Not several, just two types of nodes.
> One is clockgen node, the other is PLL and mux nodes.

clockgen + PLL + mux =3D 3 =3D several :-)

> The reason they lumped together is that the clockgen node is not only=
 IP block
> Node but also a clock provider node

I don't understand why that merits lumping them together.

Just describe them separately.

> At first, I want to add a extra fixed-clock node and move the clock-f=
requency of clockgen=20
> Node to it, but it is against the backward compatibility

Right.

> which I think it is not a big deal, Because nobody hasn't used it yet=
=2E

The point is it will require updating U-Boot to use it, versus existing
U-Boots which already patch up the clock-frequency in the clockgen node=
=2E
And there's nothing semantically wrong with the way it currently is.

> If I add a extra node with the clock-frequency property and don't mov=
e the
> clock-frequency property of clockgen, that would be redundant because=
 both clockgen node
> and the extra node have the same clock-frequency node.
> So, I choose what I did now.

I'm not complaining about how you structured the nodes, just how you
documented them.

-Scott



--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
