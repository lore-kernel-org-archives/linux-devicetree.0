From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 4/9] pinctrl: mvebu: add pinctrl driver for Armada 370
Date: Mon, 10 Sep 2012 08:43:18 -0700
Message-ID: <CACRpkdZ-Lw5V3knNaAfsvrrPqNoYezKTj6sCafjG_6mK35+szA@mail.gmail.com>
References: <1345623750-10645-1-git-send-email-sebastian.hesselbarth@gmail.com>
	<1347266386-16229-1-git-send-email-sebastian.hesselbarth@gmail.com>
	<1347266386-16229-5-git-send-email-sebastian.hesselbarth@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1347266386-16229-5-git-send-email-sebastian.hesselbarth@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Russell King <linux@arm.linux.org.uk>, Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Ben Dooks <ben.dooks@codethink.co.uk>, Stephen Warren <swarren@wwwdotorg.org>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, Sep 10, 2012 at 1:39 AM, Sebastian Hesselbarth
<sebastian.hesselbarth@gmail.com> wrote:

> From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>
> This pinctrl driver is not a full-blown pinctrl driver from scratch:
> it relies on the common pinctrl-mvebu driver, which is used for all
> Marvell EBU SoCs.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
> v2:
> - removed arch/arm/*/Kconfig changes and added note about variant = 0

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
