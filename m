From: Scott Wood <oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH V4 1/2] powerpc/fsl: Add PCI node in device tree of
 bsc9132qds
Date: Wed, 27 Jan 2016 08:23:39 -0600
Message-ID: <1453904619.27129.41.camel@buserror.net>
References: <1446693360-1578-1-git-send-email-Zhiqiang.Hou@freescale.com>
	 <HE1PR04MB0906A35F4F48C8DACF5CD16D84E50@HE1PR04MB0906.eurprd04.prod.outlook.com>
	 <HE1PR04MB09060D4FCE88CD7B3F1CBF9084D90@HE1PR04MB0906.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <HE1PR04MB09060D4FCE88CD7B3F1CBF9084D90-6LN7OEpIatWBkn9woE/rDM9NdZoXdze2vxpqHgZTriW3zl9H0oFU5g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zhiqiang Hou <zhiqiang.hou-3arQi8VN3Tc@public.gmane.org>, Zhiqiang Hou <Zhiqiang.Hou-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org" <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, "benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org" <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, "paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org" <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, "mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org" <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Harninder Rai <harninder.rai-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "Lian M.H." <Minghuan.Lian-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Hu Vincent <Mingkai.Hu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Hou Zhiqiang <B48286-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 2016-01-27 at 06:47 +0000, Zhiqiang Hou wrote:
> Hi Herring and Kumar and Ian,
>=20
> Can you help to apply this patch?
>=20
> Thanks,
> Zhiqiang=20

Can you check whether a patch has already been applied before pinging p=
eople
about it?

-Scott

>=20
> > -----Original Message-----
> > From: Zhiqiang Hou [mailto:zhiqiang.hou-3arQi8VN3Tc@public.gmane.org]
> > Sent: 2015=E5=B9=B412=E6=9C=8822=E6=97=A5 17:28
> > To: Zhiqiang Hou <Zhiqiang.Hou-KZfg59tc24xl57MIdRCFDg@public.gmane.org>;=20
> > linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org;
> > Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>; galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org;
> > benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org; paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org; mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org;
> > devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org; pawel.moll-5wv7dgnIgG8@public.gmane.org;
> > mark.rutland-5wv7dgnIgG8@public.gmane.org; ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org; Harninder Rai
> > <harninder.rai-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > Cc: Lian M.H. <Minghuan.Lian-KZfg59tc24xl57MIdRCFDg@public.gmane.org>; Hu Vincent
> > <Mingkai.Hu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>; Hou Zhiqiang <B48286-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > Subject: RE: [PATCH V4 1/2] powerpc/fsl: Add PCI node in device tre=
e of
> > bsc9132qds
> >=20
> > Hi Rob,
> >=20
> > Could you please take this patch into account?
> >=20
> > Thanks,
> > Zhiqiang
> >=20
> > > -----Original Message-----
> > > From: Zhiqiang Hou [mailto:Zhiqiang.Hou-KZfg59tc24xl57MIdRCFDg@public.gmane.org]
> > > Sent: 2015=E5=B9=B411=E6=9C=885=E6=97=A5 11:16
> > > To: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org; Scott Wood;
> > > galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org; benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org; paulus@samba=
=2Eorg;
> > > mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; robh+dt-DgEjT+Ai2yhQFI55V6+gNQ@public.gmane.org=
g;
> > > pawel.moll-5wv7dgnIgG8@public.gmane.org; mark.rutland-5wv7dgnIgG8@public.gmane.org;
> > > ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org; Harninder Rai
> > > Cc: Minghuan Lian; Mingkai Hu; Zhiqiang Hou
> > > Subject: [PATCH V4 1/2] powerpc/fsl: Add PCI node in device tree =
of
> > > bsc9132qds
> > >=20
> > > From: Harninder Rai <harninder.rai-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > >=20
> > > Signed-off-by: Harninder Rai <harninder.rai-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > > Signed-off-by: Minghuan Lian <Minghuan.Lian-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > > Signed-off-by: Hou Zhiqiang <B48286-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > > ---
> > > V4: V3:
> > >  - Remove gerrit stuff.
> > > V2:
> > >  - Remove property clock-frequency.
> > >=20
> > >  arch/powerpc/boot/dts/bsc9132qds.dts          | 15 +++++++++++++=
+
> > >  arch/powerpc/boot/dts/fsl/bsc9132si-post.dtsi | 28
> > > +++++++++++++++++++++++++++
> > > +++++++++++++++++++++++++++ arch/powerpc/boot/dts/fsl/bsc9132si-p=
re.dt
> > > +++++++++++++++++++++++++++ si
> > > >  1 +
> > >  3 files changed, 44 insertions(+)
> > >=20
> > > diff --git a/arch/powerpc/boot/dts/bsc9132qds.dts
> > > b/arch/powerpc/boot/dts/bsc9132qds.dts
> > > index 6cab106..940d719 100644
> > > --- a/arch/powerpc/boot/dts/bsc9132qds.dts
> > > +++ b/arch/powerpc/boot/dts/bsc9132qds.dts
> > > @@ -29,6 +29,21 @@
> > >  soc: soc@ff700000 {
> > >  ranges =3D <0x0 0x0 0xff700000 0x100000>;  };
> > > +
> > > +pci0: pcie@ff70a000 {
> > > +reg =3D <0 0xff70a000 0 0x1000>;
> > > +ranges =3D <0x2000000 0x0 0x90000000 0 0x90000000 0x0
> > > 0x20000000
> > > +  0x1000000 0x0 0x00000000 0 0xc0010000 0x0 0x10000>;
> > > +pcie@0 {
> > > +ranges =3D <0x2000000 0x0 0x90000000
> > > +  0x2000000 0x0 0x90000000
> > > +  0x0 0x20000000
> > > +
> > > +  0x1000000 0x0 0x0
> > > +  0x1000000 0x0 0x0
> > > +  0x0 0x100000>;
> > > +};
> > > +};
> > >  };
> > >=20
> > >  /include/ "bsc9132qds.dtsi"
> > > diff --git a/arch/powerpc/boot/dts/fsl/bsc9132si-post.dtsi
> > > b/arch/powerpc/boot/dts/fsl/bsc9132si-post.dtsi
> > > index c723071..b5f0715 100644
> > > --- a/arch/powerpc/boot/dts/fsl/bsc9132si-post.dtsi
> > > +++ b/arch/powerpc/boot/dts/fsl/bsc9132si-post.dtsi
> > > @@ -40,6 +40,34 @@
> > >  interrupts =3D <16 2 0 0 20 2 0 0>;
> > >  };
> > >=20
> > > +/* controller at 0xa000 */
> > > +&pci0 {
> > > +compatible =3D "fsl,bsc9132-pcie", "fsl,qoriq-pcie-v2.2"; device=
_type =3D
> > > +"pci"; #size-cells =3D <2>; #address-cells =3D <3>; bus-range =3D=
 <0 255>;
> > > +interrupts =3D <16 2 0 0>;
> > > +
> > > +pcie@0 {
> > > +reg =3D <0 0 0 0 0>;
> > > +#interrupt-cells =3D <1>;
> > > +#size-cells =3D <2>;
> > > +#address-cells =3D <3>;
> > > +device_type =3D "pci";
> > > +interrupts =3D <16 2 0 0>;
> > > +interrupt-map-mask =3D <0xf800 0 0 7>;
> > > +
> > > +interrupt-map =3D <
> > > +/* IDSEL 0x0 */
> > > +0000 0x0 0x0 0x1 &mpic 0x0 0x2 0x0 0x0
> > > +0000 0x0 0x0 0x2 &mpic 0x1 0x2 0x0 0x0
> > > +0000 0x0 0x0 0x3 &mpic 0x2 0x2 0x0 0x0
> > > +0000 0x0 0x0 0x4 &mpic 0x3 0x2 0x0 0x0
> > > +>;
> > > +};
> > > +};
> > > +
> > >  &soc {
> > >  #address-cells =3D <1>;
> > >  #size-cells =3D <1>;
> > > diff --git a/arch/powerpc/boot/dts/fsl/bsc9132si-pre.dtsi
> > > b/arch/powerpc/boot/dts/fsl/bsc9132si-pre.dtsi
> > > index 301a9db..90f7949 100644
> > > --- a/arch/powerpc/boot/dts/fsl/bsc9132si-pre.dtsi
> > > +++ b/arch/powerpc/boot/dts/fsl/bsc9132si-pre.dtsi
> > > @@ -45,6 +45,7 @@
> > >  serial0 =3D &serial0;
> > >  ethernet0 =3D &enet0;
> > >  ethernet1 =3D &enet1;
> > > +pci0 =3D &pci0;
> > >  };
> > >=20
> > >  cpus {
> > > --
> > > 2.1.0.27.g96db324
>=20
> _______________________________________________
> Linuxppc-dev mailing list
> Linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/linuxppc-dev
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
