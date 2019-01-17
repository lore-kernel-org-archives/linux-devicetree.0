From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: rtc: Add bindings for Cadence RTC
Date: Thu, 17 Jan 2019 13:08:42 +0100
Message-ID: <20190117120842.GB26715@piout.net>
References: <20190111151401.25047-1-jank@cadence.com>
 <20190111151401.25047-2-jank@cadence.com>
 <20190116210806.GA21535@bogus>
 <46BA7224-B229-4594-B039-8801A806657E@global.cadence.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <46BA7224-B229-4594-B039-8801A806657E@global.cadence.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jan Kotas <jank@cadence.com>
Cc: Rob Herring <robh@kernel.org>, "a.zummo@towertech.it" <a.zummo@towertech.it>, Mark Rutland <mark.rutland@arm.com>, "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 17/01/2019 10:46:50+0000, Jan Kotas wrote:
> 
> > On 16 Jan 2019, at 22:08, Rob Herring <robh@kernel.org> wrote:
> > 
> > 
> > On Fri, Jan 11, 2019 at 03:14:00PM +0000, Jan Kotas wrote:
> >> This patch adds a DT binding documentation for
> >> Cadence RTC controller.
> >> +Required properties:
> >> +- compatible: Should be "cdns,rtc-r109v3"
> >> +- reg: Specifies base physical address and size of the register area.
> >> +- interrupts: A single interrupt specifier.
> >> +- clocks: Must contain two entries:
> >> +	- pclk: APB registers clock
> >> +	- ref_clk: reference 1Hz of 100Hz clock, depending on IP configuration
> > 
> > 1Hz OR 100Hz?
> 
> Hi,
> 
> The IP has a configuration parameter at build time,
> which selects the reference clock frequency.
> 
> It cannot be changed later, and there’s no register which
> tells the software which option was selected.
> 
> In this version of the patch, both values are accepted.
> If it makes sense I can add a bool property, like
> refclock-100hz, which can be used to check the clock frequency.
> 

I guess what rob suggested was s/of/or/


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
