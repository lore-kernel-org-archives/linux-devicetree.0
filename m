From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 4/7] dt-bindings: pinctrl: mcp23s08: add documentation
 for irq-open-drain
Date: Wed, 11 Oct 2017 10:15:48 +0200
Message-ID: <CACRpkdb3dY_dC6czMY3ScmOV2aKQjs-073L_GFPUSQ3sc63ymA@mail.gmail.com>
References: <1507266491-73971-1-git-send-email-preid@electromag.com.au> <1507266491-73971-5-git-send-email-preid@electromag.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1507266491-73971-5-git-send-email-preid-qgqNFa1JUf/o2iN0hyhwsIdd74u8MsAO@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Phil Reid <preid-qgqNFa1JUf/o2iN0hyhwsIdd74u8MsAO@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Lars Poeschel <poeschel-Xtl8qvBWbHwb1SvskN2V4Q@public.gmane.org>, Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

So I applied patches to this point.

On Fri, Oct 6, 2017 at 7:08 AM, Phil Reid <preid-qgqNFa1JUf/o2iN0hyhwsIdd74u8MsAO@public.gmane.org> wrote:

> This flag set the mcp23s08 device series irq type to open drain active low.
>
> Signed-off-by: Phil Reid <preid-qgqNFa1JUf/o2iN0hyhwsIdd74u8MsAO@public.gmane.org>
> ---
(...)
>  - microchip,irq-active-high: Sets the INTPOL flag in the IOCON register. This
>          configures the IRQ output polarity as active high.
> +- microchip,irq-open-drain: Sets the ODR flag in the IOCON register. This
> +        configures the IRQ output as open drain active low.

I have cold feet on these two.

I do not think either of these flags should be there or even be
used.

It is a bit tricky wrt device tree because it is Linuxisms, but I hope
the DT maintainers know what is applicable also for other
operating systems.

So the MCP23xxx outputs an IRQ. Someone, somewhere, is using
this IRQ.

If that *user* needs to have the IRQ fireing active high or set as
open drain (because there are more clients on the line) then
it needs this set up.

Look at this code from drivers/iio/gyro/mpu3050-core.c:

        /* Check if IRQ is open drain */
        if (of_property_read_bool(mpu3050->dev->of_node, "drive-open-drain"))
                mpu3050->irq_opendrain = true;

        irq_trig = irqd_get_trigger_type(irq_get_irq_data(irq));
        /*
         * Configure the interrupt generator hardware to supply whatever
         * the interrupt is configured for, edges low/high level low/high,
         * we can provide it all.
         */
        switch (irq_trig) {
        case IRQF_TRIGGER_RISING:
                dev_info(&indio_dev->dev,
                         "pulse interrupts on the rising edge\n");
                break;
        case IRQF_TRIGGER_FALLING:
                mpu3050->irq_actl = true;
                dev_info(&indio_dev->dev,
                         "pulse interrupts on the falling edge\n");
                break;
        case IRQF_TRIGGER_HIGH:
                mpu3050->irq_latch = true;
                dev_info(&indio_dev->dev,
                         "interrupts active high level\n");
                /*
                 * With level IRQs, we mask the IRQ until it is processed,
                 * but with edge IRQs (pulses) we can queue several interrupts
                 * in the top half.
                 */
                irq_trig |= IRQF_ONESHOT;
                break;
        case IRQF_TRIGGER_LOW:
                mpu3050->irq_latch = true;
                mpu3050->irq_actl = true;
                irq_trig |= IRQF_ONESHOT;
                dev_info(&indio_dev->dev,
                         "interrupts active low level\n");
                break;
        default:
                /* This is the most preferred mode, if possible */
                dev_err(&indio_dev->dev,
                        "unsupported IRQ trigger specified (%lx), enforce "
                        "rising edge\n", irq_trig);
                irq_trig = IRQF_TRIGGER_RISING;
                break;
        }

        /* An open drain line can be shared with several devices */
        if (mpu3050->irq_opendrain)
                irq_trig |= IRQF_SHARED;

        ret = request_threaded_irq(irq,
                                   mpu3050_irq_handler,
                                   mpu3050_irq_thread,
                                   irq_trig,
                                   mpu3050->trig->name,
                                   mpu3050->trig);
        if (ret) {
                dev_err(mpu3050->dev,
                        "can't get IRQ %d, error %d\n", irq, ret);
                return ret;
        }

Notice that the IIO gyro here is also a *producer* of IRQs sending
then to some *consumer* such as a GPIO pin or dedicated IRQ
in on a SoC.

Lessons learned:

1) Use the standard binding "drive-open-drain" for this, not any
  mcp,* custom namespaced things.

2) WRT active high: please deprecate that flag, and ignore it
  completely in the driver or at least print a warning. Instead look
  up the trigger type from the irq descriptor just like the MPU3050
  IIO driver does.

The information is already inside the kernel, from the consumer
side. The reciever states what kind of interrupt it wants.

It is fair to add a flag for open drain (with the standard binding), as the
IRQ subsystem has no idea about such things, but with that comes the
inevitable consequence of requesting a shared IRQ.

I will check if I can anyways apply some more patches not related
to this.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
