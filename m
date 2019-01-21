Return-Path: <SRS0=chu1=P5=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-lf1-f68.google.com ([209.85.167.68]:35472 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728722AbfAUNNo (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 21 Jan 2019 08:13:44 -0500
Received: by mail-lf1-f68.google.com with SMTP id e26so15464567lfc.2
        for <devicetree@vger.kernel.org>; Mon, 21 Jan 2019 05:13:43 -0800 (PST)
MIME-Version: 1.0
References: <20190108162843.6194-1-miquel.raynal@bootlin.com>
In-Reply-To: <20190108162843.6194-1-miquel.raynal@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 21 Jan 2019 14:13:30 +0100
Message-ID: <CACRpkdbin-bV4_PYkoRmknNXAGN2X6tnHPpQUJm73PWiSrK=FQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: armada-37xx: change suspend/resume time
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Gregory Clement <gregory.clement@bootlin.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Antoine Tenart <antoine.tenart@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Tue, Jan 8, 2019 at 5:28 PM Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Armada 3700 PCIe IP relies on the pinctrl IP managed by this
> driver. For reasons related to the PCI core's organization when
> suspending/resuming, PCI host controller drivers must reconfigure
> their register at suspend_noirq()/resume_noirq() which happens after
> suspend()/suspend_late() and before resume_early()/resume().
>
> In the current state, after resuming from a suspend to RAM cycle the
> PCIe IP is reconfigured before the pinctrl one which produces an
> interrupt storm. The solution to support PCIe resume operation is to
> change the "priority" of this pinctrl driver PM callbacks to
> "_noirq()".
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Patch applied with Gregory's ACK!

Yours,
Linus Walleij
