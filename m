From: Peng Fan <peng.fan@nxp.com>
Subject: RE: [PATCH 0/2] mailbox: arm: introduce smc triggered mailbox
Date: Mon, 27 May 2019 06:18:30 +0000
Message-ID: <AM0PR04MB4481A7076D94A55BD48F8ACC881D0@AM0PR04MB4481.eurprd04.prod.outlook.com>
References: <20190523060437.11059-1-peng.fan@nxp.com>
 <4ba2b243-5622-bb27-6fc3-cd9457430e54@gmail.com>
 <20190524175658.GA5045@e107155-lin>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190524175658.GA5045@e107155-lin>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sudeep Holla <sudeep.holla@arm.com>, Florian Fainelli <f.fainelli@gmail.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "andre.przywara@arm.com" <andre.przywara@arm.com>, "van.freenix@gmail.com" <van.freenix@gmail.com>, "festevam@gmail.com" <festevam@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Sudeep,

> Subject: Re: [PATCH 0/2] mailbox: arm: introduce smc triggered mailbox
>=20
> On Thu, May 23, 2019 at 10:30:50AM -0700, Florian Fainelli wrote:
> > Hi,
> >
> > On 5/22/19 10:50 PM, Peng Fan wrote:
> > > This is a modified version from Andre Przywara's patch series
> > >
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flore.=
ke
> rnel.org%2Fpatchwork%2Fcover%2F812997%2F&amp;data=3D02%7C01%7Cpe
> ng.fan%40nxp.com%7Cfa2ba15f479b49eb219f08d6e0713ea3%7C686ea1d3b
> c2b4c6fa92cd99c5c301635%7C0%7C0%7C636943174355592142&amp;sdat
> a=3DY94rnxDEoMm9nyRyjJrYBqRduc5XkvvQhno7zfIQ%2B04%3D&amp;reserve
> d=3D0.
> > > [1] is a draft implementation of i.MX8MM SCMI ATF implementation
> > > that use smc as mailbox, power/clk is included, but only part of clk
> > > has been implemented to work with hardware, power domain only
> > > supports get name for now.
> > >
> > > The traditional Linux mailbox mechanism uses some kind of dedicated
> > > hardware IP to signal a condition to some other processing unit,
> > > typically a dedicated management processor.
> > > This mailbox feature is used for instance by the SCMI protocol to
> > > signal a request for some action to be taken by the management
> processor.
> > > However some SoCs does not have a dedicated management core to
> > > provide those services. In order to service TEE and to avoid linux
> > > shutdown power and clock that used by TEE, need let firmware to
> > > handle power and clock, the firmware here is ARM Trusted Firmware
> > > that could also run SCMI service.
> > >
> > > The existing SCMI implementation uses a rather flexible shared
> > > memory region to communicate commands and their parameters, it still
> > > requires a mailbox to actually trigger the action.
> >
> > We have had something similar done internally with a couple of minor
> > differences:
> >
> > - a SGI is used to send SCMI notifications/delayed replies to support
> > asynchronism (patches are in the works to actually add that to the
> > Linux SCMI framework). There is no good support for SGI in the kernel
> > right now so we hacked up something from the existing SMP code and
> > adding the ability to register our own IPI handlers (SHAME!). Using a
> > PPI should work and should allow for using request_irq() AFAICT.
> >
>=20
> We have been thinking this since we were asked if SMC can be transport.
> Generally out of 16 SGIs, 8 are reserved for secure side and non-secure h=
as 8.
> Of these 8, IIUC 7 is already being used by kernel. So unless we manage t=
o get
> the last one reserved exclusive to SCMI, it makes it difficult to add SGI=
 support
> in SCMI.
>=20
> We have been telling partners/vendors about this limitation if they use S=
MC
> as transport and need to have dedicated h/w interrupt for the notificatio=
ns.

This is an option, and we could add optional property.

>=20
> Another issue could be with virtualisation(using HVC) and EL handling so =
called
> SCMI SGI. We need to think about those too.=20

Using dedicated HW for virtualization that support vcpu scheduling might be
not a good choice, do you mean this? Dedicated pin vcpu to pcpu should be f=
ine,
just like jailhouse hypervisor.

I will try to get more info on this
> and come back on this.

Looking forward.

Thanks,
Peng.

>=20
> --
> Regards,
> Sudeep
