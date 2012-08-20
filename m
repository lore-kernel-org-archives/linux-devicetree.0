From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 00/11] pinctrl: mvebu: pinctrl driver
Date: Mon, 20 Aug 2012 10:12:31 +0200
Message-ID: <CACRpkdZn73M_5rciZhpTTidMpwfMSZqb+wZnY5FkgztK2YBFiQ@mail.gmail.com>
References: <1344689809-6223-1-git-send-email-sebastian.hesselbarth@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1344689809-6223-1-git-send-email-sebastian.hesselbarth@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Russell King <linux@arm.linux.org.uk>, Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Ben Dooks <ben.dooks@codethink.co.uk>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Stephen Warren <swarren@wwwdotorg.org>
List-Id: devicetree@vger.kernel.org

On Sat, Aug 11, 2012 at 2:56 PM, Sebastian Hesselbarth
<sebastian.hesselbarth@gmail.com> wrote:

> This patch set adds a core pinctrl driver for Marvell MVEBU SoCs and
> SoC specific stubs for Armada 370, Armada XP, Dove, and Kirkwood.
> The SoC specific stubs use the pinctrl-mvebu core driver that handles
> pinctrl API and register accesses for common pinctrl registers.

Nice! I'll now go in and review it.

Please add Stephen Warren <swarren@wwwdotorg.org> on CC for
subsequent iterations.

Yours,
Linus Walleij
