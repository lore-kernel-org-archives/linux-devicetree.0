From: Joe.C <yingjoe.chen@mediatek.com>
Subject: Re: [PATCH v3 4/7] ARM: mediatek: Add sysirq interrupt polarity
 support
Date: Thu, 9 Oct 2014 22:53:45 +0800
Message-ID: <1412866425.23455.1.camel@mtksdaap41>
References: <1412864980-20273-1-git-send-email-yingjoe.chen@mediatek.com>
 <1412864980-20273-5-git-send-email-yingjoe.chen@mediatek.com>
 <2076856.iIXavsNzjc@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <2076856.iIXavsNzjc@wuerfel>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Mark Rutland <mark.rutland@arm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Sricharan R <r.sricharan@ti.com>, Florian Fainelli <f.fainelli@gmail.com>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, yh.chen@mediatek.com, arm@kernel.org, nathan.chung@mediatek.com, Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, yingjoe.chen@gmail.com, Marc Zyngier <marc.zyngier@arm.com>, Matt Porter <mporter@linaro.org>, Marc Carino <marc.ceeeee@gmail.com>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, eddie.huang@mediatek.com, linux-arm-kernel@lists.infradead.org, srv_heupstream@mediatek.com, hc.yen@mediatek.com, linux-kernel@vger.kernel.org, Santosh Shilimkar <santosh.shilimkar@ti.com>, Sascha Hauer <kernel@pengutronix.de>, Ol
List-Id: devicetree@vger.kernel.org

On Thu, 2014-10-09 at 16:37 +0200, Arnd Bergmann wrote:
> On Thursday 09 October 2014 22:29:37 Joe. C wrote:
> 
> > +static int __init mtk_sysirq_of_init(struct device_node *node,
> > +				   struct device_node *parent)
> > +{
> > +	struct device_node *parent_node;
> > +	struct irq_domain *domain, *domain_parent = NULL;
> > +	struct mt_sysirq_chip_data *chip_data;
> > +	int ret = 0;
> > +
> > +	parent_node = of_irq_find_parent(node);
> > +	if (parent_node) {
> > +		domain_parent = irq_find_host(parent_node);
> > +		of_node_put(parent_node);
> > +	}
> 
> Just a small comment: I think the 'parent' argument to the function
> already contains the device node you are looking up here, so
> no need for the second variable or _find_parent call.
> 
> This means you can also drop the  = NULL assignment for the
> domain.
> 
> 	Arnd

Thanks for point this out. I'll fix this in the next version.

Joe.C
