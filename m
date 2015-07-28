From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: [RFCv2 3/3] reset: reset-zynq: Adding support for Xilinx Zynq
 reset controller.
Date: Tue, 28 Jul 2015 07:27:24 -0700
Message-ID: <20150728142723.GS2650@xsjsorenbubuntu>
References: <1437783682-13632-1-git-send-email-moritz.fischer@ettus.com>
 <1437783682-13632-4-git-send-email-moritz.fischer@ettus.com>
 <1438072680.3193.24.camel@pengutronix.de>
 <CAAtXAHfgCnH1KPyPBBPHq-amr=npMmyYjs+D9jnB3F9qpD6dbA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAAtXAHfgCnH1KPyPBBPHq-amr=npMmyYjs+D9jnB3F9qpD6dbA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Moritz Fischer <moritz.fischer@ettus.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, Kumar Gala <galak@codeaurora.org>, Michal Simek <michal.simek@xilinx.com>, linux@arm.linux.org.uk, devicetree@vger.kernel.org, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, 2015-07-28 at 07:05AM -0700, Moritz Fischer wrote:
> Philip,
>=20
> thanks for your review :)
>=20
> On Tue, Jul 28, 2015 at 1:38 AM, Philipp Zabel <p.zabel@pengutronix.d=
e> wrote:
> > Hi Moritz,
> >
> > Am Freitag, den 24.07.2015, 17:21 -0700 schrieb Moritz Fischer:
> >> This adds a reset controller driver to control the Xilinx Zynq
> >> SoC's various resets.
> >>
> >> Signed-off-by: Moritz Fischer <moritz.fischer@ettus.com>
[...]
> >> +
> >> +/* Offsets into SLCR regmap */
> >> +#define SLCR_RST_CTRL_OFFSET 0x200 /* FPGA Software Reset Control=
 */
> >
> > Maybe get this value from the reg property? I'm not sure if this is=
 ever
> > expected to change.
> I don't think it's going to change. Is there a reason to only expose
> part of the resets?

I think all other users of the syscon (in the Zynq DT) use the 'reg' pr=
operty
to retrieve an offset into the SLCR. We should probably do that here to=
o and
remove the #define. Who knows, maybe this driver is reusable with some
modifications for the Zynq MPSoC.

> >
> >> +#define NBANKS       18
> >
> > reg =3D <0x200 0x50> says there are two more registers, are those n=
ot used?
>=20
> Should be 0x48, you're right. Michal had suggested 0x50, but the last
> two regs are not really resets.
> >
[...]
> >> +static int zynq_reset_status(struct reset_controller_dev *rcdev,
> >> +                          unsigned long id)
> >> +{
> >> +     struct zynq_reset_data *priv =3D to_zynq_reset_data(rcdev);
> >> +
> >> +     int bank =3D id / BITS_PER_LONG;
> >> +     int offset =3D id % BITS_PER_LONG;
> >> +     u32 reg;
> >> +
> >> +     regmap_read(priv->slcr, SLCR_RST_CTRL_OFFSET + (bank * 4), &=
reg);
> >> +
> >> +     return !(reg & BIT(offset));
> >> +}
>=20
> Will change to:
>         ret =3D regmap_read(priv->slcr, SLCR_RST_CTRL_OFFSET + (bank =
* 4), &reg);
>         if (ret)
>                 return ret;
>         else
>                 return !!(reg & BIT(offset));
>=20
> the single '!' was a typo ...

You have an early return on error in the if-branch. No need for the
else.

>=20
> >
> > Do I understand this correctly, you write 1 to assert the reset, bu=
t the
> > register reads 0 while the reset is asserted and 1 otherwise?
> > Also note that reset_status may return negative ERRNO, so for offse=
t =3D=3D
> > 31 you should not return (1<<31).
> >
> >> +static const struct reset_control_ops zynq_reset_ops =3D {
> >> +     .assert         =3D zynq_reset_assert,
> >> +     .deassert       =3D zynq_reset_deassert,
> >> +     .status         =3D zynq_reset_status,
> >> +};
> >> +
> >> +static int zynq_reset_probe(struct platform_device *pdev)
> >> +{
> >> +     struct zynq_reset_data *priv;
> >> +
> >> +     priv =3D devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL)=
;
> >> +     if (!priv)
> >> +             return -ENOMEM;
> >> +     platform_set_drvdata(pdev, priv);
> >> +
> >> +     priv->slcr =3D syscon_regmap_lookup_by_phandle(pdev->dev.of_=
node,
> >> +             "syscon");
> >
> > I'd just use syscon_node_to_regmap(pdev->dev.of_node->parent) here,
> > which removes the need for the syscon phandle binding.
>=20
> See binding doc discussion. I don't have a strong preference either w=
ay,
> just tried to be consistent with the pinctrl node.
> We just need a decision one way or the other :)

I personally like the syscon handle better since it would make placing
the node more flexible, while this proposal forces some topology on the
DT. In both cases though, the syscon and this user are tightly coupled
and this driver depends on the syscon. I don't really mind either way -
I think.

	S=C3=B6ren
