Return-Path: <SRS0=cWXf=RA=vger.kernel.org=devicetree-owner@kernel.org>
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:37529 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726675AbfBYPFk (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 25 Feb 2019 10:05:40 -0500
Date: Mon, 25 Feb 2019 16:05:35 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 0/4] Prepare Armada 3700 PCIe suspend to RAM support
Message-ID: <20190225160535.3395c680@xps13>
In-Reply-To: <20181123094444.27956-1-miquel.raynal@bootlin.com>
References: <20181123094444.27956-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: devicetree-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Antoine Tenart <antoine.tenart@bootlin.com>, Gregory Clement <gregory.clement@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>
List-ID: <devicetree@vger.kernel.org>

Hi Stephen,

Miquel Raynal <miquel.raynal@bootlin.com> wrote on Fri, 23 Nov 2018
10:44:39 +0100:

> Hello,
> 
> As part of an effort to bring suspend to RAM support to the Armada
> 3700 SoC (main target: ESPRESSObin board), there are small things to
> do in the Armada 3700 peripherals clock driver:
> 
> * On this SoC, the PCIe controller gets fed by a gated clock in the
>   south bridge. This clock is missing in the current driver, patch 1
>   adds it.
> 
> * Because of a constraint in the PCI core, the resume function of a
>   PCIe controller driver must be run at an early stage
>   (->suspend/resume_noirq()), before the core tries to ->read/write()
>   in the PCIe registers to do more configuration. Hence, the PCIe
>   clock must be resumed before. This is enforced thanks to two
>   changes:
>   1/ Add device links to the clock framework. This enforce order in
>      the PM core: the clocks are resumed before the consumers. Series
>      has been posted, see [1].
>   2/ Even with the above feature, the clock's resume() callback is
>      called after the PCI controller's resume_noirq() callback. The
>      only way to fix this is to change the "priority" of the clock
>      suspend/resume callbacks. This is done in patch 2.
> 
> * The bindings are updated with the PCI clock in patch 4 while patch 3
>   is just a typo correction in the same file.
> 
> If there is anything unclear please feel free to ask.
> 
> [1] http://lists.infradead.org/pipermail/linux-arm-kernel/2018-November/614527.html

This series does not depend on the clock device links work so I
wonder if you are still considering it?


Thanks,
Miquèl
