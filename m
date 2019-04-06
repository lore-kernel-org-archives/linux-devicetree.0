From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH 1/2] dt-bindings: rtc: add battery-low-hw-alarm property
Date: Sat, 6 Apr 2019 14:55:50 +0200
Message-ID: <20190406125550.GA7480@piout.net>
References: <1554303165-24813-1-git-send-email-f.suligoi@asem.it>
 <5ca84214.1c69fb81.e3ace.21e5@mx.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5ca84214.1c69fb81.e3ace.21e5@mx.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Flavio Suligoi <f.suligoi@asem.it>, Alessandro Zummo <a.zummo@towertech.it>, Mark Rutland <mark.rutland@arm.com>, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 06/04/2019 01:07:13-0500, Rob Herring wrote:
> On Wed, Apr 03, 2019 at 04:52:44PM +0200, Flavio Suligoi wrote:
> > Some RTC devices have a battery-low automatic detection circuit.
> > The battery-low event is usually reported with:
> > 
> > - a bit change in a RTC status register
> > - a hw signaling (generally using an interrupt generation), changing
> >   the hw level of a specific pin;
> > 
> > The new property "battery-low-hw-alarm" enable the RTC to generate the
> > hw signaling in case of battery-low event.
> > 
> > Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
> > ---
> >  Documentation/devicetree/bindings/rtc/rtc.txt | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/rtc/rtc.txt b/Documentation/devicetree/bindings/rtc/rtc.txt
> > index a97fc6a..f93a44d 100644
> > --- a/Documentation/devicetree/bindings/rtc/rtc.txt
> > +++ b/Documentation/devicetree/bindings/rtc/rtc.txt
> > @@ -31,6 +31,9 @@ below.
> >                              expressed in femto Farad (fF).
> >                              The default value shall be listed (if optional),
> >                              and likewise all valid values.
> > +- battery-low-hw-alarm :    Enable the "battery-low" output pin. This function
> > +                            is available on the following devices:
> > +                            - pcf2127 - pin used for alarm: INTn
> 
> Boolean? If there's cases where which pin is selectable, then we'd need 
> this to take a value. Not sure how likely that is?
> 

Indeed, there is at least the pcf85363 that has two possible pins for
that interrupt. How would you select the pin then? a zero based index? a
string?

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
