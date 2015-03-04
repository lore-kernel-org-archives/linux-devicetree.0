From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCH 07/10] pinctrl: mvebu: add pinctrl driver for Marvell
 Armada 39x
Date: Wed, 4 Mar 2015 14:05:25 +0100
Message-ID: <20150304140525.711d1515@free-electrons.com>
References: <1423238276-9206-1-git-send-email-thomas.petazzoni@free-electrons.com>
	<1423238276-9206-8-git-send-email-thomas.petazzoni@free-electrons.com>
	<CACRpkdZH9vUPR65Yw65LKHns8_b3vM+1ARoks2j73WV2WmAExQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdZH9vUPR65Yw65LKHns8_b3vM+1ARoks2j73WV2WmAExQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory Clement <gregory.clement@free-electrons.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Tawfik Bayouk <tawfik@marvell.com>, Nadav Haklai <nadavh@marvell.com>, Lior Amsalem <alior@marvell.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Maxime Ripard <maxime.ripard@free-electrons.com>
List-Id: devicetree@vger.kernel.org

Dear Linus Walleij,

On Wed, 4 Mar 2015 13:54:42 +0100, Linus Walleij wrote:
> On Fri, Feb 6, 2015 at 4:57 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
> 
> > This commit adds a new pinctrl driver for the Marvell Armada 39x
> > family of processors, which hooks into the existing infrastructure to
> > support pin-muxing on Marvell EBU processors. Two variants of the
> > Armada 39x are supported: 88F6920 (Armada 390) and 88F6928 (Armada
> > 398), which have a few differences in the available functions for
> > certain pins.
> >
> > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> Patch applied.

I'm surprised you applied the driver of the first iteration of the
patches, and not the v3 I sent just yesterday. Even though if I
remember correctly there were no changes on the pinctrl driver itself.

Also, can you apply:

  devicetree: bindings: add Device Tree bindings for Armada 39x pin-muxing controller

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
