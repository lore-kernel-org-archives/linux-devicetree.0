From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [EXT] Re: [v5,2/2] Documentation: dt: binding: rtc: add binding
 for ftm alarm driver
Date: Wed, 17 Jul 2019 19:54:38 -0600
Message-ID: <CAL_JsqKdsZQFtn+Bd2rZFKgZN5pgcsgXZz-Cy0qAt=8ycT0VHA@mail.gmail.com>
References: <20190716101655.47418-1-biwen.li@nxp.com> <20190716101655.47418-2-biwen.li@nxp.com>
 <CAL_Jsq+U=W_51qUDvOMPgexMOLuqTyYua5H6G-cwFnKCh8YmPg@mail.gmail.com> <DB7PR04MB44902483232D323AF611D6298FC90@DB7PR04MB4490.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <DB7PR04MB44902483232D323AF611D6298FC90@DB7PR04MB4490.eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Biwen Li <biwen.li@nxp.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Leo Li <leoyang.li@nxp.com>, "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" <linux-rtc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Xiaobo Xie <xiaobo.xie@nxp.com>, Jiafei Pan <jiafei.pan@nxp.com>, Ran Wang <ran.wang_1@nxp.com>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 17, 2019 at 4:05 AM Biwen Li <biwen.li@nxp.com> wrote:
>
> >
> > Caution: EXT Email
> >
> > On Tue, Jul 16, 2019 at 4:26 AM Biwen Li <biwen.li@nxp.com> wrote:
> > >
> > > The patch adds binding for ftm alarm driver
> >
> > Bindings are for h/w, not drivers...
> >
> > 'dt-bindings: rtc: ...' for the subject prefix.
> I will correct it in v6.
> >
> > >
> > > Signed-off-by: Biwen Li <biwen.li@nxp.com>
> > > ---
> > > Change in v5:
> > >     - None
> > >
> > > Change in v4:
> > >     - add note about dts and kernel options
> > >     - add aliases in example
> > >
> > > Change in v3:
> > >         - remove reg-names property
> > >         - correct cells number
> > >
> > > Change in v2:
> > >         - replace ls1043a with ls1088a as example
> > >         - add rcpm node and fsl,rcpm-wakeup property
> > >
> > >
> > >  .../bindings/rtc/rtc-fsl-ftm-alarm.txt        | 49 +++++++++++++++++++
> > >  1 file changed, 49 insertions(+)
> > >  create mode 100644
> > > Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-alarm.txt
> > >
> > > diff --git
> > > a/Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-alarm.txt
> > > b/Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-alarm.txt
> > > new file mode 100644
> > > index 000000000000..fb018065406c
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-alarm.txt
> > > @@ -0,0 +1,49 @@
> > > +Freescale FlexTimer Module (FTM) Alarm
> > > +
> > > +Note:
> > > +- The driver depends on RCPM driver
> > > +  to wake up system in sleep.
> > > +- Need stop using RTC_HCTOSYS or use the DT aliases
> > > +  to ensure the driver is not used as the primary RTC.
> > > +  (Select DT aliases defaultly)
> >
> > This is Linux specific and not relevant to the binding.
> Ok, I will remove all of the Note in v6.
> >
> > > +
> > > +Required properties:
> > > +- compatible : Should be "fsl,<chip>-ftm-alarm", the
> > > +              supported chips include
> > > +              "fsl,ls1012a-ftm-alarm"
> > > +              "fsl,ls1021a-ftm-alarm"
> > > +              "fsl,ls1028a-ftm-alarm"
> > > +              "fsl,ls1043a-ftm-alarm"
> > > +              "fsl,ls1046a-ftm-alarm"
> > > +              "fsl,ls1088a-ftm-alarm"
> > > +              "fsl,ls208xa-ftm-alarm"
> > > +- reg : Specifies base physical address and size of the register sets
> > > +for the
> > > +  FlexTimer Module and base physical address of IP Powerdown
> > > +Exception Control
> > > +  Register.
> > > +- interrupts : Should be the FlexTimer Module interrupt.
> > > +- fsl,rcpm-wakeup property and rcpm node : Please refer
> > > +       Documentation/devicetree/bindings/soc/fsl/rcpm.txt
> > > +
> > > +Optional properties:
> > > +- big-endian: If the host controller is big-endian mode, specify this property.
> > > +  The default endian mode is little-endian.
> > > +
> > > +Example:
> > > +aliases {
> > > +       ...
> > > +       rtc1 = ftm_alarm0; /* Use flextimer alarm driver as /dev/rtc1 */
> > > +       ...
> > > +};
> >
> > Drop the aliases part. It's not going to work when this is converted to DT schema
> > and the comment is Linux specific.
> Sorry,I can't drop the aliases part. If any user uses the alarm driver as rtc0,
> the user will get wrong time from /dev/rtc0.It is very important.

I just mean don't put it in the example. You can use it in your dts file.
