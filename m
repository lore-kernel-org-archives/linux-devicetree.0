From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH v3] dt-bindings: arm: Convert Atmel board/soc bindings to
 json-schema
Date: Thu, 20 Jun 2019 11:14:41 +0200
Message-ID: <20190620091441.GW23549@piout.net>
References: <20190517153911.19545-1-robh@kernel.org>
 <20190601214050.GG3558@piout.net>
 <20190613224652.GB5119@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190613224652.GB5119@bogus>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 13/06/2019 16:46:52-0600, Rob Herring wrote:
> On Sat, Jun 01, 2019 at 11:40:50PM +0200, Alexandre Belloni wrote:
> > On 17/05/2019 10:39:11-0500, Rob Herring wrote:
> > > Convert Atmel SoC bindings to DT schema format using json-schema.
> > > 
> > > Cc: Mark Rutland <mark.rutland@arm.com>
> > > Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
> > > Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > > Cc: devicetree@vger.kernel.org
> > > Cc: linux-arm-kernel@lists.infradead.org
> > > Signed-off-by: Rob Herring <robh@kernel.org>
> > Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> 
> Is someone going to apply this?
> 

I applied it now, I had to fix the missing sam9x60 though.

> Rob

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
