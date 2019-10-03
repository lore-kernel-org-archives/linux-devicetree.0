From: Vitor Soares <Vitor.Soares@synopsys.com>
Subject: RE: [PATCH v3 2/5] i3c: master: make sure ->boardinfo is initialized
 in add_i3c_dev_locked()
Date: Thu, 3 Oct 2019 17:37:40 +0000
Message-ID: <CH2PR12MB42162C4459E31D85FD60FB79AE9F0@CH2PR12MB4216.namprd12.prod.outlook.com>
References: <cover.1567608245.git.vitor.soares@synopsys.com>
        <ed18fd927b5759a6a1edb351113ceca615283189.1567608245.git.vitor.soares@synopsys.com>
 <20191003162943.4a0d0274@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20191003162943.4a0d0274@collabora.com>
Content-Language: en-US
Sender: stable-owner@vger.kernel.org
To: Boris Brezillon <boris.brezillon@collabora.com>, Vitor Soares <Vitor.Soares@synopsys.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>, "bbrezillon@kernel.org" <bbrezillon@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "pgaj@cadence.com" <pgaj@cadence.com>, "Joao.Pinto@synopsys.com" <Joao.Pinto@synopsys.com>, "stable@vger.kernel.org" <stable@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Boris,

From: Boris Brezillon <boris.brezillon@collabora.com>
Date: Thu, Oct 03, 2019 at 15:29:43

> On Thu,  5 Sep 2019 12:00:35 +0200
> Vitor Soares <Vitor.Soares@synopsys.com> wrote:
>=20
> > The newdev->boardinfo assignment was missing in
> > i3c_master_add_i3c_dev_locked() and hence the ->of_node info isn't
> > propagated to i3c_dev_desc.
> >=20
> > Fix this by trying to initialize device i3c_dev_boardinfo if available.
> >=20
> > Cc: <stable@vger.kernel.org>
> > Fixes: 3a379bbcea0a ("i3c: Add core I3C infrastructure")
> > Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
> > ---
> > Change in v3:
> >   - None
> >=20
> > Changes in v2:
> >   - Change commit message
> >   - Change i3c_master_search_i3c_boardinfo(newdev) to
> >   i3c_master_init_i3c_dev_boardinfo(newdev)
> >   - Add fixes, stable tags
> >=20
> >  /**
> >   * i3c_master_add_i3c_dev_locked() - add an I3C slave to the bus
> >   * @master: master used to send frames on the bus
> > @@ -1818,8 +1834,9 @@ int i3c_master_add_i3c_dev_locked(struct i3c_mast=
er_controller *master,
> >  				  u8 addr)
> >  {
> >  	struct i3c_device_info info =3D { .dyn_addr =3D addr };
> > -	struct i3c_dev_desc *newdev, *olddev;
> >  	u8 old_dyn_addr =3D addr, expected_dyn_addr;
> > +	enum i3c_addr_slot_status addrstatus;
> > +	struct i3c_dev_desc *newdev, *olddev;
> >  	struct i3c_ibi_setup ibireq =3D { };
> >  	bool enable_ibi =3D false;
> >  	int ret;
> > @@ -1878,6 +1895,8 @@ int i3c_master_add_i3c_dev_locked(struct i3c_mast=
er_controller *master,
> >  	if (ret)
> >  		goto err_detach_dev;
> > =20
> > +	i3c_master_init_i3c_dev_boardinfo(newdev);
> > +
> >  	/*
> >  	 * Depending on our previous state, the expected dynamic address migh=
t
> >  	 * differ:
> > @@ -1895,7 +1914,11 @@ int i3c_master_add_i3c_dev_locked(struct i3c_mas=
ter_controller *master,
> >  	else
> >  		expected_dyn_addr =3D newdev->info.dyn_addr;
> > =20
> > -	if (newdev->info.dyn_addr !=3D expected_dyn_addr) {
> > +	addrstatus =3D i3c_bus_get_addr_slot_status(&master->bus,
> > +						  expected_dyn_addr);
> > +
> > +	if (newdev->info.dyn_addr !=3D expected_dyn_addr &&
> > +	    addrstatus =3D=3D I3C_ADDR_SLOT_FREE) {
>=20
> First, this change shouldn't be part of this patch, since the commit
> message only mentions the boardinfo init stuff,

This is not an issue, I can create a patch just for boardinfo init fix.

> not the extra 'is slot
> free check'.

Even ignoring patch 1, it is necessary to check if the slot is free=20
because if SETDASA fails the boardinfo->init_dyn_addr can be assigned to=20
another device. That's why we need to check if expected_dyn_addr is free.

> Plus, I want the fix to be backported so we should avoid
> any unneeded deps.
>=20
> But even with those 2 things addressed, I'm still convinced the
> 'free desc when device is not reachable' change you do in patch 1 is
> not that great,=20

If I'm doing wrong I really appreciate you tell me the reason.

> and the fact that you can't pre-reserve the address to
> make sure no one uses it until the device had a chance to show up tends
> to prove me right.

This is a different corner case and I though we agreed that the framework=20
doesn't provide guarantees to assign boardinfo->init_dyn_addr [1].

Yet, I don't disagree with the idea of pre-reserve the=20
boardinfo->init_dyn_addr.
I can do this but we need to align how it should be done.

>=20
> Can we please do what I suggest and solve the "not enough dev slots"
> problem later on (if we really have to).

I have this use case where the HC has only 4 slot for 4 devices.=20
Sometimes the one or more devices can be sleeping and when they trigger=20
HJ there is no space in HC.

Best regards,
Vitor Soares

[1] https://patchwork.kernel.org/patch/11120841/
