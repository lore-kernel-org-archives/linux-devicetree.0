From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 07/10] pinctrl: mvebu: add pinctrl driver for Marvell
 Armada 39x
Date: Wed, 4 Mar 2015 13:54:42 +0100
Message-ID: <CACRpkdZH9vUPR65Yw65LKHns8_b3vM+1ARoks2j73WV2WmAExQ@mail.gmail.com>
References: <1423238276-9206-1-git-send-email-thomas.petazzoni@free-electrons.com>
	<1423238276-9206-8-git-send-email-thomas.petazzoni@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1423238276-9206-8-git-send-email-thomas.petazzoni@free-electrons.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory Clement <gregory.clement@free-electrons.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Tawfik Bayouk <tawfik@marvell.com>, Nadav Haklai <nadavh@marvell.com>, Lior Amsalem <alior@marvell.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Maxime Ripard <maxime.ripard@free-electrons.com>
List-Id: devicetree@vger.kernel.org

On Fri, Feb 6, 2015 at 4:57 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:

> This commit adds a new pinctrl driver for the Marvell Armada 39x
> family of processors, which hooks into the existing infrastructure to
> support pin-muxing on Marvell EBU processors. Two variants of the
> Armada 39x are supported: 88F6920 (Armada 390) and 88F6928 (Armada
> 398), which have a few differences in the available functions for
> certain pins.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Patch applied.

Yours,
Linus Walleij
