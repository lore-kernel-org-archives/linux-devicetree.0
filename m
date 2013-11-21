From: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Subject: Re: [PATCH] irqchip: versatile FPGA: support cascaded interrupts
 from DT
Date: Thu, 21 Nov 2013 22:27:18 +0100 (CET)
Message-ID: <alpine.DEB.2.02.1311212226280.30673@ionos.tec.linutronix.de>
References: <1380893106-7550-1-git-send-email-linus.walleij@linaro.org> <CACRpkda6XcEA3xri116q=U26Cm3BeMWv4Us40FCyxGj3o+DAFw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkda6XcEA3xri116q=U26Cm3BeMWv4Us40FCyxGj3o+DAFw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Linus

On Thu, 21 Nov 2013, Linus Walleij wrote:

> On Fri, Oct 4, 2013 at 3:25 PM, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> 
> > The Versatile FPGA interrupt controller supports cascading interrupts,
> > i.e. that its output is connected to the input of another interrupt
> > controller. This makes it possible to pass a parent interrupt from
> > the device tree and print it in the boot log if applicable.
> >
> > Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
> > Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > ---
> > TGLX: I can take this through ARM SoC if you're happy with it
> > and prefer it that way, but it merges just as fine as it is on
> > the IRQ tree.
> 
> Ping on this!

by all means, I can't find the original patch anywhere in my mail
folders. Can you bounce it to me please?

Thanks,

	tglx
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
