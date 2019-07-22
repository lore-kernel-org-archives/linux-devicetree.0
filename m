From: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH v2 6/7] dt-bindings: net: realtek: Add property to
 configure LED mode
Date: Mon, 22 Jul 2019 10:14:18 -0700
Message-ID: <20190722171418.GV250418@google.com>
References: <20190703193724.246854-1-mka@chromium.org>
 <20190703193724.246854-6-mka@chromium.org>
 <e8fe7baf-e4e0-c713-7b93-07a3859c33c6@gmail.com>
 <20190703232331.GL250418@google.com>
 <CAL_JsqL_AU+JV0c2mNbXiPh2pvfYbPbLV-2PHHX0hC3vUH4QWg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqL_AU+JV0c2mNbXiPh2pvfYbPbLV-2PHHX0hC3vUH4QWg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>, "David S . Miller" <davem@davemloft.net>, Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, netdev <netdev@vger.kernel.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Douglas Anderson <dianders@chromium.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 10, 2019 at 09:55:12AM -0600, Rob Herring wrote:
> On Wed, Jul 3, 2019 at 5:23 PM Matthias Kaehlcke <mka@chromium.org> wrote:
> >
> > Hi Florian,
> >
> > On Wed, Jul 03, 2019 at 02:37:47PM -0700, Florian Fainelli wrote:
> > > On 7/3/19 12:37 PM, Matthias Kaehlcke wrote:
> > > > The LED behavior of some Realtek PHYs is configurable. Add the
> > > > property 'realtek,led-modes' to specify the configuration of the
> > > > LEDs.
> > > >
> > > > Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> > > > ---
> > > > Changes in v2:
> > > > - patch added to the series
> > > > ---
> > > >  .../devicetree/bindings/net/realtek.txt         |  9 +++++++++
> > > >  include/dt-bindings/net/realtek.h               | 17 +++++++++++++++++
> > > >  2 files changed, 26 insertions(+)
> > > >  create mode 100644 include/dt-bindings/net/realtek.h
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/net/realtek.txt b/Documentation/devicetree/bindings/net/realtek.txt
> > > > index 71d386c78269..40b0d6f9ee21 100644
> > > > --- a/Documentation/devicetree/bindings/net/realtek.txt
> > > > +++ b/Documentation/devicetree/bindings/net/realtek.txt
> > > > @@ -9,6 +9,12 @@ Optional properties:
> > > >
> > > >     SSC is only available on some Realtek PHYs (e.g. RTL8211E).
> > > >
> > > > +- realtek,led-modes: LED mode configuration.
> > > > +
> > > > +   A 0..3 element vector, with each element configuring the operating
> > > > +   mode of an LED. Omitted LEDs are turned off. Allowed values are
> > > > +   defined in "include/dt-bindings/net/realtek.h".
> > >
> > > This should probably be made more general and we should define LED modes
> > > that makes sense regardless of the PHY device, introduce a set of
> > > generic functions for validating and then add new function pointer for
> > > setting the LED configuration to the PHY driver. This would allow to be
> > > more future proof where each PHY driver could expose standard LEDs class
> > > devices to user-space, and it would also allow facilities like: ethtool
> > > -p to plug into that.
> > >
> > > Right now, each driver invents its own way of configuring LEDs, that
> > > does not scale, and there is not really a good reason for that other
> > > than reviewing drivers in isolation and therefore making it harder to
> > > extract the commonality. Yes, I realize that since you are the latest
> > > person submitting something in that area, you are being selected :)
> 
> I agree.
> 
> > I see the merit of your proposal to come up with a generic mechanism
> > to configure Ethernet LEDs, however I can't justify spending much of
> > my work time on this. If it is deemed useful I'm happy to send another
> > version of the current patchset that addresses the reviewer's comments,
> > but if the implementation of a generic LED configuration interface is
> > a requirement I will have to abandon at least the LED configuration
> > part of this series.
> 
> Can you at least define a common binding for this. Maybe that's just
> removing 'realtek'. While the kernel side can evolve to a common
> infrastructure, the DT bindings can't.

I'm working on a generic binding.

I wonder what is the best process for reviewing/landing it, I'm
doubting between two options:

a) only post the binding doc and the generic PHY code that reads
   the configuration from the DT. Post Realtek patches once
   the binding/generic code has been acked.

   pros: no churn from Realtek specific patches
   cons: initially no (real) user of the new binding

b) post generic and Realtek changes together

   pros: the binding has a user initially
   cons: churn from Realtek specific patches

I can do either, depending on what maintainers/reviewers prefer. I'm
slightly inclined towards a)
