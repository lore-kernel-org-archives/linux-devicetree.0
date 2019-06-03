From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH net-next 04/10] net: ethernet: ti: cpts: add support
 for rftclk selection
Date: Mon, 03 Jun 2019 15:13:29 -0700 (PDT)
Message-ID: <20190603.151329.1880364693299986138.davem@davemloft.net>
References: <20190601104534.25790-1-grygorii.strashko@ti.com>
        <20190601104534.25790-5-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190601104534.25790-5-grygorii.strashko@ti.com>
Sender: netdev-owner@vger.kernel.org
To: grygorii.strashko@ti.com
Cc: ssantosh@kernel.org, richardcochran@gmail.com, robh+dt@kernel.org, nsekhar@ti.com, m-karicheri2@ti.com, w-kwok2@ti.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Grygorii Strashko <grygorii.strashko@ti.com>
Date: Sat, 1 Jun 2019 13:45:28 +0300

> +static int cpts_of_mux_clk_setup(struct cpts *cpts, struct device_node *node)
> +{
> +	unsigned int num_parents;
> +	const char **parent_names;
> +	struct device_node *refclk_np;
> +	struct clk_hw *clk_hw;
> +	u32 *mux_table;
> +	int ret = -EINVAL;

Reverse christmas tree please.

Thank you.
