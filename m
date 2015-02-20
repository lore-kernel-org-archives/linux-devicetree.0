From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCH 08/10] ARM: mvebu: add core support for Armada 39x
Date: Fri, 20 Feb 2015 14:05:49 +0100
Message-ID: <20150220140549.2a2d4336@free-electrons.com>
References: <1423238276-9206-1-git-send-email-thomas.petazzoni@free-electrons.com>
	<1423238276-9206-9-git-send-email-thomas.petazzoni@free-electrons.com>
	<54D51CC6.2070908@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <54D51CC6.2070908@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory Clement <gregory.clement@free-electrons.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Mike Turquette <mturquette@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Lior Amsalem <alior@marvell.com>, Tawfik Bayouk <tawfik@marvell.com>, Nadav Haklai <nadavh@marvell.com>, linux-gpio@vger.kernel.org, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Dear Stephen Boyd,

On Fri, 06 Feb 2015 11:57:58 -0800, Stephen Boyd wrote:

> > +static const char * const armada_39x_dt_compat[] = {
> 
>  __initconst?

Good idea. This wasn't done for the other mach-mvebu dt_compat tables,
so I've added a patch to do this as well for the other mach-mvebu
dt_compat tables.

Will be in v2.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
