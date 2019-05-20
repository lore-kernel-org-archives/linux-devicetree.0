From: Ran Wang <ran.wang_1@nxp.com>
Subject: RE: [PATCH V2 3/3] soc: fsl: add RCPM driver
Date: Mon, 20 May 2019 09:17:59 +0000
Message-ID: <AM5PR0402MB2865E28B2E2296CB878ACEA2F1060@AM5PR0402MB2865.eurprd04.prod.outlook.com>
References: <20190517033946.30763-1-ran.wang_1@nxp.com>
 <20190517033946.30763-3-ran.wang_1@nxp.com> <20190519213844.GH31403@amd>
 <AM5PR0402MB2865EC5E1EF12C6C1D3C5566F1060@AM5PR0402MB2865.eurprd04.prod.outlook.com>
 <20190520085647.GA9748@amd>
 <AM5PR0402MB2865F4574B19761848B001F9F1060@AM5PR0402MB2865.eurprd04.prod.outlook.com>
 <20190520090748.GB9748@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190520090748.GB9748@amd>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@denx.de>
Cc: Leo Li <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <len.brown@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Pavel,

On Monday, May 20, 2019 17:08 Pavel Machek wrote:
> > > Hi!
> > >
> > > > > > +static int rcpm_pm_prepare(struct device *dev) {
> > > > > > +	struct device_node *np =3D dev->of_node;
> > > > > > +	struct wakeup_source *ws;
> > > > > > +	struct rcpm *rcpm;
> > > > > > +	u32 value[RCPM_WAKEUP_CELL_MAX_SIZE + 1], tmp;
> > > > > > +	int i, ret;
> > > > > > +
> > > > > > +	rcpm =3D dev_get_drvdata(dev);
> > > > > > +	if (!rcpm)
> > > > > > +		return -EINVAL;
> > > > > > +
> > > > > > +	/* Begin with first registered wakeup source */
> > > > > > +	ws =3D wakeup_source_get_next(NULL);
> > > > > > +	while (ws) {
> > > > >
> > > > > while (ws =3D wakeup_source_get_next(NULL)) ?
> > > >
> > > > Actually, we only pass NULL to wakeup_source_get_next() at very
> > > > first call to get 1st wakeup source. Then in the while loop, we
> > > > will fetch next source but not 1st, that's different. I am afraid
> > > > your suggestion is not quite correct.
> > >
> > > Sorry, I seen your next version before seeing this explanation.
> > >
> > > You are right, but the current code is "interesting". What about
> > >
> > >     ws =3D NULL;
> > >     while (ws =3D wakeup_source_get_next(NULL)) ...
> > >
> > > then?
> >
> > Did you mean:
> >      ws =3D NULL;
> >      while (ws =3D wakeup_source_get_next(ws)) ...
> >
> >    Yes, that will be the same to my original logic, do you recommend
> > to change to this? :)
>=20
> Yes please. It will be less confusing to the reader.

OK, if no other comment, I will work out v4, fix this and extra ','
=20
> Thanks (and sorry for cross-talk),

That's OK, thanks for your time.

Regards,
Ran
