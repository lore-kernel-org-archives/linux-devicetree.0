From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Device node for a controller with two interrupt parents
Date: Wed, 21 Mar 2012 07:55:43 +0530
Message-ID: <CAJuYYwT1uKaUDuh98i4B286az-_26YCN31UXXFWsP=_M-UL_vg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: devicetree-discuss <devicetree-discuss@lists.ozlabs.org>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>
List-Id: devicetree@vger.kernel.org

Hi,

Exynos5 includes a gpio wakeup interrupt controller that generates 32
interrupts. The first 16 interrupts are routed to the interrupt
combiner controller. The last 16 are muxed into one interrupt and this
interrupt line is connected to the GIC interrupt controller.

So, the wakeup interrupt controller node in device tree requires two
interrupt parents. I do not know how to handle this. Any suggestions
will be very helpful.

Thanks,
Thomas.
