From: Peng Fan <peng.fan@nxp.com>
Subject: RE: [PATCH v5 1/2] dt-bindings: mailbox: add binding doc for the ARM
 SMC/HVC mailbox
Date: Fri, 30 Aug 2019 09:40:34 +0000
Message-ID: <AM0PR04MB4481879790B4E2C3FC3554E088BD0@AM0PR04MB4481.eurprd04.prod.outlook.com>
References: <1567004515-3567-1-git-send-email-peng.fan@nxp.com>
 <1567004515-3567-2-git-send-email-peng.fan@nxp.com>
 <CABb+yY2tRjazjaogpM7irqgTD+PdwsfqCxk5hP-_czrET3V5xQ@mail.gmail.com>
 <AM0PR04MB4481785CABB44A8C71CFB8D788BD0@AM0PR04MB4481.eurprd04.prod.outlook.com>
 <CABb+yY2TREpO7+TFcGgsgQrkmMWwFAgtuJ4GnLPPQ+GEBuh07w@mail.gmail.com>
 <AM0PR04MB448161C632722DF10989008088BD0@AM0PR04MB4481.eurprd04.prod.outlook.com>
 <20190830093005.GA31297@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190830093005.GA31297@bogus>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "andre.przywara@arm.com" <andre.przywara@arm.com>, "f.fainelli@gmail.com" <f.fainelli@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

Hi Sudeep

> Subject: Re: [PATCH v5 1/2] dt-bindings: mailbox: add binding doc for the=
 ARM
> SMC/HVC mailbox
>=20
> On Fri, Aug 30, 2019 at 07:37:41AM +0000, Peng Fan wrote:
> > Hi Jassi,
> > > > I think there could be channel for TEE, and channel for Linux.
> > > > For virtualization case, there could be dedicated channel for each =
VM.
> > > >
> > > I am talking from Linux pov. Functions 0xfe and 0xff above, can't
> > > both be active at the same time, right?
> >
> > If I get your point correctly,
> > On UP, both could not be active. On SMP, tx/rx could be both active,
> > anyway this depends on secure firmware and Linux firmware design.
> >
>=20
> Just to confirm, we can't have SMC/HVC based Rx channel as there's no
> *architectural* way to achieve it. So it can be based on some interrupt f=
rom
> secure side and hence will be a *different* type of channel/controller.
>=20
> Sorry to make this point repeatedly, but juts to be absolutely clear:
> as it stands, SMC/HVC can be used only for Tx today.

Since interrupt notification was dropped in v5, I need to drop RX descripti=
on
in v6.

Thanks,
Peng.

>=20
> --
> Regards,
> Sudeep
