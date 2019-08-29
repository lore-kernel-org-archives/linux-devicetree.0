From: Vitor Soares <Vitor.Soares@synopsys.com>
Subject: RE: [PATCH 4/4] i3c: master: dw: reattach device on first available
 location of address table
Date: Thu, 29 Aug 2019 14:09:08 +0000
Message-ID: <SN6PR12MB265539D98E3B4571C1705799AEA20@SN6PR12MB2655.namprd12.prod.outlook.com>
References: <cover.1567071213.git.vitor.soares@synopsys.com>
        <e03fb41054a8431b27cc84c3d83ada9464172ef7.1567071213.git.vitor.soares@synopsys.com>
 <20190829131519.3f420c64@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190829131519.3f420c64@collabora.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Boris Brezillon <boris.brezillon@collabora.com>, Vitor Soares <Vitor.Soares@synopsys.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>, "bbrezillon@kernel.org" <bbrezillon@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "Joao.Pinto@synopsys.com" <Joao.Pinto@synopsys.com>
List-Id: devicetree@vger.kernel.org

Hi Boris,

From: Boris Brezillon <boris.brezillon@collabora.com>
Date: Thu, Aug 29, 2019 at 12:15:19

> On Thu, 29 Aug 2019 12:19:35 +0200
> Vitor Soares <Vitor.Soares@synopsys.com> wrote:
>=20
> > For today the reattach function only update the device address on the
> > controller.
> >=20
> > Update the location to the first available too, will optimize the
> > enumeration process avoiding additional checks to keep the available
> > positions on address table consecutive.
>=20
> Given the number of available slots I honestly don't think it makes a
> difference, but I also don't mind this change, so

The slots are HW dependent. The point is, I need to guarantee the=20
available slot are consecutives.
If you have any suggestion I appreciate.

>=20
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
>=20
> >=20
> > Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
> > ---
> >  drivers/i3c/master/dw-i3c-master.c | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> >=20
> > diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw=
-i3c-master.c
> > index 1d83c97..62261ac 100644
> > --- a/drivers/i3c/master/dw-i3c-master.c
> > +++ b/drivers/i3c/master/dw-i3c-master.c
> > @@ -898,6 +898,22 @@ static int dw_i3c_master_reattach_i3c_dev(struct i=
3c_dev_desc *dev,
> >  	struct dw_i3c_i2c_dev_data *data =3D i3c_dev_get_master_data(dev);
> >  	struct i3c_master_controller *m =3D i3c_dev_get_master(dev);
> >  	struct dw_i3c_master *master =3D to_dw_i3c_master(m);
> > +	int pos;
> > +
> > +	pos =3D dw_i3c_master_get_free_pos(master);
> > +
> > +	if (data->index > pos && pos > 0) {
> > +		writel(0,
> > +		       master->regs +
> > +		       DEV_ADDR_TABLE_LOC(master->datstartaddr, data->index));
> > +
> > +		master->addrs[data->index] =3D 0;
> > +		master->free_pos |=3D BIT(data->index);
> > +
> > +		data->index =3D pos;
> > +		master->addrs[pos] =3D dev->info.dyn_addr;
> > +		master->free_pos &=3D ~BIT(pos);
> > +	}
> > =20
> >  	writel(DEV_ADDR_TABLE_DYNAMIC_ADDR(dev->info.dyn_addr),
> >  	       master->regs +

Best regards,
Vitor Soares
