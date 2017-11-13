From: "M.h. Lian" <minghuan.lian-3arQi8VN3Tc@public.gmane.org>
Subject: RE: [PATCHv4 1/3] ARMv8: dts: ls1046a: add the property of IB and OB
Date: Mon, 13 Nov 2017 02:35:48 +0000
Message-ID: <VI1PR04MB161516288A0FF2F507DAA9BEE82B0@VI1PR04MB1615.eurprd04.prod.outlook.com>
References: <20171110034847.17891-1-xiaowei.bao@nxp.com>
 <20171110034847.17891-2-xiaowei.bao@nxp.com>
 <20b8f1d2-f817-469f-afbf-66f25d6f8c46@ti.com>
 <AM4PR0401MB16999BD34AFBB1362BD32EBD8F540@AM4PR0401MB1699.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AM4PR0401MB16999BD34AFBB1362BD32EBD8F540-4rsfagO7TJzty7MPzPsMPo3W/0Ik+aLCnBOFsp37pqbUKgpGm//BTAC/G2K4zDHf@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Leo Li <leoyang.li-3arQi8VN3Tc@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Xiaowei Bao <xiaowei.bao-3arQi8VN3Tc@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "catalin.marinas-5wv7dgnIgG8@public.gmane.org" <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, "will.deacon-5wv7dgnIgG8@public.gmane.org" <will.deacon-5wv7dgnIgG8@public.gmane.org>, "bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org" <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, "shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Madalin-cristian Bucur <madalin.bucur-3arQi8VN3Tc@public.gmane.org>, Sumit Garg <sumit.garg-3arQi8VN3Tc@public.gmane.org>, "Y.b. Lu" <yangbo.lu-3arQi8VN3Tc@public.gmane.org>, Andy Tang <andy.tang-3arQi8VN3Tc@public.gmane.org>, "jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "pbrobinson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <pbrobinson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "songxiaowei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org" <songxiaowei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWOunwaRDDq4rA@public.gmane.org
List-Id: devicetree@vger.kernel.org



> -----Original Message-----
> From: Leo Li
> Sent: Saturday, November 11, 2017 5:21 AM
> To: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>; Xiaowei Bao
> <xiaowei.bao-3arQi8VN3Tc@public.gmane.org>; robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org; mark.rutland-5wv7dgnIgG8@public.gmane.org;
> catalin.marinas-5wv7dgnIgG8@public.gmane.org; will.deacon-5wv7dgnIgG8@public.gmane.org; bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org;
> shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org; Madalin-cristian Bucur <madalin.bucur-3arQi8VN3Tc@public.gmane.org>;
> Sumit Garg <sumit.garg-3arQi8VN3Tc@public.gmane.org>; Y.b. Lu <yangbo.lu-3arQi8VN3Tc@public.gmane.org>; Andy Tang
> <andy.tang-3arQi8VN3Tc@public.gmane.org>; jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org; pbrobinson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org;
> songxiaowei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-arm-
> kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org; linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-
> pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org; Z.q. Hou
> <zhiqiang.hou-3arQi8VN3Tc@public.gmane.org>; Mingkai Hu <mingkai.hu-3arQi8VN3Tc@public.gmane.org>; M.h. Lian
> <minghuan.lian-3arQi8VN3Tc@public.gmane.org>
> Subject: RE: [PATCHv4 1/3] ARMv8: dts: ls1046a: add the property of IB an=
d OB
>=20
>=20
>=20
> > -----Original Message-----
> > From: Kishon Vijay Abraham I [mailto:kishon-l0cyMroinI0@public.gmane.org]
> > Sent: Friday, November 10, 2017 12:22 AM
> > To: Xiaowei Bao <xiaowei.bao-3arQi8VN3Tc@public.gmane.org>; robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org;
> > mark.rutland-5wv7dgnIgG8@public.gmane.org; catalin.marinas-5wv7dgnIgG8@public.gmane.org; will.deacon-5wv7dgnIgG8@public.gmane.org;
> > bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org; shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org; Madalin-cristian Bucur
> > <madalin.bucur-3arQi8VN3Tc@public.gmane.org>; Sumit Garg <sumit.garg-3arQi8VN3Tc@public.gmane.org>; Y.b. Lu
> > <yangbo.lu-3arQi8VN3Tc@public.gmane.org>; hongtao.jia-3arQi8VN3Tc@public.gmane.org; Andy Tang
> > <andy.tang-3arQi8VN3Tc@public.gmane.org>; Leo Li <leoyang.li-3arQi8VN3Tc@public.gmane.org>;
> > jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org; pbrobinson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org; songxiaowei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org;
> > devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org;
> > linux- kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linuxppc-
> > dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org; Z.q. Hou <zhiqiang.hou-3arQi8VN3Tc@public.gmane.org>; Mingkai Hu
> > <mingkai.hu-3arQi8VN3Tc@public.gmane.org>; M.h. Lian <minghuan.lian-3arQi8VN3Tc@public.gmane.org>
> > Subject: Re: [PATCHv4 1/3] ARMv8: dts: ls1046a: add the property of IB
> > and OB
> >
> > Hi Bao,
> >
> > On Friday 10 November 2017 09:18 AM, Bao Xiaowei wrote:
> > > Add the property of inbound and outbound windows number for ep driver=
.
> > >
> > > Signed-off-by: Bao Xiaowei <xiaowei.bao-3arQi8VN3Tc@public.gmane.org>
> > > Acked-by: Minghuan Lian <minghuan.Lian-3arQi8VN3Tc@public.gmane.org>
> > > ---
> > >  v2:
> > >  - no change
> > >  v3:
> > >  - modify the commit message
> > >  v4:
> > >  - no change
> > >
> > >  arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi | 6 ++++++
> > >  1 file changed, 6 insertions(+)
> >
> > $subject should start with something like
> > arm64: dts: ls1046a: **
> > >
> > > diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
> > > b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
> > > index 06b5e12d04d8..f8332669663c 100644
> > > --- a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
> > > +++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
> > > @@ -674,6 +674,8 @@
> > >  			device_type =3D "pci";
> > >  			dma-coherent;
> > >  			num-lanes =3D <4>;
> > > +			num-ib-windows =3D <6>;
> > > +			num-ob-windows =3D <6>;
> >
> > EP specific properties shouldn't be added in RC dt node. Ideally you
> > should have a separate dt node for RC and EP.
>=20
> It is a single PCIe controller which can be configured to either RC mode =
or EP
> mode.  Wouldn't it conflict with the device tree principles to have two d=
evice
> tree nodes for the same PCIe controller?  And obviously the two modes can=
not
> be used at the same time so we cannot have two drivers both probe on the
> same hardware.
>=20
[Minghuan Lian]  There is only one PCIe dts node in the dts file. PCIe dts =
node describes the PCIe controller's hardware properties and does not have =
work mode.  The new properties  "num-ib-windows " and "num-ob-windows" are =
used to describe the inbound/outbound window number included in the PCIe ha=
rdware. These windows are used in both RC and EP mode.  We can change work =
mode when resetting via RCW(reset configuration word).


> Regards,
> Leo
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
