From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH v3 4/5] pinctrl: mcp23s08: configure irq polarity using
 irq data
Date: Thu, 30 Nov 2017 15:50:53 +0000
Message-ID: <1ba1c850-dd22-fa98-66ea-fcb8527ec5ad@arm.com>
References: <1511252491-79952-1-git-send-email-preid@electromag.com.au>
 <1511252491-79952-5-git-send-email-preid@electromag.com.au>
 <20171121133434.tuvxtrrbabjk4zeg@earth>
 <c191a9d6-3ebb-e95b-7342-aa18598ddf2b@electromag.com.au>
 <20171121152142.zg3r57gl2kenjwgi@earth>
 <CACRpkdbkG_83-gpGqdMA5y3cpAvSbQ2X_xT07PC3+boxPeWbPQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdbkG_83-gpGqdMA5y3cpAvSbQ2X_xT07PC3+boxPeWbPQ@mail.gmail.com>
Content-Language: en-GB
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Sebastian Reichel <sre@kernel.org>
Cc: Phil Reid <preid@electromag.com.au>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-gpio@vger.kernel.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 30/11/17 14:21, Linus Walleij wrote:
> On Tue, Nov 21, 2017 at 4:21 PM, Sebastian Reichel <sre@kernel.org> wrote:
> 
>> IMHO the explicit line-inverter is a bit over-engineered and
>> implicit line-inverter is enough, but I'm fine with both solutions.
>> I think the DT binding maintainers should comment on this though,
>> since it's pretty much a core decision about interrupt specifiers.
> 
> I feel the same.
> 
> I am very much back and forth on the subject.
> 
> Simplicity of use vs modelling the system as it actually works.
> 
> Back and forth.
> 
> I honestly have just a very vague idea about this.
> 
> I don't know if Marc Z as irqchip maintainer has some idea
> on how to model inverters on irq lines or if he's seen some
> solutions to it out there.

So far, I've seen two types of solutions:
- One based on a stacked irqchip driver that implements the inverter on
the irq_set_type method
- One based on per-device vendor-specific properties in DT

While the first one is clearly a big hammer, it has the advantage of not
adding new stuff to the DT spec, and accurately describe the signal path
(see the mediatek stuff for reference).

The second one is just a hack, frankly. It just has the advantage of
being trivial to implement.

I'm clearly inclined to prefer the first solution. But maybe it is time
to invent a "generic inverter" driver that could be reusable, just like
we have a generic irqchip?

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
