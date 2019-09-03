From: Vitor Soares <Vitor.Soares@synopsys.com>
Subject: RE: [PATCH v2 1/5] i3c: master: detach and free device if
 pre_assign_dyn_addr() fails
Date: Tue, 3 Sep 2019 11:10:52 +0000
Message-ID: <SN6PR12MB2655676567F5A9EFF7619DCDAEB90@SN6PR12MB2655.namprd12.prod.outlook.com>
References: <cover.1567437955.git.vitor.soares@synopsys.com>
        <105a3ac1653e9ae658056a5ec9ddc2a084a61669.1567437955.git.vitor.soares@synopsys.com>
 <20190903125237.13a382b2@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190903125237.13a382b2@collabora.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Boris Brezillon <boris.brezillon@collabora.com>, Vitor Soares <Vitor.Soares@synopsys.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>, "bbrezillon@kernel.org" <bbrezillon@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "pgaj@cadence.com" <pgaj@cadence.com>, "Joao.Pinto@synopsys.com" <Joao.Pinto@synopsys.com>
List-Id: devicetree@vger.kernel.org

Hi Boris,

From: Boris Brezillon <boris.brezillon@collabora.com>
Date: Tue, Sep 03, 2019 at 11:52:37

> On Tue,  3 Sep 2019 12:35:50 +0200
> Vitor Soares <Vitor.Soares@synopsys.com> wrote:
>=20
> > On pre_assing_dyn_addr() the devices that fail:
> >   i3c_master_setdasa_locked()
> >   i3c_master_reattach_i3c_dev()
> >   i3c_master_retrieve_dev_info()
> >=20
> > are kept in memory and master->bus.devs list. This makes the i3c device=
s
> > without a dynamic address are sent on DEFSLVS CCC command. Fix this by
> > detaching and freeing the devices that fail on pre_assign_dyn_addr().
> >=20
> > Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
> > ---
> > Changes in v2:
> >   - Move out detach/free the i3c_dev_desc from pre_assign_dyn_addr()
>=20
> So, you decided to ignore my comment about leaving the i3c_dev_desc
> allocated and skipping entries that don't have a dynamic address when
> forging the DEFSLVS frame instead of doing this
> allocate/free/re-allocate dance, and more importantly, you didn't even
> bother explaining why.
>=20
> I'm not willing to accept this patch unless you come up with solid
> reasons.

I think I already give a strong reason for my decision. Let say that my=20
controller only has space for 4 devices and one of them is offline during=20
pre_assign_dyn_addr() and hence it fails. When device tries to do the HJ=20
I won't be able to do the enumeration because there is no space left.=20
Anyway, you are right and I need to add this to commit message.

BTW, It is not clear to me why should we keep non addressed devices=20
allocated when we have i3c_dev_boardinfo list with ->of_node information=20
and what is the problem with allocate/free/re-allocate dance?

Best regards,
Vitor Soares
