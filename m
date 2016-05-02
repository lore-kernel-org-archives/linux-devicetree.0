From: maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: Re: [PATCH v2 2/5] ARM: dts: vfxxx: Add device tree node for OCOTP
Date: Mon, 2 May 2016 13:42:12 +0530
Message-ID: <20160502081211.GA7847@Sanchayan-Arch.localdomain>
References: <cover.1462171989.git.maitysanchayan@gmail.com>
 <b5c1ff5a805eae3e53f07f8d0161f0af51586c00.1462171990.git.maitysanchayan@gmail.com>
 <4759698.elnRBldlxl@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4759698.elnRBldlxl@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stefan-XLVq0VzYD2Y@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello Arnd,

On 16-05-02 09:31:12, Arnd Bergmann wrote:
> On Monday 02 May 2016 12:35:01 Sanchayan Maity wrote:
> > +                       ocotp@400a5000 {
> > +                               compatible =3D "fsl,vf610-ocotp";
> > +                               #address-cells =3D <1>;
> > +                               #size-cells =3D <1>;
> > +                               reg =3D <0x400a5000 0xCF0>;
> > +                               clocks =3D <&clks VF610_CLK_OCOTP>;
> > +
> > +                               ocotp_cfg0: cfg0@410 {
> > +                                       reg =3D <0x410 0x4>;
> > +                               };
> > +
> > +                               ocotp_cfg1: cfg1@420 {
> > +                                       reg =3D <0x420 0x4>;
> > +                               };
> > +                       };
>=20
> How do the registers of the child nodes relate to the registers of th=
e
> parent? If there are in the same address space, it might be good to
> add a "ranges" property to describe it.

cfg0 and cfg1 are in the same address space viz. 0x400a5410 and 0x400a5=
420
respectively. These nodes are primarily for use by the NVMEM consumer A=
PI in
the SoC bus driver to retrieve the values from these registers leveragi=
ng
the NVMEM vf610 ocotp driver.

Based on the NVMEM bindings here
http://lxr.free-electrons.com/source/Documentation/devicetree/bindings/=
nvmem/nvmem.txt#L33

Thanks.

Regards,
Sanchayan.

>=20
> 	Arnd

> Date: Mon, 02 May 2016 12:02:21 +1000
> From: Gavin Shan <gwshan-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
> To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>,
>  aik-sLpHqDYs0B2HXe+LvDLADg@public.gmane.org, Gavin Shan <gwshan-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Grant Likely
>  <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org"
>  <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>,
>  linuxppc-dev <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, dja-Yfaxwxk/+vWsTnJN9+BGXg@public.gmane.org
> Subject: Re: [PATCH v8 40/45] drivers/of: Split unflatten_dt_node()
>=20
> On Wed, Feb 17, 2016 at 08:30:42AM -0600, Rob Herring wrote:
> >On Tue, Feb 16, 2016 at 9:44 PM, Gavin Shan <gwshan-23VcF4HTsmIX0ybBhKVfKQ@public.gmane.org=
om> wrote:
> >> The function unflatten_dt_node() is called recursively to unflatte=
n
> >> device nodes and properties in the FDT blob. It looks complicated
> >> and hard to be understood.
> >>
> >> This splits the function into 3 functions: populate_properties(),
> >> populate_node() and unflatten_dt_node(). populate_properties(),
> >> which is called by populate_node(), creates properties for the
> >> indicated device node. The later one creates the device nodes
> >> from FDT blob. populate_node() gets the offset in FDT blob for
> >> next device nodes and then calls populate_node(). No logical
> >> changes introduced.
> >>
> >> Signed-off-by: Gavin Shan <gwshan-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
> >> ---
> >>  drivers/of/fdt.c | 249 ++++++++++++++++++++++++++++++++----------=
-------------
> >>  1 file changed, 147 insertions(+), 102 deletions(-)
> >
> >One nit, otherwise:
> >
> >Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> >
> >[...]
> >
> >> +               /* And we process the "ibm,phandle" property
> >> +                * used in pSeries dynamic device tree
> >> +                * stuff
> >> +                */
> >> +               if (!strcmp(pname, "ibm,phandle"))
> >> +                       np->phandle =3D be32_to_cpup(val);
> >> +
> >> +               pp->name   =3D (char *)pname;
> >> +               pp->length =3D sz;
> >> +               pp->value  =3D (__be32 *)val;
> >
> >This cast should not be needed.
> >
>=20
> It's needed. Otherwise, we will have warning. So I will keep it. I ju=
st
> went through this one for next revision and sorry for late response.
>=20
> drivers/of/fdt.c:225:14: warning: assignment discards =E2=80=98const=E2=
=80=99 qualifier from pointer target type
>    pp->value  =3D val;
>               ^
>=20
> Thanks,
> Gavin
>=20
> >> +               *pprev     =3D pp;
> >> +               pprev      =3D &pp->next;
> >> +       }
> >
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
