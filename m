From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH] genirq: fix trigger flags check for shared irqs
Date: Thu, 28 Jan 2016 21:06:20 +0100 (CET)
Message-ID: <alpine.DEB.2.11.1601282105150.3886@nanos>
References: <96c068ece0f5d01fc85bdbd9e0798f68180eebb8.1453204950.git.brian.starkey@arm.com> <alpine.DEB.2.11.1601262142450.3886@nanos> <20160128095955.GA12884@e106950-lin.cambridge.arm.com> <alpine.DEB.2.11.1601281116310.3886@nanos>
 <20160128111041.GB12884@e106950-lin.cambridge.arm.com> <alpine.DEB.2.11.1601281238110.3886@nanos> <CAL_JsqLTFu18a-Mj_XPZBpcFkD+R-uiK70yLnCT27np2YK6_ag@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqLTFu18a-Mj_XPZBpcFkD+R-uiK70yLnCT27np2YK6_ag@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Brian Starkey <brian.starkey@arm.com>, LKML <linux-kernel@vger.kernel.org>, Marc Zyngier <marc.zyngier@arm.com>, Tomasz Figa <tomasz.figa@gmail.com>, Frank Rowand <frowand.list@gmail.com>, Grant Likely <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, 28 Jan 2016, Rob Herring wrote:
> On Thu, Jan 28, 2016 at 5:49 AM, Thomas Gleixner <tglx@linutronix.de> wrote:
> > I've cc'ed the author and the device tree folks. Perhaps are they able to
> > explain what this commit tries to 'fix'.
> 
> It's certainly not clear what driver was being fixed. I think the
> intention was to provide the trigger flags from the DT to drivers in a
> standard, non-DT specific way. The implementation of it certainly
> seems convoluted. The usecase I can think of is drivers may need the
> trigger information for cases where the device can support different
> trigger modes/polarity. The DT says which trigger mode to use and the
> device and irqchip need to be programmed to match. IIRC, SMSC ethernet
> chips frequently used on ARM boards do this.

I can see that the driver wants this information, but why would one feed that
back into request_irq() when the interrupt was already configured by DT.

Still confused.

Thanks,

	tglx
