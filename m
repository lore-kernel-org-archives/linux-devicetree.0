From: Biwen Li <biwen.li@nxp.com>
Subject: RE: [EXT] Re: [1/3] rtc/fsl: support flextimer for lx2160a
Date: Mon, 26 Aug 2019 03:30:23 +0000
Message-ID: <DB7PR04MB4490842E0D25449CB10897258FA10@DB7PR04MB4490.eurprd04.prod.outlook.com>
References: <20190823095740.12280-1-biwen.li@nxp.com>
 <20190823142504.GA30479@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190823142504.GA30479@piout.net>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: "a.zummo@towertech.it" <a.zummo@towertech.it>, Leo Li <leoyang.li@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

> On 23/08/2019 17:57:38+0800, Biwen Li wrote:
> > The patch supports flextimer for lx2160a
> >
> > Signed-off-by: Biwen Li <biwen.li@nxp.com>
> > ---
> >  drivers/rtc/rtc-fsl-ftm-alarm.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/rtc/rtc-fsl-ftm-alarm.c
> > b/drivers/rtc/rtc-fsl-ftm-alarm.c index 4f7259c2d6a3..2b81525f6db8
> > 100644
> > --- a/drivers/rtc/rtc-fsl-ftm-alarm.c
> > +++ b/drivers/rtc/rtc-fsl-ftm-alarm.c
> > @@ -313,6 +313,7 @@ static const struct of_device_id ftm_rtc_match[] =
=3D {
> >       { .compatible =3D "fsl,ls1088a-ftm-alarm", },
> >       { .compatible =3D "fsl,ls208xa-ftm-alarm", },
> >       { .compatible =3D "fsl,ls1028a-ftm-alarm", },
> > +     { .compatible =3D "fsl,lx2160a-ftm-alarm", },
> >       { },
> >  };
>=20
> I've squashed it with 3/3 and in the patch adding the driver. I also adde=
d proper
> documentation.
Alexandre,Ok, thanks.
>=20
> --
> Alexandre Belloni, Bootlin
> Embedded Linux and Kernel engineering
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbootl=
in.
> com&amp;data=3D02%7C01%7Cbiwen.li%40nxp.com%7C7566210e899b40e873
> ff08d727d5b2a3%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C6
> 37021671089906922&amp;sdata=3D9RgT5DBeB0HL5RhP3pI%2FuOglIe8pY3wsp
> 2fPsnwO2iQ%3D&amp;reserved=3D0
