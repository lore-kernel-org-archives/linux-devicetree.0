From: Brian Norris <briannorris@chromium.org>
Subject: Re: [PATCH 5/5] firmware: google memconsole: Add ARM/ARM64 support
Date: Fri, 24 Mar 2017 11:00:43 -0700
Message-ID: <20170324180043.GC119093@google.com>
References: <1490303069-13230-1-git-send-email-thierry.escande@collabora.com>
 <1490303069-13230-6-git-send-email-thierry.escande@collabora.com>
 <20170324122858.GF22771@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170324122858.GF22771@leverpostej>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: Thierry Escande <thierry.escande@collabora.com>, Rob Herring <robh@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Olof Johansson <olof@lixom.net>, Stephen Warren <swarren@nvidia.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Julius Werner <jwerner@chromium.org>
List-Id: devicetree@vger.kernel.org

On Fri, Mar 24, 2017 at 12:28:59PM +0000, Mark Rutland wrote:
> On Thu, Mar 23, 2017 at 10:04:29PM +0100, Thierry Escande wrote:
> > +static const struct of_device_id coreboot_of_match[] = {
> > +	{ .compatible = "coreboot" },
> > +	{},
> > +};
> > +
> > +static struct platform_driver coreboot_table_of_driver = {
> > +	.probe = coreboot_table_of_probe,
> > +	.remove = coreboot_table_of_remove,
> > +	.driver = {
> > +		.name = "coreboot_table_of",
> > +		.of_match_table = coreboot_of_match,
> > +	},
> > +};
> > +
> > +static int __init platform_coreboot_table_of_init(void)
> > +{
> > +	struct platform_device *pdev;
> > +	struct device_node *of_node;
> > +
> > +	/* Limit device creation to the presence of /firmware/coreboot node */
> > +	of_node = of_find_node_by_path("/firmware/coreboot");
> > +	if (!of_node)
> > +		return -ENODEV;
> > +
> 
> I don't beleive that you need this module init function. Please use the
> usual DT probing infrastrucutre instead, e.g. add:
> 
> MODULE_DEVICE_TABLE(of, coreboot_of_match);
> module_platform_driver(coreboot_table_of_driver);

That doesn't work. If this node is placed under /firmware, which isn't a
proper "bus", then we have to explicitly look for the sub-device.

Due to this, the MODULE_DEVICE_TABLE() also isn't useful, because the
/firmware/coreboot/ device won't be generated automatically, and so no
matching uevent will occur.

Brian
