From: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [PATCH 04/11] pinctrl: mvebu: add pinctrl driver for Armada 370
Date: Mon, 20 Aug 2012 18:48:32 +0200
Message-ID: <50326A60.1070007@gmail.com>
References: <1344689809-6223-1-git-send-email-sebastian.hesselbarth@gmail.com> <1344689809-6223-5-git-send-email-sebastian.hesselbarth@gmail.com> <CACRpkdYNZar7865-T12J37h3AWA9-8R1R5tymuOhaB0b3ddEAA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <CACRpkdYNZar7865-T12J37h3AWA9-8R1R5tymuOhaB0b3ddEAA@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Russell King <linux@arm.linux.org.uk>, Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Ben Dooks <ben.dooks@codethink.co.uk>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Stephen Warren <swarren@wwwdotorg.org>
List-Id: devicetree@vger.kernel.org

On 08/20/2012 04:25 PM, Linus Walleij wrote:
>> +config PINCTRL_ARMADA_370
>> +       bool "Support for Marvell Armada 370 SoCs"
>> +       depends on PINCTRL_MVEBU
>> +       depends on MACH_ARMADA_370_XP
>
> select PINCTRL_MVEBU simply?
>
> And then have the Armada Kconfig
>
> select PINCTRL
> select PINCTRL_ARMADA_370

Linus, Thomas, Gregory,

this is really difficult here ;) I thought I could just add PINCTRL_DOVE
to MACH_DOVE inside ARCH_MVEBU, PINCTRL_KIRKWOOD to MACH_KIRKWOOD, aso.
But there is a common MACH_ARMADA_370_XP for both 370 and XP obviously.

If it is ok for you I will add both PINCTRL_ stubs to the Kconfig and
you work it out if you ever have two distinct MACHs? Or it could remain
selectable in pinctrl/Kconfig but that will then be different with the
other stubs.

Sebastian
