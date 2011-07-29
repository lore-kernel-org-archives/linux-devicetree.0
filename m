From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH v2 4/7] tty: serial: support device tree in pxa
Date: Fri, 29 Jul 2011 10:53:00 -0600
Message-ID: <20110729165300.GO11164@ponder.secretlab.ca>
References: <1311835293-18125-1-git-send-email-haojian.zhuang@marvell.com>
	<1311835293-18125-2-git-send-email-haojian.zhuang@marvell.com>
	<1311835293-18125-3-git-send-email-haojian.zhuang@marvell.com>
	<1311835293-18125-4-git-send-email-haojian.zhuang@marvell.com>
	<1311835293-18125-5-git-send-email-haojian.zhuang@marvell.com>
	<20110729164539.GM11164@ponder.secretlab.ca>
	<20110729164922.GA30298@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110729164922.GA30298-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Haojian Zhuang <haojian.zhuang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, alan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Jul 29, 2011 at 05:49:22PM +0100, Russell King - ARM Linux wrote:
> On Fri, Jul 29, 2011 at 10:45:39AM -0600, Grant Likely wrote:
> > On Thu, Jul 28, 2011 at 02:41:30PM +0800, Haojian Zhuang wrote:
> > > +#ifdef CONFIG_OF
> > > +	for (i = 0; i < PXA_SERIAL_NR; i++) {
> > > +		if (serial_pxa_ports[i] == NULL)
> > > +			break;
> > > +	}
> > > +	if (i >= PXA_SERIAL_NR) {
> > > +		pr_warn("can't find pxa serial port\n");
> > > +		return -ENODEV;
> > > +	}
> > > +
> > > +	if (of_property_read_u32(np, "clock-frequency", &clk)) {
> > > +		pr_warn("no clock-frequency property set\n");
> > > +		return -ENODEV;
> > > +	}
> > > +	if (of_property_read_u32(np, "current-speed", &spd) == 0)
> > > +		sport->port.custom_divisor = clk / (16 * spd);
> > > +
> > > +	sprintf(name, "pxa2xx-uart.%d", i);
> > > +	sport->clk = clk_get_sys(name, NULL);
> > > +	if (IS_ERR(sport->clk)) {
> > > +		ret = PTR_ERR(sport->clk);
> > > +		goto err_free;
> > > +	}
> > > +	sport->port.uartclk = clk;
> > > +#else
> > > +	i = dev->id;
> > >  	sport->clk = clk_get(&dev->dev, NULL);
> > >  	if (IS_ERR(sport->clk)) {
> > >  		ret = PTR_ERR(sport->clk);
> > >  		goto err_free;
> > >  	}
> > > +	sport->port.uartclk = clk_get_rate(sport->clk);
> > > +#endif
> > 
> > This means a kernel build can either support DT or non-DT, but not
> > both.  DT & non-DT booting are full supported with the same kernel
> > image, so don't do it this way.
> > 
> > Instead, check for the presence of an of_node.  If it is there, do the
> > DT parsing.  If now, still support the old method.
> 
> Oh ffs, why is this DT stuff causing all the clk stuff to have to change.
> And specifically why is stuff converting to use clk_get_sys().
> 
> clk_get_sys() is there to allow system devices to get their clocks.
> It's not for general drivers to use.
> 
> Please, stop this madness.

indeed.

g.
