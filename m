From: Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V4 08/16] irqchip: Add new driver for BCM7038-style level
 1 interrupt controllers
Date: Mon, 1 Dec 2014 09:39:26 -0800
Message-ID: <CAJiQ=7D631F1wkegeKup7yeB-wgjKLjvD3V1-n8fu3aW=fOm0g@mail.gmail.com>
References: <1417149142-3756-1-git-send-email-cernekee@gmail.com>
 <1417149142-3756-9-git-send-email-cernekee@gmail.com> <CAOiHx=nb4Ub_bseHUrz+HrnJxDEKMijQ=r+ASZ-p5MtTi81Big@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOiHx=nb4Ub_bseHUrz+HrnJxDEKMijQ=r+ASZ-p5MtTi81Big-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Cc: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Fraser <jfraser-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Dmitry Torokhov <dtor-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, MIPS Mailing List <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Dec 1, 2014 at 8:09 AM, Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org> wrote:
> I'm not that firm in interrupt controller terminology, but can this be
> a level 1 interrupt controller if it has a parent interrupt
> controller? Isn't the parent the level 1 interrupt controller? Or
> would the parent then be a level 0 interrupt controller? ;-)

According to the register manual, this is an L1 controller and the
"IRQ0" controller handled by irq-bcm7120-l2.c is an L2 controller.

This terminology is used consistently across the MIPS and ARM STB
chips, but it is worth noting that MIPS has a builtin "L0 controller"
(not a published term) to demux the 5 HW IRQ lines, while ARM only
uses a single IRQ input for peripherals.  On STB MIPS platforms it is
typical to only use one HW IRQ input per CPU (TP).

Also note that brcm,bcm3384-l2-intc can either be used for an L1
(PERIPH INT block) or an L2/L3 (ZMIPS/CMIPS/IOP).
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
