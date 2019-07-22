From: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH v2 6/7] dt-bindings: net: realtek: Add property to
 configure LED mode
Date: Mon, 22 Jul 2019 12:14:11 -0700
Message-ID: <20190722191411.GW250418@google.com>
References: <20190703193724.246854-1-mka@chromium.org>
 <20190703193724.246854-6-mka@chromium.org>
 <e8fe7baf-e4e0-c713-7b93-07a3859c33c6@gmail.com>
 <20190703232331.GL250418@google.com>
 <CAL_JsqL_AU+JV0c2mNbXiPh2pvfYbPbLV-2PHHX0hC3vUH4QWg@mail.gmail.com>
 <20190722171418.GV250418@google.com>
 <20190722190133.GF8972@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190722190133.GF8972@lunn.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: Rob Herring <robh+dt@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, "David S . Miller" <davem@davemloft.net>, Mark Rutland <mark.rutland@arm.com>, Heiner Kallweit <hkallweit1@gmail.com>, netdev <netdev@vger.kernel.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Douglas Anderson <dianders@chromium.org>
List-Id: devicetree@vger.kernel.org

Hi Andrew,

On Mon, Jul 22, 2019 at 09:01:33PM +0200, Andrew Lunn wrote:
> On Mon, Jul 22, 2019 at 10:14:18AM -0700, Matthias Kaehlcke wrote:
> > I'm working on a generic binding.
> > 
> > I wonder what is the best process for reviewing/landing it, I'm
> > doubting between two options:
> > 
> > a) only post the binding doc and the generic PHY code that reads
> >    the configuration from the DT. Post Realtek patches once
> >    the binding/generic code has been acked.
> > 
> >    pros: no churn from Realtek specific patches
> >    cons: initially no (real) user of the new binding
> > 
> > b) post generic and Realtek changes together
> > 
> >    pros: the binding has a user initially
> >    cons: churn from Realtek specific patches
> > 
> > I can do either, depending on what maintainers/reviewers prefer. I'm
> > slightly inclined towards a)
> 
> Hi Matthias
> 
> It is normal to include one user of any generic API which is added,
> just to make is clear how an API should be used.

as of now it isn't even an API, the phy_device populates a new array
in its struct with the values from the DT. PHY drivers access the
array directly. Is it still preferable to post everything together?

(maybe I'm too concerned about 'noise' from the driver patches while
 we are figuring out what exactly the binding should be).

Thanks

Matthias
