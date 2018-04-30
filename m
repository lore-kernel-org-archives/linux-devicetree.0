From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 06/17] irqchip/irq-mvebu-icu: switch to regmap
Date: Mon, 30 Apr 2018 15:58:32 +0200
Message-ID: <20180430155832.62510f26@windsurf>
References: <20180421135537.24716-1-miquel.raynal@bootlin.com>
 <20180421135537.24716-7-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180421135537.24716-7-miquel.raynal@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, devicetree@vger.kernel.org, Marc Zyngier <marc.zyngier@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Gregory Clement <gregory.clement@bootlin.com>, Haim Boot <hayim@marvell.com>, Will Deacon <will.deacon@arm.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Antoine Tenart <antoine.tenart@bootlin.com>, Rob Herring <robh+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Hanna Hawa <hannah@marvell.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

Hello,

On Sat, 21 Apr 2018 15:55:26 +0200, Miquel Raynal wrote:

> +	icu->regmap = syscon_regmap_lookup_by_phandle(pdev->dev.of_node, NULL);
> +	if (IS_ERR(icu->regmap))
> +		return PTR_ERR(icu->regmap);
> +
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	icu->base = devm_ioremap_resource(&pdev->dev, res);
> -	if (IS_ERR(icu->base)) {
> -		dev_err(&pdev->dev, "Failed to map icu base address.\n");
> -		return PTR_ERR(icu->base);
> -	}
> +	if (!res)
> +		return -ENODEV;

Another issue with relying on the "syscon" compatible string: your ICU
driver now *requires* that the DT has the "syscon" compatible string.
Otherwise, no regmap is created, and your
syscon_regmap_lookup_by_phandle() call will fail.

In fact, there is a very good hint that something is wrong in terms of
backward compatibility: your patch

  arm64: dts: marvell: add syscon compatible to CP110 ICU node

comes early in the series, separated from other DT changes. It should
come at the end of the series, with the rest of the DT changes. By
doing this, you could test your series with the driver changes, but not
the DT changes, and would have realized that the driver change in this
patch (PATCH 06/17) breaks DT backward compatibility.

This is IMO another good reason to not use the "syscon" property, but
simply have the driver initialize the regmap by itself. This will work
even with old DTs, as it will become just an internal implementation
detail of the driver.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
