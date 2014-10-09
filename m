From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v3 4/7] ARM: mediatek: Add sysirq interrupt polarity support
Date: Thu, 09 Oct 2014 16:37:25 +0200
Message-ID: <2076856.iIXavsNzjc@wuerfel>
References: <1412864980-20273-1-git-send-email-yingjoe.chen@mediatek.com> <1412864980-20273-5-git-send-email-yingjoe.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1412864980-20273-5-git-send-email-yingjoe.chen@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: "Joe. C" <yingjoe.chen@mediatek.com>, arm@kernel.org, Rob Herring <robh+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Jiang Liu <jiang.liu@linux.intel.com>, Marc Zyngier <marc.zyngier@arm.com>, Mark Rutland <mark.rutland@arm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Sricharan R <r.sricharan@ti.com>, Florian Fainelli <f.fainelli@gmail.com>, Russell King <linux@arm.linux.org.uk>, yingjoe.chen@gmail.com, yh.chen@mediatek.com, nathan.chung@mediatek.com, Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Pawel Moll <pawel.moll@arm.com>, Matt Porter <mporter@linaro.org>, Marc Carino <marc.ceeeee@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, eddie.huang@mediatek.com, srv_heupstream@mediatek.com, hc.yen@mediatek.com, linux-kernel@vger.kernel.org, Santosh Shilimkar <santosh.shilimkar@ti.co>
List-Id: devicetree@vger.kernel.org

On Thursday 09 October 2014 22:29:37 Joe. C wrote:

> +static int __init mtk_sysirq_of_init(struct device_node *node,
> +				   struct device_node *parent)
> +{
> +	struct device_node *parent_node;
> +	struct irq_domain *domain, *domain_parent = NULL;
> +	struct mt_sysirq_chip_data *chip_data;
> +	int ret = 0;
> +
> +	parent_node = of_irq_find_parent(node);
> +	if (parent_node) {
> +		domain_parent = irq_find_host(parent_node);
> +		of_node_put(parent_node);
> +	}

Just a small comment: I think the 'parent' argument to the function
already contains the device node you are looking up here, so
no need for the second variable or _find_parent call.

This means you can also drop the  = NULL assignment for the
domain.

	Arnd
