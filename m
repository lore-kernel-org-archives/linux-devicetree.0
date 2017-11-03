From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH 6/7] netdev: octeon-ethernet: Add Cavium Octeon III
 support.
Date: Fri, 3 Nov 2017 16:48:11 +0100
Message-ID: <20171103154811.GS24320@lunn.ch>
References: <20171102003606.19913-1-david.daney@cavium.com>
 <20171102003606.19913-7-david.daney@cavium.com>
 <55d6cf88-7444-42ea-02f1-27efdee2be4b@gmail.com>
 <ee206580-e419-903f-de36-72d5803b1b7b@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <ee206580-e419-903f-de36-72d5803b1b7b-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Daney <ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Cc: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, James Hogan <james.hogan-8NJIiSa5LzA@public.gmane.org>, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Steven J. Hill" <steven.hill-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Carlos Munoz <cmunoz-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> >>+static char *mix_port;
> >>+module_param(mix_port, charp, 0444);
> >>+MODULE_PARM_DESC(mix_port, "Specifies which ports connect to MIX interfaces.");
> >
> >Can you derive this from Device Tree /platform data configuration?
> >
> >>+
> >>+static char *pki_port;
> >>+module_param(pki_port, charp, 0444);
> >>+MODULE_PARM_DESC(pki_port, "Specifies which ports connect to the PKI.");
> >
> >Likewise
> 
> The SoC is flexible in how it is configured.  Technically the device tree
> should only be used to specify information about the physical configuration
> of the system that cannot be probed for, and this is about policy rather
> that physical wiring.  That said, we do take the default configuration from
> the device tree, but give the option here to override via the module command
> line.

Module parameters are pretty much frowned upon. 

You should really try to remove them all, if possible.

> >>+/* Registers are accessed via xkphys */
> >>+#define SSO_BASE			0x1670000000000ull
> >>+#define SSO_ADDR(node)			(SET_XKPHYS + NODE_OFFSET(node) +      \
> >>+					 SSO_BASE)
> >>+#define GRP_OFFSET(grp)			((grp) << 16)
> >>+#define GRP_ADDR(n, g)			(SSO_ADDR(n) + GRP_OFFSET(g))
> >>+#define SSO_GRP_AQ_CNT(n, g)		(GRP_ADDR(n, g)		   + 0x20000700)
> >>+
> >>+#define MIO_PTP_BASE			0x1070000000000ull
> >>+#define MIO_PTP_ADDR(node)		(SET_XKPHYS + NODE_OFFSET(node) +      \
> >>+					 MIO_PTP_BASE)
> >>+#define MIO_PTP_CLOCK_CFG(node)		(MIO_PTP_ADDR(node)		+ 0xf00)
> >>+#define MIO_PTP_CLOCK_HI(node)		(MIO_PTP_ADDR(node)		+ 0xf10)
> >>+#define MIO_PTP_CLOCK_COMP(node)	(MIO_PTP_ADDR(node)		+ 0xf18)
> >
> >I am sure this will work great on anything but MIPS64 ;)
> 
> Sarcasm duly noted.
> 
> That said, by definition it is exactly an OCTEON-III/MIPS64, and can never
> be anything else.  It is known a priori that the hardware and this driver
> will never be used anywhere else.

Please make sure your Kconfig really enforces this. Generally, we
suggest allowing the driver to be compiled when COMPILE_TEST is set.
That gives you better compiler test coverage. But it seems like this
driver won't compile under such conditions.

> >>+static int num_packet_buffers = 768;
> >>+module_param(num_packet_buffers, int, 0444);
> >>+MODULE_PARM_DESC(num_packet_buffers,
> >>+		 "Number of packet buffers to allocate per port.");
> >
> >Consider implementing ethtool -g/G for this.
> 
> That may be work for a follow-on patch.

Then please remove the module parameter now.

> >>+static int rx_queues = 1;
> >>+module_param(rx_queues, int, 0444);
> >>+MODULE_PARM_DESC(rx_queues, "Number of RX threads per port.");
> >
> >Same thing, can you consider using an ethtool knob for that?
> 
> Also may be work for a follow-on patch.

Ditto

> >>+/**
> >>+ * Reads a 64 bit value from the processor local scratchpad memory.
> >>+ *
> >>+ * @param offset byte offset into scratch pad to read
> >>+ *
> >>+ * @return value read
> >>+ */
> >>+static inline u64 scratch_read64(u64 offset)
> >>+{
> >>+	return *(u64 *)((long)SCRATCH_BASE + offset);
> >>+}
> >
> >No barriers needed whatsoever?
> 
> Nope.

Then it would be good to add a comment about why no barrier is
needed. Otherwise people are going to ask why there is no barrier,
submit patches adding barriers, etc.

       Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
