From: Ramesh Shanmugasundaram <ramesh.shanmugasundaram-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Subject: RE: [PATCH] arm64: dts: r8a7796: Add DRIF support
Date: Fri, 30 Jun 2017 10:28:09 +0000
Message-ID: <KL1PR0601MB2038A605A7A2825225EB49DBC3D30@KL1PR0601MB2038.apcprd06.prod.outlook.com>
References: <20170627125438.44491-1-ramesh.shanmugasundaram@bp.renesas.com>
 <20170630101720.GH26710@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170630101720.GH26710-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Cc: "magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "catalin.marinas-5wv7dgnIgG8@public.gmane.org" <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, "will.deacon-5wv7dgnIgG8@public.gmane.org" <will.deacon-5wv7dgnIgG8@public.gmane.org>, "linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Chris Paterson <Chris.Paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, "geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org" <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Simon,

> Subject: Re: [PATCH] arm64: dts: r8a7796: Add DRIF support
>=20
> On Tue, Jun 27, 2017 at 01:54:38PM +0100, Ramesh Shanmugasundaram wrote:
> > Adds the DRIF controller nodes for r8a7796.
> >
> > Signed-off-by: Ramesh Shanmugasundaram
> > <ramesh.shanmugasundaram-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
> > ---
> > Hi Simon,
> >
> >    This patch is based on renesas-devel-20170626-v4.12-rc7 tag.
> >    It is verified on M3 ES1.0. I also verified there are no regression
> issues
> >    with this addition.
> >
> >    The driver[1] is pushed into the media_tree. The bindings[2] are
> ACK'ed
> >    by Geert & Rob and in the media_tree queue.
> >
> >    [1]
> https://git.linuxtv.org/media_tree.git/commit/?id=3D7625ee981af166ddb569e=
2e6
> c0006e2af471326f
> >    [2]
> > https://www.mail-archive.com/linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org/msg1560
> > 2.html
> >
> > Thanks,
> > Ramesh.
> >
> >  arch/arm64/boot/dts/renesas/r8a7796.dtsi | 120
> > +++++++++++++++++++++++++++++++
> >  1 file changed, 120 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> > b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> > index 1f6710912045..df04d132a127 100644
> > --- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> > @@ -639,6 +639,126 @@
> >  			};
> >  		};
> >
> > +		drif00: rif@e6f40000 {
> > +			compatible =3D "renesas,r8a7796-drif",
> > +				     "renesas,rcar-gen3-drif";
> > +			reg =3D <0 0xe6f40000 0 0x64>;
> > +			interrupts =3D <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
> > +			clocks =3D <&cpg CPG_MOD 515>;
> > +			clock-names =3D "fck";
> > +			dmas =3D <&dmac1 0x20>, <&dmac2 0x20>;
>=20
> The dmas property seems a little strange. I would have expected to allow
> ether dmac1 or dmac2 to be used for both tx and rx:
>=20
> 			dmas =3D <&dmac1 0x20>, <&dmac1 0x20>,
> 			       <&dmac2 0x20>, <&dmac2 0x20>;
>=20

It is an rx-only interface that can use either dmac1 or 2.

>=20
> > +			dma-names =3D "rx", "rx";
> > +			power-domains =3D <&sysc R8A7796_PD_ALWAYS_ON>;
> > +			resets =3D <&cpg 515>;
> > +			renesas,bonding =3D <&drif01>;
> > +			status =3D "disabled";
> > +		};
>=20

Thanks,
Ramesh
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
