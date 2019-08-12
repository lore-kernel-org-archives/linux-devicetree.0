From: Alan Stern <stern@rowland.harvard.edu>
Subject: RE: [PATCH v9 5/6] usb:cdns3 Add Cadence USB3 DRD Driver
Date: Mon, 12 Aug 2019 10:20:07 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1908121018430.1659-100000@iolanthe.rowland.org>
References: <877e7iu0xw.fsf@gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <877e7iu0xw.fsf@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Felipe Balbi <felipe.balbi@linux.intel.com>
Cc: Pawel Laszczak <pawell@cadence.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "hdegoede@redhat.com" <hdegoede@redhat.com>, "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "rogerq@ti.com" <rogerq@ti.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "jbergsagel@ti.com" <jbergsagel@ti.com>, "nsekhar@ti.com" <nsekhar@ti.com>, "nm@ti.com" <nm@ti.com>, Suresh Punnoose <sureshp@cadence.com>, "peter.chen@nxp.com" <peter.chen@nxp.com>, Jayshri Dajiram Pawar <jpawar@cadence.com>, Rahul Kumar <kurahul@cadence.com>
List-Id: devicetree@vger.kernel.org

On Mon, 12 Aug 2019, Felipe Balbi wrote:

> I don't understand the intricacies of the coherent API to judge if it's
> a bug in the API itself. In any case, here's where the splat comes from:
> 
> void dma_free_attrs(struct device *dev, size_t size, void *cpu_addr,
> 		dma_addr_t dma_handle, unsigned long attrs)
> {
> 	const struct dma_map_ops *ops = get_dma_ops(dev);
> 
> 	if (dma_release_from_dev_coherent(dev, get_order(size), cpu_addr))
> 		return;
> 	/*
> 	 * On non-coherent platforms which implement DMA-coherent buffers via
> 	 * non-cacheable remaps, ops->free() may call vunmap(). Thus getting
> 	 * this far in IRQ context is a) at risk of a BUG_ON() or trying to
> 	 * sleep on some machines, and b) an indication that the driver is
> 	 * probably misusing the coherent API anyway.
> 	 */
> 	WARN_ON(irqs_disabled());
> 
> 	if (!cpu_addr)
> 		return;
> 
> 	debug_dma_free_coherent(dev, size, cpu_addr, dma_handle);
> 	if (dma_is_direct(ops))
> 		dma_direct_free(dev, size, cpu_addr, dma_handle, attrs);
> 	else if (ops->free)
> 		ops->free(dev, size, cpu_addr, dma_handle, attrs);
> }
> EXPORT_SYMBOL(dma_free_attrs);
> 
> maybe you're gonna have to fire up a workqueue to free this memory for
> you :-(
> 
> Unless someone else has better ideas. Alan, Greg, any ideas?

I don't understand it very well myself, but there have been posts by 
some of the DMA maintainers on this topic.  Maybe you can try asking 
them.

Alan Stern
