From: Rabin Vincent <rabin-66gdRtMMWGc@public.gmane.org>
Subject: Re: [PATCH] gpio: add ETRAXFS GPIO driver
Date: Thu, 21 May 2015 20:48:55 +0200
Message-ID: <20150521184855.GA6159@debian>
References: <1431728843-21583-1-git-send-email-rabin@rab.in>
 <CACRpkdZcbvrcOMJavU5TacR1nD5+ot2FdC5zxBc=8XdhZN0SqQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdZcbvrcOMJavU5TacR1nD5+ot2FdC5zxBc=8XdhZN0SqQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, May 19, 2015 at 11:39:01AM +0200, Linus Walleij wrote:
> On Sat, May 16, 2015 at 12:27 AM, Rabin Vincent <rabin-66gdRtMMWGc@public.gmane.org> wrote:
> > +Axis ETRAX FS General I/O controller bindings
> > +
> > +Required properties:
> > +
> > +- compatible:
> > +  - "axis,etraxfs-gio"
> > +- reg: Physical base address and length of the controller's registers.
> > +- #gpio-cells: Should be 3
> > +  - The first cell is the port number (hex).
> > +  - The seconds cell is the gpio offset number.
> > +  - The third cell is reserved and is currently unused.
> > +- gpio-controller: Marks the device node as a GPIO controller.
> > +
> > +Example:
> > +
> > +       gio: gpio@b001a000 {
> > +               compatible = "axis,etraxfs-gio";
> > +               reg = <0xb001a000 0x1000>;
> > +               gpio-controller;
> > +               #gpio-cells = <3>;
> > +       };
> 
> Three cells is rather unusual, is it the best arrangement?
> 
> Usually it's just offset+flags (your flags are ununsed I see).
> And then you could divide offset by num gpios per bank
> (I guess 32) in the driver to get bank number.

At least to me, this:

+       i2c {
+               compatible = "i2c-gpio";
+               gpios = <&gio 0xD 5 0>, <&gio 0xD 6 0>;
+               i2c-gpio,delay-us = <2>;

which immediately shows that it's port D pins 5 and 6 which are being used, and
which matches the naming in the schematics and the chip documentation is
clearly preferable to this:

+               gpios = <&gio 101 0>, <&gio 102 0>;

which uses made up numbers with no relation to any documentation and which
probably requires the use of a calculator to determine if the correct
pins are being used.

(btw, the ports have varying numbers of GPIOs and none of them have 32).

> 
> The other obvious question is whether you considered the
> design pattern of using one DT node per bank, so you
> have offset 0..31 (I guess) on each device, simplifying things
> with two cells.

Yes, but I did it the way I did for the reasons below.

> The latter design pattern is usually recommended unless
> there is a "strong" coupling between the banks, such as
> if they all share the same IRQ line so they need the
> same interrupt handler, or share other common registers.

The binding in the patch matches the hardware.  The hardware is
described as one IP with several ports and not several instances of the
same IP.  The registers are also just 3 per port in the same region.
Creating one instance of the device for handling each port, seems
like useless overhead at best and, because it doesn't even match how the
hardware looks like, quite wrong anyway.

Only port A has interrupt support; this is not implemented in the
current driver.

BTW, the documentation for the chip is available here (GIO starts at
page 647 and its registers at page 895):
http://www.axis.com/files/manuals/etrax_fs_des_ref-070821.pdf

> > +struct etraxfs_gpio_port {
> > +       const char *label;
> > +       unsigned int oe;
> > +       unsigned int dout;
> > +       unsigned int din;
> 
> consider using u32 for these.

Why?  These are just offsets to the base address so there's no reason
they _have_ to be 32 bits so u32 seems semantically wrong.

> > +       unsigned int ngpio;
> > +};
> > +
> > +struct etraxfs_gpio_info {
> > +       int num_ports;
> 
> unsigned?

OK.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
