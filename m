From: Aisheng Dong <aisheng.dong@nxp.com>
Subject: RE: [PATCH] dt-bindings: imx: update scu resource id headfile
Date: Wed, 20 Feb 2019 14:09:03 +0000
Message-ID: <AM6PR04MB4215AFEA3F139B48D7FE4E9D807D0@AM6PR04MB4215.eurprd04.prod.outlook.com>
References: <20190219125211.2pg2bqxner4klcb5@pengutronix.de>
 <DB3PR0402MB3916AF3AA0283DB22DF61E2FF57C0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <20190219144808.qqpaubjcsb4huoml@pengutronix.de>
 <DB3PR0402MB39160A56E168ED20410674D7F57C0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <AM6PR04MB42152D05E62753E760741160807D0@AM6PR04MB4215.eurprd04.prod.outlook.com>
 <20190220081650.cu3yzausx55jefb6@pengutronix.de>
 <AM6PR04MB4215014B734F71D409D617A5807D0@AM6PR04MB4215.eurprd04.prod.outlook.com>
 <20190220105249.u2hcvk6ut3cycvqs@pengutronix.de>
 <AM6PR04MB4215D9FE015E9251425B0FFC807D0@AM6PR04MB4215.eurprd04.prod.outlook.com>
 <a55e0643bb2acd522145c74ec0e8b74a16b718f8.camel@pengutronix.de>
 <20190220135232.4drv77tbkfwjeapl@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190220135232.4drv77tbkfwjeapl@pengutronix.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Marco Felsch <m.felsch@pengutronix.de>, Lucas Stach <l.stach@pengutronix.de>
Cc: Anson Huang <anson.huang@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

> From: Marco Felsch [mailto:m.felsch@pengutronix.de]
> Sent: Wednesday, February 20, 2019 9:53 PM
>=20
> On 19-02-20 13:11, Lucas Stach wrote:
> > Am Mittwoch, den 20.02.2019, 11:21 +0000 schrieb Aisheng Dong:
> > > Hi Marco,
> > >
> > > > From: Marco Felsch [mailto:m.felsch@pengutronix.de]
> > > > Sent: Wednesday, February 20, 2019 6:53 PM
> > > >
> > > > Hi Aisheng,
> > > >
> > > > On 19-02-20 09:49, Aisheng Dong wrote:
> > > > > > From: Marco Felsch [mailto:m.felsch@pengutronix.de]
> > > > > > Sent: Wednesday, February 20, 2019 4:17 PM On 19-02-20 03:38,
> > > > > > Aisheng Dong wrote:
> > > > > > > [...]
> > > > > > >
> > > > > > > > > I don't like droping some ID's (e.g.
> > > > > > > > > IMX_SC_R_DC_0_CAPTURE0) by mark them as unused or even
> > > > > > > > > worse give them a other meaning. IMHO the scu-api should
> > > > > > > > > be stable since day 1 and the ID's should only be
> > > > > > extended.
> > > > > > > > > Marking ID's as deprecated is much better than moving the=
m
> around.
> > > > > > > >
> > > > > > > > I agree the SCU APIs should be stable since day 1 and the
> > > > > > > > ID should ONLY be extended, but that is the best cases,
> > > > > > > > the reality is, there are different SoCs/Revision, some
> > > > > > > > revisions may remove the resources ID defined in pre-coded
> > > > > > > > SCU firmware, like the
> > > > > > > > IMX_SC_R_DC_0_CAPTURE0 etc., so SCU APIs removes them
> > > > > > > > after real silicon arrived, now latest SCU firmware marks
> > > > > > > > them as UNUSED, they could be replaced by some other new
> > > > > > > > resources in later new SoC, I am NOT sure, but if it
> > > > > > > > happens, this resource ID table should be updated anyway,
> > > > > > > > leaving the out-of-date resource ID table there will have
> > > > > > issues, since it is NOT sync with SCU firmware.
> > > > > > > > So how to resolve such issue? We hope the SCU firmware
> > > > > > > > should be stable since day 1, but the truth is NOT, could
> > > > > > > > be still some updates but NOT very often. And I believe
> > > > > > > > the updates will NOT break old
> > > > > > kernel version.
> > > > > >
> > > > > > Hi Anson,
> > > > > >
> > > > > > Please don't mix the dt-bindings and the kernel related stuff.
> > > > > > Unfortunately the bindings are within the kernel repo which in
> > > > > > fact is great for us kernel developer but the bindings are
> > > > > > also used in other projects such as barebox or other kernels
> > > > > > (don't know the BSD guys). So you can't ensure that your
> > > > > > change will break something. Please
> > > > keep that in mind.
> > > > > > IMHO solving that issue should be done by the scu firmware. I
> > > > > > tought the scu is a cortex-m4 with a bunch of embedded flash
> > > > > > and ram (I don't know that much about the scu since it is
> closed/black-boxed).
> > > > > > Why do you don't use a translation table within the scu? As I
> > > > > > said earlier I don't like the redefinition of ID's since they
> > > > > > are now part of the
> > > > dt-bindings.
> > > > > > The bindings can store up to 32bit values which is a large
> > > > > > number ;) IMHO wasting some ID's in favour of stability is a be=
tter
> solution.
> > > > > >
> > > > >
> > > > > As far as I know, those remove resource IDs are pre-defined and
> > > > > has never been used and won't be used anymore by SC firmware.
> > > > > (Anson can double check it) So I think it's safe to remove them
> > > > > or mark them as
> > > > deprecated.
> > > >
> > > > I think marking them as deprecated by a commentar is better than
> > > > redefining bits to be unused. As I said the bindings not only
> > > > linux related they are used in other projects too.
> > > >
> > >
> > > For other projects, the result is same because SC firmware does not
> > > support those Resource IDs.
> > >
> > > > > Personally I may prefer to remove them as they never worked to
> > > > > avoid confusing, especially at this early stage for mx8.
> > > >
> > > > So why they are there if they never worked? Wouldn't it a better
> > > > approach to start with a basic and working ID file and extend this
> > > > rather than adding id's because maybe the will work..
> > >
> > > Ideally yes, but may be hard in reality.
> > >
> > > SC firmware code usually is developed quite early before silicon come=
s.
> > > But the real chip may changes, e.g. removed or added something.
> > >
> > > AFAIK those resource IDs removed have never worked in SC firmware,
> > > and they're likely to come out of pre-silicon definition. But chip
> > > changes later.
> > >
> > > > Sorry but this seems wrong to me too.
> > > > I know the approach from driver development, adding a driver
> > > > specific *_reg.h file and later figuring out that those bits won't
> > > > work as aspected. As I said this will be driver and only linux
> > > > related so we can change them as many times as we want. But in
> > > > your case we are talking about dt-bindings and this approach won't =
work.
> > >
> > > I would agree with you if those resource IDs have worked before.
> > > But they never worked.
> > > Should we keep a thing never worked in device tree just because It
> > > makes us look like keeping compatibility?
> > >
> > > If that, I'd rather removing them to avoid confusing in the future. L=
ife is
> long, right?
> > > I don't want people to bother with those unmeaning things anymore
> > > when they look at it.
> >
> > Removing things is totally fine if they have never worked. Re-using
> > the now "free" IDs is what is problematic. Only ever use previously
> > unused IDs when introducing new stuff into the SCU firmware. This is
> > something you need to communicate quite clearly with the SCU firmware
> developers.
>=20
> I'm fine with removing too then there would be a gap. Don't know if it is=
 better
> to have a gap or a comment that those ID isn't supported since fw-revisio=
n XYZ
> / silicon version ZYX.
>=20
> Just some toughts:
> The gap will then suggest that this ID is free and was never assigned to =
some
> functionality. In real it was assigned previously and now gets redefined.=
 Also as
> far as I can see there are no gaps currently. Let's wait for Rob's feedba=
ck.
>=20
> As Lucas mentioned using IMX_SC_R_UNUSED* ID's for new functionality is
> totaly fine but redefine ID's seems wrong to me.
>=20

Probably we still keep those removed IDs as IMX_SC_R_UNUSED*?

BTW, I guess Lucas's suggestion is:
" Re-using the now "free" IDs is what is problematic, Only ever use previou=
sly
unused IDs when introducing new stuff into the SCU firmware".
Because it's true that reused IDs are new stuff into SCU firmware.
So it's okay to change IMX_SC_R_UNUSED into a new ID, right?

Regards
Dong Aisheng

> Regards,
> Marco
>=20
> >
> > Regards,
> > Lucas
> >
> >
