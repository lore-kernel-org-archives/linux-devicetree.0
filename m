From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH] of: add devicetree API for regulator
Date: Sat, 9 Jul 2011 11:03:25 +0900
Message-ID: <20110709020323.GH18860@opensource.wolfsonmicro.com>
References: <1310120428-22700-1-git-send-email-haojian.zhuang@marvell.com>
	<1310120428-22700-2-git-send-email-haojian.zhuang@marvell.com>
	<1310120428-22700-3-git-send-email-haojian.zhuang@marvell.com>
	<1310120428-22700-4-git-send-email-haojian.zhuang@marvell.com>
	<1310120428-22700-5-git-send-email-haojian.zhuang@marvell.com>
	<1310120428-22700-6-git-send-email-haojian.zhuang@marvell.com>
	<1310120428-22700-7-git-send-email-haojian.zhuang@marvell.com>
	<1310120428-22700-8-git-send-email-haojian.zhuang@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1310120428-22700-8-git-send-email-haojian.zhuang@marvell.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Haojian Zhuang <haojian.zhuang@marvell.com>
Cc: eric.y.miao@gmail.com, nico@fluxnic.net, devicetree-discuss@lists.ozlabs.org, haojian.zhuang@gmail.com, grant.likely@secretlab.ca, samuel.ortiz@intel.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org, alan@linux.intel.com
List-Id: devicetree@vger.kernel.org

On Fri, Jul 08, 2011 at 06:20:24PM +0800, Haojian Zhuang wrote:
> Signed-off-by: Haojian Zhuang <haojian.zhuang@marvell.com>

Overall this looks like a reasonable start but I'm having a hard time
seeing how this would actually be used and there's a *lot* of Linux
specifics in here which aren't going to be acceptable for device tree as
device tree is supposed to be platform neutral.

As a general comment blank lines would *really* improve the legibility
of the code.

> ---
>  drivers/of/Kconfig           |    4 +
>  drivers/of/Makefile          |    1 +
>  drivers/of/of_regulator.c    |  166 ++++++++++++++++++++++++++++++++++++++++++

Why is this in drivers/of?

> +	p = of_get_property(of_dev, "voltages", &size);

voltage_range would probably be better.

> +	if (p && size / sizeof(int) == 2) {
> +		constraints->min_uV = be32_to_cpu(*p++);
> +		constraints->max_uV = be32_to_cpu(*p);
> +	}

This and pretty much all of the rest of the code doesn't look like it's
going to complain about parse problems.  That seems wrong, we'll just
silently ignore things we think we should understand.

> +	p = of_get_property(of_dev, "modes-mask", NULL);
> +	if (p)
> +		constraints->valid_modes_mask = be32_to_cpu(*p);

This probably shouldn't be in the OF bindings at all, the modes are a
Linux specific property.  We probably shouldn't be putting random
bitmasks directly in OF, and certainly not Linux defined ones.  This
applies to an awful lot of the rest of the code too.

> +	cp = of_get_property(of_dev, "ops-mask", &size);
> +	tmp = 0;
> +	if (cp && size > 0) {
> +		i = 0;
> +		do {
> +			len = strlen(ops[i]);
> +			if (!strncmp(cp, ops[i], len)) {
> +				constraints->valid_ops_mask |= 1 << i;
> +				/* need to handle '\0' */
> +				cp += len + 1;
> +				size = size - len - 1;
> +				i = 0;
> +			} else
> +				i++;
> +		} while (i < ARRAY_SIZE(ops));
> +		if (size > 0)
> +			printk(KERN_WARNING "Invalid string:%s\n", cp);
> +	}

If there isn't a helper function for this there should be one.

> +	supply = kzalloc(sizeof(struct regulator_consumer_supply) * count,
> +		GFP_KERNEL);
> +	if (supply == NULL)
> +		return -EINVAL;
> +	str = p;
> +	calc_size = size;
> +	i = 0;
> +	while (str && calc_size > 0 && i < count) {
> +		len = strlen(str);
> +		if (len == 0)
> +			break;
> +		supply[i++].supply = str;
> +		calc_size = calc_size - len - 1;
> +		str += len + 1;
> +	}
> +	data->consumer_supplies = supply;
> +	data->num_consumer_supplies = count;

This isn't going to fly, the consumer devices need to be referenced in
the OF tree rather than via their Linux device names.

> +extern int of_regulator_init_data(struct device_node *of_node,
> +				struct regulator_init_data *data);
> +extern void of_regulator_deinit_data(struct regulator_init_data *data);

How exactly is this supposed to be used?  I'd really expect the
regulator core to be doing this transparently for the drivers.
