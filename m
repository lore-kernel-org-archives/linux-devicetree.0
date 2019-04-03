From: Flavio Suligoi <f.suligoi@asem.it>
Subject: RE: [PATCH 1/2] dt-bindings: rtc: add battery-low-hw-alarm property
Date: Wed, 3 Apr 2019 15:32:31 +0000
Message-ID: <f1462ff647f54a04a7009a64359f9f3e@asem.it>
References: <1554303165-24813-1-git-send-email-f.suligoi@asem.it>
 <20190403145709.GN22216@piout.net> <b45fc9a86a0d4126ad6d8dda9c883043@asem.it>
 <20190403152856.GP22216@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190403152856.GP22216@piout.net>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,


> On 03/04/2019 15:06:17+0000, Flavio Suligoi wrote:
> > Hi Alexandre,
> >
> > > Hi,
> > >
> > > On 03/04/2019 16:52:44+0200, Flavio Suligoi wrote:
> > > > Some RTC devices have a battery-low automatic detection circuit.
> > > > The battery-low event is usually reported with:
> > > >
> > > > - a bit change in a RTC status register
> > > > - a hw signaling (generally using an interrupt generation), changing
> > > >   the hw level of a specific pin;
> > > >
> > > > The new property "battery-low-hw-alarm" enable the RTC to generate
> the
> > > > hw signaling in case of battery-low event.
> > > >
> > > > Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
> > > > ---
> > > >  Documentation/devicetree/bindings/rtc/rtc.txt | 3 +++
> > > >  1 file changed, 3 insertions(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/rtc/rtc.txt
> > > b/Documentation/devicetree/bindings/rtc/rtc.txt
> > > > index a97fc6a..f93a44d 100644
> > > > --- a/Documentation/devicetree/bindings/rtc/rtc.txt
> > > > +++ b/Documentation/devicetree/bindings/rtc/rtc.txt
> > > > @@ -31,6 +31,9 @@ below.
> > > >                              expressed in femto Farad (fF).
> > > >                              The default value shall be listed (if
> > > optional),
> > > >                              and likewise all valid values.
> > > > +- battery-low-hw-alarm :    Enable the "battery-low" output pin.
> This
> > > function
> > >
> > > I would name that voltage-low-alarm as not all the secondary voltages
> > > are batteries.
> >
> > You have right. So we can also name the property a: "voltage-low-hw-
> alarm".
> > I prefer to have the word "hw" in the property name, since the "sw"
> voltage
> > low alarm is already present is some RTC drivers.
> > In this way, with the word "hw", is more clear that we are speaking
> about
> > an hw pin signaling.
> >
> 
> Well, the device tree always describes the hardware so there is no point
> in specifying hw.

Right, so I rename the property in "voltage-low-alarm"

> 
> 
> --
> Alexandre Belloni, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

Flavio Suligoi
