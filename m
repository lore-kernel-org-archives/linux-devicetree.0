From: Peter Chen <hzpeterchen@gmail.com>
Subject: Re: [PATCH v1 2/2] usb:cdns3 Add Cadence USB3 DRD Driver
Date: Wed, 12 Dec 2018 10:04:25 +0800
Message-ID: <CAL411-ryK2LLZVg5_sLkCYOuhwdHLVm5XavSyC9nbEXZah_43w@mail.gmail.com>
References: <1544445555-17325-1-git-send-email-pawell@cadence.com>
 <1544445555-17325-3-git-send-email-pawell@cadence.com> <87h8fkmfar.fsf@linux.intel.com>
 <BYAPR07MB47095110AF28CC11B4C9E144DDA60@BYAPR07MB4709.namprd07.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <BYAPR07MB47095110AF28CC11B4C9E144DDA60@BYAPR07MB4709.namprd07.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: pawell@cadence.com
Cc: balbi@kernel.org, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, rogerq@ti.com, lkml <linux-kernel@vger.kernel.org>, adouglas@cadence.com, jbergsagel@ti.com, nsekhar@ti.com, nm@ti.com, sureshp@cadence.com, peter.chen@nxp.com, pjez@cadence.com, kurahul@cadence.com
List-Id: devicetree@vger.kernel.org

> >> +            tmode = le16_to_cpu(ctrl->wIndex);
> >> +
> >> +            if (!set || (tmode & 0xff) != 0)
> >> +                    return -EINVAL;
> >> +
> >> +            switch (tmode >> 8) {
> >> +            case TEST_J:
> >> +            case TEST_K:
> >> +            case TEST_SE0_NAK:
> >> +            case TEST_PACKET:
> >> +                    cdns3_set_register_bit(&priv_dev->regs->usb_cmd,
> >> +                                           USB_CMD_STMODE |
> >> +                                           USB_STS_TMODE_SEL(tmode - 1));
> >
> >I'm 90% sure this won't work. There's a reason why we only enter the
> >requested test mode from status stage. How have you tested this?
>

What's the reason?
It can work although the code is a little different with above, I
tested it using USBxHSETT tool at Windows.

> From USB spec:
> "The transition to test mode must be complete no later than 3 ms after the completion of the status stage of the
> request."
> But I don't remember any issues with this test on other ours drivers. Maybe status stage
> is armed in this case by controller. I have to confirm how it works with hardware team.
> Driver doesn't know when status stage was completed. We don't have
> any event on status stage completion.  I haven't checked it yet with tester on this driver.
>

> >> +    irqreturn_t ret = IRQ_NONE;
> >> +    unsigned long flags;
> >> +    u32 reg;
> >> +
> >> +    priv_dev = cdns->gadget_dev;
> >> +    spin_lock_irqsave(&priv_dev->lock, flags);
> >
> >you're already running in hardirq context. Why do you need this lock at
> >all? I would be better to use the hardirq handler to mask your
> >interrupts, so they don't fire again, then used the top-half (softirq)
> >handler to actually handle the interrupts.
>

This controller may be ran at SMP environment, register and flag access
needs to be protected among CPUs running.

> Yes, spin_lock_irqsave is not necessary here.
>
> Do you mean replacing devm_request_irq with a request_threaded_irq ?
> I have single interrupt line shared between  Host, Driver, DRD/OTG.
> I'm not sure if it will work more efficiently.
>
> >
> >> +    /* check USB device interrupt */
> >> +    reg = readl(&priv_dev->regs->usb_ists);
> >> +    writel(reg, &priv_dev->regs->usb_ists);
> >> +
> >> +    if (reg) {
> >> +            dev_dbg(priv_dev->dev, "IRQ: usb_ists: %08X\n", reg);
> >
> >I strongly advise against using dev_dbg() for debugging. Even more so
> >inside your IRQ handler.

Felipe, I use Dynamic Debug for debugging, and show debug messages with
"dmesg" after testing/debugging. I see dwc3 using trace,  any benefits
for switching
to trace?

> Ok, It's not necessary in this place, especially, that there is invoked trace point
> inside cdns3_check_usb_interrupt_proceed which makes the same.
>

Peter
