From: Alexander Stein <alexanders83@web.de>
Subject: Re: [PATCH v3 05/11] memory: add Atmel EBI (External Bus Interface)
 driver
Date: Tue, 09 Dec 2014 21:53:12 +0100
Message-ID: <5455670.EDnhYEk7hP@kongar>
References: <1417429647-3419-1-git-send-email-boris.brezillon@free-electrons.com>
 <1417429647-3419-6-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1417429647-3419-6-git-send-email-boris.brezillon@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Jean-Jacques Hiblot <jjhiblot@traphandler.com>, Samuel Ortiz <sameo@linux.intel.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Lee Jones <lee.jones@linaro.org>, Nicolas Ferre <nicolas.ferre@atmel.com>, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Kumar Gala <galak@codeaurora.org>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Andrew Victor <linux@maxim.org.za>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi,

On Monday 01 December 2014, 11:27:21 wrote Boris Brezillon:
> +static int at91_ebi_probe(struct platform_device *pdev)
> +{
> +	const struct of_device_id *match;
> +	struct device_node *child;
> +	struct device_node *np;
> +	struct at91_ebi *ebi;
> +	struct clk *clk;
> +	int ret;
> +
> +	match = of_match_device(at91_ebi_id_table, &pdev->dev);
> +	if (!match || !match->data)
> +		return -EINVAL;
> +
> +	ebi = devm_kzalloc(&pdev->dev, sizeof(*ebi), GFP_KERNEL);
> +	if (!ebi)
> +		return -ENOMEM;
> +
> +	ebi->caps = match->data;
> +	ebi->dev = &pdev->dev;
> +
> +	clk = devm_clk_get(&pdev->dev, NULL);
> +	if (IS_ERR(clk))
> +		return PTR_ERR(clk);
> +
> +	ebi->clk = clk;
> +
> +	np = of_parse_phandle(pdev->dev.of_node, "atmel,smc", 0);
> +	if (!np)
> +		return -EINVAL;
> +
> +	ebi->smc = syscon_node_to_regmap(np);
> +	if (IS_ERR(ebi->smc))
> +		return PTR_ERR(ebi->smc);
> +
> +	/*
> +	 * The sama5d3 does not provide an EBICSA register and thus does need
> +	 * to access the matrix registers.
> +	 */
> +	if (ebi->caps->ebi_csa) {
> +		np = of_parse_phandle(pdev->dev.of_node, "atmel,matrix", 0);
> +		if (np)
         ^^^^^^^
Shouldn't this be if (!np)?

> +			return -EINVAL;
> +
> +		ebi->matrix = syscon_node_to_regmap(np);
> +		if (IS_ERR(ebi->matrix))
> +			return PTR_ERR(ebi->matrix);
> +
> +		ebi->ebi_csa = regmap_field_alloc(ebi->matrix,
> +						  *ebi->caps->ebi_csa);
> +		if (IS_ERR(ebi->ebi_csa))
> +			return PTR_ERR(ebi->ebi_csa);
> +	}
> +
> +	ret = ebi->caps->init(ebi);
> +	if (ret)
> +		return ret;
> +
> +	for_each_child_of_node(pdev->dev.of_node, child) {
> +		ret = at91_ebi_dev_setup(ebi, child);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return ret;
> +}
> +
> +static struct platform_driver at91_ebi_driver = {
> +	.driver = {
> +		.name = "atmel-ebi",
> +		.of_match_table	= at91_ebi_id_table,
> +	},
> +};
> +module_platform_driver_probe(at91_ebi_driver, at91_ebi_probe);
> +
> +MODULE_AUTHOR("JJ Hiblot");
> +MODULE_DESCRIPTION("Atmel's EBI driver");
> +MODULE_LICENSE("GPL");


Best regards,
Alexander
