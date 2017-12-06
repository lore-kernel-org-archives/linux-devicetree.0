From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v6 3/6] kernel/reboot.c: export pm_power_off_prepare
Date: Wed, 6 Dec 2017 15:11:30 -0800
Message-ID: <20171206231130.GA6235@infradead.org>
References: <20171206072402.11694-1-o.rempel@pengutronix.de>
 <20171206072402.11694-4-o.rempel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20171206072402.11694-4-o.rempel@pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>, kernel@pengutronix.de, Fabio Estevam <fabio.estevam@nxp.com>, Andrew Morton <akpm@linux-foundation.org>, Leonard Crestez <leonard.crestez@nxp.com>, Linus Torvalds <torvalds@linux-foundation.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

>  void (*pm_power_off_prepare)(void);
> +EXPORT_SYMBOL(pm_power_off_prepare);

EXPORT_SYMBOL_GPL for something this deeply internal, please.
