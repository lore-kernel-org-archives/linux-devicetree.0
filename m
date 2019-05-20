From: Ran Wang <ran.wang_1@nxp.com>
Subject: RE: [PATCH v3 3/3] soc: fsl: add RCPM driver
Date: Mon, 20 May 2019 07:39:29 +0000
Message-ID: <AM5PR0402MB2865E57004468965FF2003A2F1060@AM5PR0402MB2865.eurprd04.prod.outlook.com>
References: <20190520065816.32360-1-ran.wang_1@nxp.com>
 <20190520065816.32360-3-ran.wang_1@nxp.com> <20190520072630.GA3674@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190520072630.GA3674@amd>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@denx.de>
Cc: Leo Li <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <len.brown@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Pavel,

On Monday, May 20, 2019 15:27: Pavel Machek wrote:
>=20
> Hi!
>=20
> > The NXP's QorIQ Processors based on ARM Core have RCPM module (Run
> > Control and Power Management), which performs all device-level tasks
> > associated with power management such as wakeup source control.
> >
> > This driver depends on PM wakeup source framework which help to
> > collect wake information.
> >
> > Signed-off-by: Ran Wang <ran.wang_1@nxp.com>
>=20
> > +// Copyright 2019 NXP
> > +//
> > +// Author: Ran Wang <ran.wang_1@nxp.com>,
>=20
> extra ,

OK, will update.

> > +	rcpm =3D dev_get_drvdata(dev);
> > +	if (!rcpm)
> > +		return -EINVAL;
> > +
> > +	/* Begin with first registered wakeup source */
> > +	ws =3D wakeup_source_get_next(NULL);
> > +	while (ws) {
>=20
> while (ws =3D wakeup_source_get_next(NULL))
>=20
> ?
I just answered this in v2 mail thread:=20
"Actually, we only pass NULL to wakeup_source_get_next()
at very first call to get 1st wakeup source. Then in the while
loop, we will fetch next source but not 1st, that's different.
I am afraid your suggestion is not quite correct."

Regards
Ran
