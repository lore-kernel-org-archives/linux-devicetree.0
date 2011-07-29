From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH v2 4/7] tty: serial: support device tree in pxa
Date: Fri, 29 Jul 2011 17:49:22 +0100
Message-ID: <20110729164922.GA30298@n2100.arm.linux.org.uk>
References: <1311835293-18125-1-git-send-email-haojian.zhuang@marvell.com>
	<1311835293-18125-2-git-send-email-haojian.zhuang@marvell.com>
	<1311835293-18125-3-git-send-email-haojian.zhuang@marvell.com>
	<1311835293-18125-4-git-send-email-haojian.zhuang@marvell.com>
	<1311835293-18125-5-git-send-email-haojian.zhuang@marvell.com>
	<20110729164539.GM11164@ponder.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20110729164539.GM11164@ponder.secretlab.ca>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: eric.y.miao@gmail.com, devicetree-discuss@lists.ozlabs.org, Haojian Zhuang <haojian.zhuang@marvell.com>, haojian.zhuang@gmail.com, linux-arm-kernel@lists.infradead.org, alan@linux.intel.com
List-Id: devicetree@vger.kernel.org

On Fri, Jul 29, 2011 at 10:45:39AM -0600, Grant Likely wrote:
> On Thu, Jul 28, 2011 at 02:41:30PM +0800, Haojian Zhuang wrote:
> > +#ifdef CONFIG_OF
> > +	for (i = 0; i < PXA_SERIAL_NR; i++) {
> > +		if (serial_pxa_ports[i] == NULL)
> > +			break;
> > +	}
> > +	if (i >= PXA_SERIAL_NR) {
> > +		pr_warn("can't find pxa serial port\n");
> > +		return -ENODEV;
> > +	}
> > +
> > +	if (of_property_read_u32(np, "clock-frequency", &clk)) {
> > +		pr_warn("no clock-frequency property set\n");
> > +		return -ENODEV;
> > +	}
> > +	if (of_property_read_u32(np, "current-speed", &spd) == 0)
> > +		sport->port.custom_divisor = clk / (16 * spd);
> > +
> > +	sprintf(name, "pxa2xx-uart.%d", i);
> > +	sport->clk = clk_get_sys(name, NULL);
> > +	if (IS_ERR(sport->clk)) {
> > +		ret = PTR_ERR(sport->clk);
> > +		goto err_free;
> > +	}
> > +	sport->port.uartclk = clk;
> > +#else
> > +	i = dev->id;
> >  	sport->clk = clk_get(&dev->dev, NULL);
> >  	if (IS_ERR(sport->clk)) {
> >  		ret = PTR_ERR(sport->clk);
> >  		goto err_free;
> >  	}
> > +	sport->port.uartclk = clk_get_rate(sport->clk);
> > +#endif
> 
> This means a kernel build can either support DT or non-DT, but not
> both.  DT & non-DT booting are full supported with the same kernel
> image, so don't do it this way.
> 
> Instead, check for the presence of an of_node.  If it is there, do the
> DT parsing.  If now, still support the old method.

Oh ffs, why is this DT stuff causing all the clk stuff to have to change.
And specifically why is stuff converting to use clk_get_sys().

clk_get_sys() is there to allow system devices to get their clocks.
It's not for general drivers to use.

Please, stop this madness.
