From: Jon Loeliger <loeliger-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Questions About a Semi-Soft irqchip Device
Date: Tue, 8 Jul 2014 09:02:14 -0500
Message-ID: <CAJgR-Bi2HX+aYVabaFLyu9QAnAS4RmQ7DvBtDHOawkfi08zycA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Folks,

I have a few questions about an interrupt controller IP block
that I would like to support in an ARM SoC port.

My IP block provides software-assignable interrupts.  That
is, I have a large pool of interrupt sources, and a large pool
of interrupt bits in the controller, but they are not physically
tied together. Instead they are assigned by some driver as it
initializes and allocates resources.  This, I think, means that
I can not describe the interrupt  bindings in the DTS file.

So, my first question is:  Should I still write an irqchip device
for this IP block and represent it in the device tree, even
though I will not be able to use it as the referee of an
interrupt = < ... > binding?  I think I should primarily because
other drivers will still need to set up IRQ handling through
this device.

Another question:  This device has a muti-32-bit-word
bit-field representation for the interrupt lines.  It has a
parallel array of words for clearing the interrupt.  Is there
an existing irqchip that I can directly leverage that fits
that description?

Thank you,
jdl
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
