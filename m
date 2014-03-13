From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v3 0/4] irq: sun4i IRQ 0 / ENMI fixes
Date: Thu, 13 Mar 2014 19:03:50 +0100
Message-ID: <1394733834-26839-1-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-sunxi+bncBDL4X2GMZUKRBEXGQ6MQKGQE5GIENJI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi All,

Here is v3 of my sun4i IRQ 0 / ENMI fixes patch-set, changelog below:

v2:

PATCH 1/4 irq: Add handle_fasteoi_late_irq irq handler
New patch by Thomas Gleixner, adding a new irq handler with the "call eoi
after the irq-handler has run its course" behavior we need to avoid double
irqs on the ENMI.

PATCH 2/4 irqchip: sun4i: Fix irq 0 not working
Modified to avoid spurious calls to the irq 0 handler, as suggested by Maxime.

PATCH 3/4 irqchip: sun4i: Fix a comment about mask register
Added Maxime's Acked-by

PATCH 4/4 irqchip: sun4i: Use handle_fasteoi_late_irq for the
New patch switching the handler for irq 0 over to the new
handle_fasteoi_late_irq handler, thereby fixing the double interrupts issue


v3:

PATCH 1/4 irq: Add a new IRQCHIP_EOI_THREADED flag
New patch by Thomas Gleixner, replacing his "irq: Add handle_fasteoi_late_irq
irq handler" patch.

PATCH 2/4 irqchip: sun4i: Fix irq 0 not working
Added Maxime's Acked-by

PATCH 4/4 irqchip: sun4i: Don't ack IRQs != 0, fix acking of IRQ
New patch replacing my "irqchip: sun4i: Use handle_fasteoi_late_irq ..."
patch. This also drops acking for IRQ != 0. I've done both changes in
one patch to avoid regressing for IRQ 0.


Thanks for all the help to all involved.

Regards,

Hans
