From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCH v4 00/10] pinctrl: mvebu: pinctrl driver
Date: Thu, 13 Sep 2012 17:48:34 +0200
Message-ID: <20120913174834.79727630@skate>
References: <1344689809-6223-1-git-send-email-sebastian.hesselbarth@gmail.com>
	<1347550912-18021-1-git-send-email-sebastian.hesselbarth@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1347550912-18021-1-git-send-email-sebastian.hesselbarth@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Russell King <linux@arm.linux.org.uk>, Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Ben Dooks <ben.dooks@codethink.co.uk>, Linus Walleij <linus.walleij@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Dear Sebastian Hesselbarth,

On Thu, 13 Sep 2012 17:41:42 +0200, Sebastian Hesselbarth wrote:

> This patch set adds a core pinctrl driver for Marvell MVEBU SoCs and
> SoC specific stubs for Armada 370, Armada XP, Dove, and Kirkwood.
> The SoC specific stubs use the pinctrl-mvebu core driver that handles
> pinctrl API and register accesses for common pinctrl registers.
> 
> As especially Dove has some pinctrl registers that do not match the
> common pinctrl register layout the core driver has been extended by
> some callbacks to allow uncommon Dove pinctrl registers.
> 
> DT binding documentation is added for all supported SoCs but as
> Dove and Kirkwood are not yet ready for full DT support, the pinctrl
> driver is only activated for Armada 370 and XP.
> 
> The driver of latest patch v4 has been tested on Dove, Armada 370, 
> Armada XP, and 88f6281 variant of Kirkwood.

I confirm the testing of this v4 of the patch set on Armada 370 and
Armada XP, so for the whole series:

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Tested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
