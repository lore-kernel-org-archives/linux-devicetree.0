From: Madalin-Cristian Bucur <madalin.bucur-3arQi8VN3Tc@public.gmane.org>
Subject: RE: [v2,2/3] powerpc/fsl/dts: add QMan and BMan portal nodes on t1024
Date: Wed, 7 Dec 2016 07:12:45 +0000
Message-ID: <AM4PR04MB1604989338D17E495C655320EC850@AM4PR04MB1604.eurprd04.prod.outlook.com>
References: <1481030019-31854-2-git-send-email-madalin.bucur@nxp.com>
 <20161207005904.GA12811@home.buserror.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161207005904.GA12811-vONcSABrMOVpTrP2zolEsF6hYfS7NtTn@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Scott Wood <oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> From: Scott Wood [mailto:oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org]
> Sent: Wednesday, December 07, 2016 2:59 AM
>=20
> On Tue, Dec 06, 2016 at 03:13:38PM +0200, Madalin Bucur wrote:
> > Signed-off-by: Madalin Bucur <madalin.bucur-3arQi8VN3Tc@public.gmane.org>
> > ---
> >  arch/powerpc/boot/dts/fsl/t1024qds.dts | 29
> +++++++++++++++++++++++++++++
> >  arch/powerpc/boot/dts/fsl/t1024rdb.dts | 33
> +++++++++++++++++++++++++++++++++
> >  2 files changed, 62 insertions(+)
>=20
> So, in patch 1/3 you add qman and bman nodes to t1023si-post.dtsi and
> call it "add QMan and BMan portal nodes on t1023rdb" as if it were
> board-specific (the only board-specific part is the reserved-memory
> nodes, not the portals).
>=20
> Then, in this patch you only touch board-specific files, and label it
> "add QMan and BMan portal nodes on t1024"...

That needs fixing...

> > diff --git a/arch/powerpc/boot/dts/fsl/t1024rdb.dts
> b/arch/powerpc/boot/dts/fsl/t1024rdb.dts
> > index 302cdd2..73a6453 100644
> > --- a/arch/powerpc/boot/dts/fsl/t1024rdb.dts
> > +++ b/arch/powerpc/boot/dts/fsl/t1024rdb.dts
> > @@ -41,6 +41,31 @@
> >  	#size-cells =3D <2>;
> >  	interrupt-parent =3D <&mpic>;
> >
> > +	aliases {
> > +		sg_2500_aqr105_phy4 =3D &sg_2500_aqr105_phy4;
> > +	};
>=20
> What does this have to do with the qman and bman portal nodes?  Why is
> this alias needed?
>=20
> -Scott

It's needed by u-boot, should be a separate patch.
I'll resend.

Madalin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
