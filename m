From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 01/11] pinctrl: mvebu: pinctrl driver core
Date: Mon, 20 Aug 2012 16:11:35 +0200
Message-ID: <CACRpkdZvjLx4+2CpgOemwWVfyFjFbRe-pzZbwAjExqHhQqBOjA@mail.gmail.com>
References: <1344689809-6223-1-git-send-email-sebastian.hesselbarth@gmail.com>
	<1344689809-6223-2-git-send-email-sebastian.hesselbarth@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1344689809-6223-2-git-send-email-sebastian.hesselbarth@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Russell King <linux@arm.linux.org.uk>, Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Ben Dooks <ben.dooks@codethink.co.uk>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Stephen Warren <swarren@wwwdotorg.org>
List-Id: devicetree@vger.kernel.org

On Sat, Aug 11, 2012 at 2:56 PM, Sebastian Hesselbarth
<sebastian.hesselbarth@gmail.com> wrote:

> This patch adds a pinctrl driver core for Marvell SoCs plus DT
> binding documentation. This core driver will be used by SoC family
> specific drivers, i.e. Armada XP, Armada 370, Dove, Kirkwood, aso.
(...)
> +config PINCTRL_MVEBU
> +       bool "Marvell SoC pin controller drivers"
> +       depends on ARCH_MVEBU

So altering earlier statements I suspect this should be simply:

depends on PLAT_ORION

Yours,
Linus Walleij
