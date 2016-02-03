From: Horng-Shyang Liao <hs.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: FW: [RFC 3/3] CMDQ: Mediatek CMDQ driver
Date: Wed, 3 Feb 2016 14:02:13 +0800
Message-ID: <1454479333.11967.12.camel@mtksdaap41>
References: <8A0FDEEF9DBBD140A3857422D81DA20F867B19FD@mtkmbs01n1>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <8A0FDEEF9DBBD140A3857422D81DA20F867B19FD@mtkmbs01n1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "open list:OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, srv_heupstream <srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Nicolas Boichat <drinkcat-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, CK HU <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, cawa cheng <cawa.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Bibby Hsieh <bibby.hsieh-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, YT Shen <yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Daoyuan Huang <daoyuan.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Damon Chu <damon.chu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Josh-YC Liu <josh-yc.liu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Glory Hung <glory.hung-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Yong Wu <yong.wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob
List-Id: devicetree@vger.kernel.org

On Wed, 2016-02-03 at 09:40 +0800, Cawa Cheng (=E9=84=AD=E6=9B=84=E7=A6=
=A7) wrote:
>=20
> -----Original Message-----
> From: djkurtz-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org [mailto:djkurtz-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org] On Behalf Of Dan=
iel Kurtz
> Sent: Wednesday, February 03, 2016 12:22 AM
> To: Hs Liao (=E5=BB=96=E5=AE=8F=E7=A5=A5)
> Cc: Rob Herring; Matthias Brugger; Sascha Hauer; open list:OPEN FIRMW=
ARE AND...; linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-arm-kernel-IAPFreCvJWPdpHbCvnp+Ag@public.gmane.org=
ead.org; moderated list:ARM/Mediatek SoC support; srv_heupstream; Sasch=
a Hauer; Philipp Zabel; Nicolas Boichat; CK Hu (=E8=83=A1=E4=BF=8A=E5=85=
=89); Cawa Cheng (=E9=84=AD=E6=9B=84=E7=A6=A7); Bibby Hsieh (=E8=AC=9D=E6=
=BF=9F=E9=81=A0); YT Shen (=E6=B2=88=E5=B2=B3=E9=9C=86); Daoyuan Huang =
(=E9=BB=83=E9=81=93=E5=8E=9F); Damon Chu (=E6=9C=B1=E5=B3=BB=E8=B3=A2);=
 Josh-YC Liu (=E5=8A=89=E8=82=B2=E8=AA=A0); Glory Hung (=E6=B4=AA=E6=99=
=BA=E7=91=8B); Yong Wu (=E5=90=B4=E5=8B=87)
> Subject: Re: [RFC 3/3] CMDQ: Mediatek CMDQ driver
>=20
> On Tue, Feb 2, 2016 at 2:48 PM, Horng-Shyang Liao <hs.liao@mediatek.c=
om> wrote:
> > On Mon, 2016-02-01 at 18:22 +0800, Daniel Kurtz wrote:
> >> On Mon, Feb 1, 2016 at 2:20 PM, Horng-Shyang Liao <hs.liao@mediate=
k.com> wrote:
> >> > On Mon, 2016-02-01 at 12:15 +0800, Daniel Kurtz wrote:
> >> >> On Mon, Feb 1, 2016 at 10:04 AM, Horng-Shyang Liao <hs.liao@med=
iatek.com> wrote:
> >> >> >
> >> >> > On Fri, 2016-01-29 at 21:15 +0800, Daniel Kurtz wrote:
> >> >> > > On Fri, Jan 29, 2016 at 8:24 PM, Horng-Shyang Liao <hs.liao=
@mediatek.com> wrote:
> >> >> > > > On Fri, 2016-01-29 at 16:42 +0800, Daniel Kurtz wrote:
> >> >> > > >> On Fri, Jan 29, 2016 at 3:39 PM, Horng-Shyang Liao <hs.l=
iao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
> >> >> > > >> > Hi Dan,
> >> >> > > >> >
> >> >> > > >> > Many thanks for your comments and time.
> >> >> > > >> > I reply my plan inline.
> >> >> > > >> >
> >> >> > > >> >
> >> >> > > >> > On Thu, 2016-01-28 at 12:49 +0800, Daniel Kurtz wrote:
> >> >> > > >> >> Hi HS,
> >> >> > > >> >>
> >> >> > > >> >> Sorry for the delay.  It is hard to find time to revi=
ew=20
> >> >> > > >> >> a >3700 line driver :-o in detail....
> >> >> > > >> >>
> >> >> > > >> >> Some review comments inline, although I still do not=20
> >> >> > > >> >> completely understand how all that this driver does a=
nd how it works.
> >> >> > > >> >> I'll try to find time to go through this driver in=20
> >> >> > > >> >> detail again next time you post it for review.
> >> >> > > >> >>
> >> >> > > >> >> On Tue, Jan 19, 2016 at 9:14 PM,  <hs.liao@mediatek.c=
om> wrote:
> >> >> > > >> >> > From: HS Liao <hs.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> >> >> > > >> >> >
> >> >> > > >> >> > This patch is first version of Mediatek Command=20
> >> >> > > >> >> > Queue(CMDQ) driver. The CMDQ is used to help=20
> >> >> > > >> >> > read/write registers with critical time limitation,=
=20
> >> >> > > >> >> > such as updating display configuration during the v=
blank. It controls Global Command Engine (GCE) hardware to achieve this=
 requirement.
> >> >> > > >> >> > Currently, CMDQ only supports display related=20
> >> >> > > >> >> > hardwares, but we expect it can be extended to othe=
r hardwares for future requirements.
> >> >> > > >> >> >
> >> >> > > >> >> > Signed-off-by: HS Liao <hs.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> >> >> > > >> >>
> >> >> > > >> >> [snip]
> >> >> > > >> >>
> >> >> > > >> >> > diff --git a/drivers/soc/mediatek/mtk-cmdq.c=20
> >> >> > > >> >> > b/drivers/soc/mediatek/mtk-cmdq.c new file mode 100=
644=20
> >> >> > > >> >> > index 0000000..7570f00
> >> >> > > >> >> > --- /dev/null
> >> >> > > >> >> > +++ b/drivers/soc/mediatek/mtk-cmdq.c
> >> >> > > >
> >> >> > > > [snip]
> >> >> > > >
> >> >> > > >> >> > +static const struct cmdq_subsys g_subsys[] =3D {
> >> >> > > >> >> > +       {0x1400, 1, "MMSYS"},
> >> >> > > >> >> > +       {0x1401, 2, "DISP"},
> >> >> > > >> >> > +       {0x1402, 3, "DISP"},
> >> >> > > >> >>
> >> >> > > >> >> This isn't going to scale.  These addresses could be=20
> >> >> > > >> >> different on different chips.
> >> >> > > >> >> Instead of a static table like this, we probably need=
=20
> >> >> > > >> >> specify to the connection between gce and other devic=
es=20
> >> >> > > >> >> via devicetree phandles, and then use the phandles to=
=20
> >> >> > > >> >> lookup the corresponding device address range.
> >> >> > > >> >
> >> >> > > >> > I will define them in device tree.
> >> >> > > >> > E.g.
> >> >> > > >> > cmdq {
> >> >> > > >> >   reg_domain =3D 0x14000000, 0x14010000, 0x14020000 }
> >> >> > > >>
> >> >> > > >> The devicetree should only model hardware relationships,=
=20
> >> >> > > >> not software considerations.
> >> >> > > >>
> >> >> > > >> Is the hardware constraint here for using gce with vario=
us=20
> >> >> > > >> other hardware blocks?  I think we already model this by=
=20
> >> >> > > >> only providing a gce phandle in the device tree nodes fo=
r=20
> >> >> > > >> those devices that can use gce.
> >> >> > > >>
> >> >> > > >> Looking at the driver closer, as far as I can tell, the=20
> >> >> > > >> whole subsys concept is a purely software abstraction, a=
nd=20
> >> >> > > >> only used to debug the CMDQ_CODE_WRITE command.  In fact=
,=20
> >> >> > > >> AFAICT, everything would work fine if we just completely=
=20
> >> >> > > >> removed the 'subsys' concept, and just passed through th=
e raw address provided by the driver.
> >> >> > > >>
> >> >> > > >> So, I recommend just removing 'subsys' completely from t=
he=20
> >> >> > > >> driver - from this array, and in the masks.
> >> >> > > >>
> >> >> > > >> Instead, if there is an error on the write command, just=
=20
> >> >> > > >> print the address that fails.  There are other ways to=20
> >> >> > > >> deduce the subsystem from a physical address.
> >> >> > > >>
> >> >> > > >> Thanks,
> >> >> > > >>
> >> >> > > >> -Dan
> >> >> > > >
> >> >> > > > Hi Dan,
> >> >> > > >
> >> >> > > > Subsys is not just for debug.
> >> >> > > > Its main purpose is to transfer CPU address to GCE addres=
s.
> >> >> > > > Let me explain it by "write" op, I list a code segment fr=
om=20
> >> >> > > > cmdq_rec_append_command().
> >> >> > > >
> >> >> > > >         case CMDQ_CODE_WRITE:
> >> >> > > >                 subsys =3D cmdq_subsys_from_phys_addr(cqc=
tx, arg_a);
> >> >> > > >                 if (subsys < 0) {
> >> >> > > >                         dev_err(dev,
> >> >> > > >                                 "unsupported memory base =
address 0x%08x\n",
> >> >> > > >                                 arg_a);
> >> >> > > >                         return -EFAULT;
> >> >> > > >                 }
> >> >> > > >
> >> >> > > >                 *cmd_ptr++ =3D arg_b;
> >> >> > > >                 *cmd_ptr++ =3D (CMDQ_CODE_WRITE << CMDQ_O=
P_CODE_SHIFT) |
> >> >> > > >                              (arg_a & CMDQ_ARG_A_WRITE_MA=
SK) |
> >> >> > > >                              ((subsys & CMDQ_SUBSYS_MASK)=
 << CMDQ_SUBSYS_SHIFT);
> >> >> > > >                 break;
> >> >> > > >
> >> >> > > > Subsys is mapped from physical address via=20
> >> >> > > > cmdq_subsys_from_phys_addr(), and then it becomes part of=
=20
> >> >> > > > GCE command via ((subsys & CMDQ_SUBSYS_MASK) << CMDQ_SUBS=
YS_SHIFT) .
> >> >> > > > Only low bits of physical address are the same as GCE add=
ress.
> >> >> > > > We can get it by (arg_a & CMDQ_ARG_A_WRITE_MASK).
> >> >> > > > MASK is used to define how many bits are valid for this o=
p.
> >> >> > > > So, GCE address =3D subsys + valid low bits.
> >> >> > >
> >> >> > > How are these upper bits of the "GCE address" defined?
> >> >> > > In other words, for a given SoC, how is the mapping between=
=20
> >> >> > > physical io addresses to GCE addresses defined?
> >> >> > > Is this mapping fixed by hardware?
> >> >>
> >> >> Please answer the detailed technical questions:
> >> >>
> >> >> How are these upper bits of the "GCE address" defined?
> >> >
> >> > A GCE command is arg_a + arg_b. Both of them have 32 bits length=
=2E
> >> > arg_a is op + subsys + addr, and arg_b is value.
> >> > subsys + addr is less than 32bits, so we need to map address ran=
ge=20
> >> > to subsys.
> >> > The mapping rule is defined by hardware.
> >> >
> >> >> In other words, for a given SoC, how is the mapping between=20
> >> >> physical io addresses to GCE addresses defined?
> >> >
> >> > It is (b).
> >> >
> >> >>
> >> >> (a) Does the GCE remap a continuous device IO address range?
> >> >>
> >> >> AFAICT, the  defines an MT8173 specific mapping of:
> >> >>
> >> >> For example, the g_subsys table above seems to imply that the=20
> >> >> MT8173 gce maps all of:
> >> >>   0x1400ffff:0x141fffff =3D> 0x010000:0x1fffff
> >> >>
> >> >> (b) Or, are the upper 5 bits of the "gce address" significant, =
and=20
> >> >> via hardware it can map a disjoint groups of device addresses i=
nto=20
> >> >> the continuous GCE address space, and really there are 0x1f=20
> >> >> distinct 64k
> >> >> mappings:
> >> >>
> >> >> mmsys (1) : 0x14000000:0x1400ffff =3D> 0x010000:0x01ffff disp  =
(2) :=20
> >> >> 0x14010000:0x1401ffff =3D> 0x020000:0x02ffff disp  (3) :=20
> >> >> 0x14020000:0x1402ffff =3D> 0x030000:0x03ffff ...
> >> >> ???? (1f) : 0x141fffff:0x141fffff =3D> 0x1f0000:0x1fffff
> >> >>
> >> >> If the mapping is fixed and continuous (a), then I think all we=
=20
> >> >> need is a single dts entry for the gce node that describes how =
it=20
> >> >> performs this mapping.  And then, the gce consumers can just pa=
ss=20
> >> >> in their regular physical addresses, and the gce driver can rem=
ap=20
> >> >> them directly to gce addresses.
> >> >>
> >> >> WDYT?
> >> >
> >> > How about this?
> >> > hardware_module =3D <address_base subsys_id mask>; So, the resul=
t is=20
> >> > mmsys_config_base =3D <0x14000000 1 0xffff0000>;=20
> >> > disp_rdma_config_base =3D <0x14010000 2 0xffff0000>;=20
> >> > disp_mutex_config_base =3D <0x14020000 3 0xffff0000>;
> >>
> >> What uses ID 0 and 4 - 0x1f?
> >
> > Subsys is defined by GCE hardware, and other IDs are reserved curre=
ntly.
> >
> >> According to mt8173.dtsi, here are the blocks in the address range=
s above:
> >>
> >> @1400:
> >>   mmsys: clock-controller@14000000
> >>   ovl0: ovl@1400c000
> >>   ovl1: ovl@1400d000
> >>   rdma0: rdma@1400e000
> >>   rdma1: rdma@1400f000
> >>
> >> @1401:
> >>   rdma2: rdma@14010000
> >>   wdma0: wdma@14011000
> >>   wdma1: wdma@14012000
> >>   color0: color@14013000
> >>   color1: color@14014000
> >>   aal@14015000
> >>   gamma@14016000
> >>   merge@14017000
> >>   split0: split@14018000
> >>   split1: split@14019000
> >>   ufoe@1401a000
> >>   dsi0: dsi@1401b000
> >>   dsi1: dsi@1401c000
> >>   dpi0: dpi@1401d000
> >>   pwm0: pwm@1401e000
> >>   pwm1: pwm@1401f000
> >>
> >> @1402:
> >>   mutex: mutex@14020000
> >>   od@14023000
> >>   larb0: larb@14021000
> >>   smi_common: smi@14022000
> >>   hdmi0: hdmi@14025000
> >>   larb4: larb@14027000
> >>
> >> I assume that the gce will work with any of the devices in those
> >> ranges, not just "mmsys", "rdma" and "mutex", right?   (Also, noti=
ce
> >
> > That's right.
> >
> >> there are two "rdma" in the @1400 range, so rdma is really not a g=
ood=20
> >> name for @1401)
> >
> > I think we can just use index.
> > disp0_config_base =3D <0x14000000 1 0xffff0000>; disp1_config_base =
=3D=20
> > <0x14010000 2 0xffff0000>; disp2_config_base =3D <0x14020000 3=20
> > 0xffff0000>;
> >
> >> Further, it looks like the gce just maps a large device address ra=
nge=20
> >> starting at 0x14000000 to (21-bit) gce address 0x010000, rather th=
an
> >> 31 individually addressable 64k "subsys" blocks.  Is there a count=
er=20
> >> example that I am missing?
> >
> > From GCE's point of view,
> > it's 32 (0x0~0x1f) individually addressable 64k "subsys" blocks.
> > Currently, we don't have a counter example since all display relate=
d=20
> > address are put together.
>=20
> Ok, in this case, perhaps we should treat the GCE like an IOMMU, and =
have its binding define 32 slots or channels.
> Then, any device that wishes to send the GCE commands for its address=
 range should register a phandle to the gce, including the correspondin=
g slot.
>=20
> For example:
>=20
> include/.../gce.h
> include/dt-bindings/../mediatek-gce.h
> #define GCE_SLOT_1  1
> ...
>=20
> arch/arm64/boot/dts/mediatek/mt8173.dtsi:
>=20
> &ovl0: {
>   mediatek,gce =3D <&gce GCE_SLOT_1>;
> };
>=20
> &ovl1: {
>   mediatek,gce =3D <&gce GCE_SLOT_1>;
> };
>=20
> &rdma2: {
>   mediatek,gce =3D <&gce GCE_SLOT_2>;
> };
>=20
> &mutex: {
>   mediatek,gce =3D <&gce GCE_SLOT_3>;
> };
>=20
> &od: {
>   mediatek,gce =3D <&gce GCE_SLOT_3>;
> };
>=20
> Then, as each platform driver is probed, it can use the phandle to lo=
ok up its corresponding gce slot instance, retrieving an (opaque) point=
er to a struct gce_slot.
> The gce driver can have a set of constant tables matching the slots t=
o address ranges for particular per-soc compatibles, one of which is lo=
aded on probe.
> Later, when the device (gce consumer) wants to send a gce write comma=
nd, it passes in the gce_slot as an argument, and the gce driver can do=
 the corresponding lookup of subsys value and mask out the provided *de=
vice virtual* address.  In this way, you also no longer need to convert=
 the devices iomap'ed addresses into physical addresses before passing =
them to the gce.
>=20
> WDYT?
>=20
> -Dan

Hi Dan,

Thanks for your comment.
This solution looks good to me.
I will change it as your suggestion.

But, I have a question about 'mask out the provided *device virtual*
address'.
Are lower 16-bits (or 24-bits for JUMP op) of device virtual address th=
e
same as device physical address?
If not, we still need to pass in physical address into CMDQ driver.

Thanks,
HS Liao

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
