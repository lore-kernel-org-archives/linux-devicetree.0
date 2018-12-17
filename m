From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v4 3/7] phy: add A3700 COMPHY support
Date: Mon, 17 Dec 2018 16:48:57 +0100
Message-ID: <20181217164857.68df3f84@xps13>
References: <20181213083908.14180-1-miquel.raynal@bootlin.com>
        <20181213083908.14180-4-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181213083908.14180-4-miquel.raynal@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gregory Clement <gregory.clement@bootlin.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Antoine Tenart <antoine.tenart@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Marcin Wojtas <mw@semihalf.com>, Grzegorz Jaszczyk <jaz@semihalf.com>, Evan Wang <xswang@marvell.com>
List-Id: devicetree@vger.kernel.org

Hello,

[...]

> +
> +static int mvebu_a3700_comphy_smc(unsigned long function, unsigned long lane,
> +				  unsigned long mode)
> +{
> +	struct arm_smccc_res res;
> +
> +	arm_smccc_smc(function, lane, mode, 0, 0, 0, 0, 0, &res);

I received the following bug report because I added a dependency on
COMPILE_TEST in Kconfig:

        config: i386-allmodconfig (attached as .config) compiler:
        gcc-7 (Debian 7.3.0-1) 7.3.0 reproduce:
                # save the attached .config to linux build tree
                make ARCH=i386 

        All errors (new ones prefixed by >>):

        >> ERROR: "__arm_smccc_smc" [drivers/phy/marvell/phy-mvebu-a3700-comphy.ko] undefined!  

Unless someone complains, I will drop the dependency on COMPILE_TEST in
Kconfig.

> +
> +	return res.a0;
> +}


Thanks,
Miquèl
