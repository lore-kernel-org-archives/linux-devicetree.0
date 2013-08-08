From: Jonas Jensen <jonas.jensen@gmail.com>
Subject: Re: [PATCH] Documentation: Add device tree binding file for MOXA ART
 SoCs interrupt controller
Date: Thu, 8 Aug 2013 08:50:07 +0200
Message-ID: <CACmBeS0wbCSU+3DJwtyN5CuX8GDCNWJxeiDq8YUrfTL8DwU_1w@mail.gmail.com>
References: <1374137426-6763-1-git-send-email-jonas.jensen@gmail.com>
	<20130802093559.GB2884@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130802093559.GB2884@e106331-lin.cambridge.arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "arm@kernel.org" <arm@kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Mark,

On 2 August 2013 11:35, Mark Rutland <mark.rutland@arm.com> wrote:
>>     The MOXA ART irqchip driver was added without accompanying devicetree document.
>>     ( in next-20130716   drivers/irqchip/irq-moxart.c )
>
> Aaargh. That should not have happened >:(

Sorry about this, my plan was to submit all documents along with
moxart platform support. At the time I did not know it is more normal
to push the binding along with the driver.

>> +- interrupt-mask: Specifies if the interrupt is edge or level-triggered
>> +  each bit represent an interrupt 0-31 where 1 signify edge
>
> For the GIC, this gets descrbied in the interrupt sepcifier rather than
> on the interrupt controller's root node. Is there a reason to do this
> differently here?

The reason is, IRQ types must be written to the controller as two u32
registers (IRQ_MODE_REG and IRQ_LEVEL_REG). I could not find an easier
way (that uses generic things) to do it.

It's true that "interrupt-mask" is redundant, DT "interrupts" hold the
same information. I just never found nice way to collect it from DT.

See registers written on line 111:
http://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/tree/drivers/irqchip/irq-moxart.c#n111


Best regards,
Jonas
