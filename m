Return-Path: <SRS0=/0v1=SU=nxp.com=ping.bai@kernel.org>
From: Jacky Bai <ping.bai@nxp.com>
Subject: RE: [PATCH 0/3] Add power domain driver support for i.mx8m family
Date: Thu, 18 Apr 2019 01:54:18 +0000
Message-ID: 
 <VI1PR0402MB35196D5E9D4E261C0153556D87260@VI1PR0402MB3519.eurprd04.prod.outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Lucas Stach <l.stach@pengutronix.de>, Aisheng Dong <aisheng.dong@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, dl-linux-imx <linux-imx@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "jacky.baip@gmail.com" <jacky.baip@gmail.com>
List-ID: <devicetree@vger.kernel.org>

>=20
> On Wed, Apr 17, 2019 at 02:30:53PM +0000, Jacky Bai wrote:
> >
> > Hi Lucas,
> >
> > Either SCMI or SCPI, I think it is initially designed for SOC that has
> > dedicated SCP to manage the SOC resource, but for i.MX8M, we don't
> > have such support. so just for the power domain support, do you have
> > other suggestion for it.
> >
>=20
> I disagree, I thought it was clear from my earlier email. All OSPM like L=
inux
> kernel cares is conformance to the interface. And SCMI/SCPI kind of inter=
face
> doesn't mandate how to implement either at the hardware (you may or may
> not have dedicated processor) or software level(can do it in TF-A through=
 SMC,
> or some remote process through mailbox)
>=20

For the current SCMI/SCPI driver in mainline kernel, no SCMI/SCPI over SMC =
support, right?
If we want to make SCMI over SMC as a standard support, does ARM have some =
suggestion
or plan? :)

> I am clearly against the custom SMC:
>=20
> 1. It will never end and it's put together without much design thoughts
>    just to address specific need of the hour.
> 2. It gets obsolete very soon, mainly because of (1) 3. Very platform and
> vendor specific and soon we will find ourselves
>    in ocean of such custom calls
>=20
> And I can definitely continue the list, but I have made the point.
> I think we already have enough of those custom SMC already now and it's
> high time to stop that non-sense for OSPM.
>=20

>From the ARM SMC calling convention, the SIP service call is designed to
provide SOC specific service, for example, Secure platform initialization,
configuration and some power control. I am confused if upstream kernel will=
 never
accept SIP service patch.

>From the SCMI spec, it provide the clock management for enable/disable/set_=
rate,
But don't have set_parent support, for i.MX8M platform, we have the require=
ment to
set clock parent explicitly. If we move to use SCMI framework, how do handl=
e
the set parent?

> --
> Regards,
> Sudeep
