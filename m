From: "jonsmirl@gmail.com" <jonsmirl@gmail.com>
Subject: Problem with of_irq_to_resource() and IRQ flags
Date: Sun, 15 Apr 2012 14:38:57 -0400
Message-ID: <CAKON4OwjBEsDb4=TvS_WkK-9dabHgLm0+Vgkprse9tSs6+bo8g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: devicetree-discuss <devicetree-discuss@ozlabs.org>, ARM Linux Mailing List <linux-arm-kernel@lists.infradead.org>, Grant Likely <grant.likely@secretlab.ca>
List-Id: devicetree@vger.kernel.org

I'm trying to enable the dm9000 driver for DT support.  I've run into
a problem with the interrupt flags. The dm9000 driver is expecting to
get them passed in on the resource flags:

unsigned long irqflags = db->irq_res->flags & IRQF_TRIGGER_MASK;

But of_irq_to_resource() is not adding them:

		r->flags = IORESOURCE_IRQ;

Now if I trace into of_irq_to_resource() it calls
irq_of_parse_and_map() which calls irq_create_of_mapping() which then
calls  domain->ops->dt_translate() to get the flags.  So we have the
flags down the callstack but passing them back means adding a
parameter to a public API.

I can't see any API to ask an irq for its current flags. That would be
another way to get them and add them to the resource.

Any other options?

-- 
Jon Smirl
jonsmirl@gmail.com
