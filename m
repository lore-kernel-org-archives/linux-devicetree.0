From: atull <atull@opensource.altera.com>
Subject: Re: [PATCH 1/4 v4] GPIO: gpio-dwapb: Enable platform driver binding
 to MFD driver
Date: Tue, 16 Sep 2014 09:22:43 -0500
Message-ID: <alpine.DEB.2.02.1409160921020.4740@atx-linux-37>
References: <1410859335-11080-1-git-send-email-alvin.chen@intel.com> <1410859335-11080-2-git-send-email-alvin.chen@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1410859335-11080-2-git-send-email-alvin.chen@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Weike Chen <alvin.chen@intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Boon Leong Ong <boon.leong.ong@intel.com>, Hock Leong Kweh <hock.leong.kweh@intel.com>, Darren Hart <dvhart@linux.intel.com>, Sebastian Andrzej Siewior <sebastian@breakpoint.cc>, Mika Westerberg <mika.westerberg@intel.com>, Andriy Shevchenko <andriy.shevchenko@intel.com>, Arnd Bergmann <arnd@arndb.de>
List-Id: devicetree@vger.kernel.org

On Tue, 16 Sep 2014, Weike Chen wrote:

One more:

> +
> +		/*
> +		 * Only port A can provide interrupts in all configurations of
> +		 * the IP.
> +		 */
> +		if (pp->idx == 0 &&
> +		    of_property_read_bool(port_np, "interrupt-controller")) {
> +			pp->irq = irq_of_parse_and_map(port_np, 0);
> +			if (!pp->irq) {
> +				dev_warn(dev, "no irq for bank %s\n",
> +					 port_np->full_name);
> +			}
> +		} else {
> +			pp->irq	= 0;
> +		}

The else clause is not needed since pp->irq == 0 already, right?

Alan

> +
> +		pp->irq_shared	= false;
> +		pp->gpio_base	= -1;
> +		pp->name	= port_np->full_name;
> +	}
> +
> +	return pdata;
> +}
