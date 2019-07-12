From: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH v2 6/7] dt-bindings: net: realtek: Add property to
 configure LED mode
Date: Fri, 12 Jul 2019 10:28:27 -0700
Message-ID: <20190712172827.GR250418@google.com>
References: <20190703193724.246854-1-mka@chromium.org>
 <20190703193724.246854-6-mka@chromium.org>
 <e8fe7baf-e4e0-c713-7b93-07a3859c33c6@gmail.com>
 <20190703232331.GL250418@google.com>
 <CAL_JsqL_AU+JV0c2mNbXiPh2pvfYbPbLV-2PHHX0hC3vUH4QWg@mail.gmail.com>
 <7d102d81-750d-32d9-a554-95f018e69f2f@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <7d102d81-750d-32d9-a554-95f018e69f2f@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, "David S . Miller" <davem@davemloft.net>, Mark Rutland <mark.rutland@arm.com>, netdev <netdev@vger.kernel.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Douglas Anderson <dianders@chromium.org>
List-Id: devicetree@vger.kernel.org

Hi Florian,

On Wed, Jul 10, 2019 at 09:28:39AM -0700, Florian Fainelli wrote:
> On 7/10/19 8:55 AM, Rob Herring wrote:
> > On Wed, Jul 3, 2019 at 5:23 PM Matthias Kaehlcke <mka@chromium.org> wrote:
> >>
> >> Hi Florian,
> >>
> >> On Wed, Jul 03, 2019 at 02:37:47PM -0700, Florian Fainelli wrote:
> >>> On 7/3/19 12:37 PM, Matthias Kaehlcke wrote:
> >>>> The LED behavior of some Realtek PHYs is configurable. Add the
> >>>> property 'realtek,led-modes' to specify the configuration of the
> >>>> LEDs.
> >>>>
> >>>> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> >>>> ---
> >>>> Changes in v2:
> >>>> - patch added to the series
> >>>> ---
> >>>>  .../devicetree/bindings/net/realtek.txt         |  9 +++++++++
> >>>>  include/dt-bindings/net/realtek.h               | 17 +++++++++++++++++
> >>>>  2 files changed, 26 insertions(+)
> >>>>  create mode 100644 include/dt-bindings/net/realtek.h
> >>>>
> >>>> diff --git a/Documentation/devicetree/bindings/net/realtek.txt b/Documentation/devicetree/bindings/net/realtek.txt
> >>>> index 71d386c78269..40b0d6f9ee21 100644
> >>>> --- a/Documentation/devicetree/bindings/net/realtek.txt
> >>>> +++ b/Documentation/devicetree/bindings/net/realtek.txt
> >>>> @@ -9,6 +9,12 @@ Optional properties:
> >>>>
> >>>>     SSC is only available on some Realtek PHYs (e.g. RTL8211E).
> >>>>
> >>>> +- realtek,led-modes: LED mode configuration.
> >>>> +
> >>>> +   A 0..3 element vector, with each element configuring the operating
> >>>> +   mode of an LED. Omitted LEDs are turned off. Allowed values are
> >>>> +   defined in "include/dt-bindings/net/realtek.h".
> >>>
> >>> This should probably be made more general and we should define LED modes
> >>> that makes sense regardless of the PHY device, introduce a set of
> >>> generic functions for validating and then add new function pointer for
> >>> setting the LED configuration to the PHY driver. This would allow to be
> >>> more future proof where each PHY driver could expose standard LEDs class
> >>> devices to user-space, and it would also allow facilities like: ethtool
> >>> -p to plug into that.
> >>>
> >>> Right now, each driver invents its own way of configuring LEDs, that
> >>> does not scale, and there is not really a good reason for that other
> >>> than reviewing drivers in isolation and therefore making it harder to
> >>> extract the commonality. Yes, I realize that since you are the latest
> >>> person submitting something in that area, you are being selected :)
> > 
> > I agree.
> > 
> >> I see the merit of your proposal to come up with a generic mechanism
> >> to configure Ethernet LEDs, however I can't justify spending much of
> >> my work time on this. If it is deemed useful I'm happy to send another
> >> version of the current patchset that addresses the reviewer's comments,
> >> but if the implementation of a generic LED configuration interface is
> >> a requirement I will have to abandon at least the LED configuration
> >> part of this series.
> > 
> > Can you at least define a common binding for this. Maybe that's just
> > removing 'realtek'. While the kernel side can evolve to a common
> > infrastructure, the DT bindings can't.
> 
> That would be a great start, and that is actually what I had in mind
> (should have been more specific), I was not going to have you Matthias
> do the grand slam and convert all this LED configuration into the LEDs
> class etc. that would not be fair.
> 
> It seems to be that we can fairly easily agree on a common binding for
> LED configuration, I would define something along those lines to be
> flexible:
> 
> phy-led-configuration = <LED_NUM_MASK LED_CFG_MASK>;
> 
> where LED_NUM_MASK is one of:
> 
> 0 -> link
> 1 -> activity
> 2 -> speed

I don't understand this proposal completely. Is LED_NUM_MASK actually
a mask/set (potentially containing multiple LEDs) or is it "one of"
the LEDs?

Are you suggesting to assign each LED a specific role (link, activity,
speed)?

Could you maybe post a specific example involving multiple LEDs?

Thanks

Matthias

> that way you can define single/dual/triple LED configurations by
> updating the bitmask.
> 
> LED_CFG_MASK is one of:
> 
> 0 -> LED_CFG_10
> 1 -> LED_CFG_100
> 2 -> LED_CFG_1000
> 
> (let's assume 1Gbps or less for now)
> 
> or this can be combined in a single cell with a left shift.
> 
> Andrew, Heiner, do you see that approach working correctly and scaling
> appropriately?
