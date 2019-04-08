From: Flavio Suligoi <f.suligoi@asem.it>
Subject: RE: [PATCH 1/2] dt-bindings: rtc: add battery-low-hw-alarm property
Date: Mon, 8 Apr 2019 07:22:44 +0000
Message-ID: <58b8e1bc2b064abcb67db04369cf9c6e@asem.it>
References: <1554303165-24813-1-git-send-email-f.suligoi@asem.it>
 <5ca84214.1c69fb81.e3ace.21e5@mx.google.com>
 <20190406125550.GA7480@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190406125550.GA7480@piout.net>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>
Cc: Alessandro Zummo <a.zummo@towertech.it>, Mark Rutland <mark.rutland@arm.com>, "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

HI,

> On 06/04/2019 01:07:13-0500, Rob Herring wrote:
> > On Wed, Apr 03, 2019 at 04:52:44PM +0200, Flavio Suligoi wrote:
> > > Some RTC devices have a battery-low automatic detection circuit.
> > > The battery-low event is usually reported with:
> > >
> > > - a bit change in a RTC status register
> > > - a hw signaling (generally using an interrupt generation), changing
> > >   the hw level of a specific pin;
> > >
> > > The new property "battery-low-hw-alarm" enable the RTC to generate the
> > > hw signaling in case of battery-low event.
> > >
> > > Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
> > > ---
> > >  Documentation/devicetree/bindings/rtc/rtc.txt | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/rtc/rtc.txt
> b/Documentation/devicetree/bindings/rtc/rtc.txt
> > > index a97fc6a..f93a44d 100644
> > > --- a/Documentation/devicetree/bindings/rtc/rtc.txt
> > > +++ b/Documentation/devicetree/bindings/rtc/rtc.txt
> > > @@ -31,6 +31,9 @@ below.
> > >                              expressed in femto Farad (fF).
> > >                              The default value shall be listed (if
> optional),
> > >                              and likewise all valid values.
> > > +- battery-low-hw-alarm :    Enable the "battery-low" output pin. This
> function
> > > +                            is available on the following devices:
> > > +                            - pcf2127 - pin used for alarm: INTn
> >
> > Boolean? If there's cases where which pin is selectable, then we'd need
> > this to take a value. Not sure how likely that is?
> >
> 
> Indeed, there is at least the pcf85363 that has two possible pins for
> that interrupt. How would you select the pin then? a zero based index? a
> string?

I think the string could be clearer for the final user and would give
more freedom for future changes.
For example, we can call this property, instead of "battery-low-alarm" or 
"low-voltage-alarm", simply: "alarm-pin_1" and then the string argument 
can describe the function used; for example:

alarm-pin_1 = "backup-supply-low-voltage-alarm";
alarm-pin_2 = "......";

Flavio Suligoi
