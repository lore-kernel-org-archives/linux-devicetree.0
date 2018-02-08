From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH 2/7] soc: davinci: new genpd driver
Date: Thu, 8 Feb 2018 15:00:47 +0530
Message-ID: <65f2690c-c605-3c66-9d8a-9a882aaf446d@ti.com>
References: <20180207134553.13510-1-brgl@bgdev.pl>
 <20180207134553.13510-3-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180207134553.13510-3-brgl@bgdev.pl>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@kernel.org>, Russell King <linux@armlinux.org.uk>, David Lechner <david@lechnology.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: devicetree@vger.kernel.org

On Wednesday 07 February 2018 07:15 PM, Bartosz Golaszewski wrote:
> +	/*
> +	 * DaVinci always uses a single clock for power-management. We assume
> +	 * it's the first one in the clocks property.
> +	 */
> +	clk = of_clk_get(dev->of_node, 0);
> +	if (IS_ERR(clk))
> +		return PTR_ERR(clk);

We already get this today with drivers/base/power/clock_ops.c once
.con_ids list is dropped from pm_clk_notifier_block (which I think it
should).

If there is no reason to introduce thus functionality at this stage,
perhaps we should wait till such a time when its clearly needed?

Thanks,
Sekhar
