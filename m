From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [EXT] Re: [1/3] rtc/fsl: support flextimer for lx2160a
Date: Mon, 26 Aug 2019 12:10:18 +0200
Message-ID: <20190826101018.GC21713@piout.net>
References: <20190823095740.12280-1-biwen.li@nxp.com>
 <1566579388.5029.8.camel@impinj.com>
 <DB7PR04MB4490B7AD75C6EE49F5208F738FA10@DB7PR04MB4490.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <DB7PR04MB4490B7AD75C6EE49F5208F738FA10@DB7PR04MB4490.eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Biwen Li <biwen.li@nxp.com>
Cc: Trent Piepho <tpiepho@impinj.com>, Leo Li <leoyang.li@nxp.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "a.zummo@towertech.it" <a.zummo@towertech.it>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 26/08/2019 03:37:43+0000, Biwen Li wrote:
> > 
> > On Fri, 2019-08-23 at 17:57 +0800, Biwen Li wrote:
> > > The patch supports flextimer for lx2160a
> > >
> > > Signed-off-by: Biwen Li <biwen.li@nxp.com>
> > > ---
> > >  drivers/rtc/rtc-fsl-ftm-alarm.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/drivers/rtc/rtc-fsl-ftm-alarm.c b/drivers/rtc/rtc-fsl-
> > > ftm-alarm.c index 4f7259c2d6a3..2b81525f6db8 100644
> > > --- a/drivers/rtc/rtc-fsl-ftm-alarm.c
> > > +++ b/drivers/rtc/rtc-fsl-ftm-alarm.c
> > > @@ -313,6 +313,7 @@ static const struct of_device_id ftm_rtc_match[] =
> > > {
> > >       { .compatible = "fsl,ls1088a-ftm-alarm", },
> > >       { .compatible = "fsl,ls208xa-ftm-alarm", },
> > >       { .compatible = "fsl,ls1028a-ftm-alarm", },
> > > +     { .compatible = "fsl,lx2160a-ftm-alarm", },
> > >       { },
> > >  };
> > >
> > 
> > Since there's no data associated with each compatible, it doesn't seem like
> > there's any need to add a new one.
> > 
> > What's normally done is add two compatibles in the dts, the base version and
> > the specific version, e.g.:
> > 
> > +               rcpm: rcpm@1e34040 {
> > +                       compatible = "fsl,lx2160a-rcpm",
> > + "fsl,qoriq-cpm-2.1+";
> > 
> > Or in this case, compatible = "fsl,lx2160a-ftm-alarm", "fsl,ls1088a-ftm-alarm";
> > 
> > Then there's no need to add to the driver list.
> Yes, it will be work. But it will be confusing. Is ls1088a same with lx2160a? No.

Well, if you are sure it is the exact same IP that is used, then you
should only use one compatible. We usually use the name of the first SoC
that had the IP. Is it confusing anyone? Probably not because this will
be in a dtsi that nobody will read.

Note that adding so many compatbile will increase the boot time of your
platform and this is annoying many NXP customers of the i.mx line.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
