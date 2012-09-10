From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 2/9] pinctrl: mvebu: dove pinctrl driver
Date: Mon, 10 Sep 2012 08:40:57 -0700
Message-ID: <CACRpkdYo-FW6spzueZWYZC6=-twu1jsPeWzS1999Uvcnm8cV8Q@mail.gmail.com>
References: <1345623750-10645-1-git-send-email-sebastian.hesselbarth@gmail.com>
	<1347266386-16229-1-git-send-email-sebastian.hesselbarth@gmail.com>
	<1347266386-16229-3-git-send-email-sebastian.hesselbarth@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1347266386-16229-3-git-send-email-sebastian.hesselbarth@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Russell King <linux@arm.linux.org.uk>, Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Ben Dooks <ben.dooks@codethink.co.uk>, Stephen Warren <swarren@wwwdotorg.org>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, Sep 10, 2012 at 1:39 AM, Sebastian Hesselbarth
<sebastian.hesselbarth@gmail.com> wrote:

> This patch adds a SoC specific pinctrl driver for Marvell Dove SoCs
> plus DT binding documentation. This driver will use the mvebu pinctrl
> driver core.
>
> Signed-off-by: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
> ---
> v2:
> - restructured pinctrl/Kconfig to hide pinctrl driver as it will be
>   always selected by arch/arm/mach-mvebu/Kconfig
> - cleaned pinctrl-dove and replaced 'magic numbers' by defines
> - use devm_clk_get for (now optional) pdma clock and add to required
>   properties in devicetree binding documentation

Nice work!
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
