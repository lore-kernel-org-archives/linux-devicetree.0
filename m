From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC] pinctrl: Provide a generic device tree binding for per-pin
 pin controllers
Date: Tue, 28 Oct 2014 18:02:23 +0100
Message-ID: <CACRpkdb+p5tyyZvARLA5R6oayezJNemLzYDjT-jzrtoPqW2qsA@mail.gmail.com>
References: <20141023132305.GG14443@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20141023132305.GG14443@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Sascha Hauer <s.hauer@pengutronix.de>, Stephen Warren <swarren@wwwdotorg.org>
Cc: Sascha Hauer <kernel@pengutronix.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 23, 2014 at 3:23 PM, Sascha Hauer <s.hauer@pengutronix.de> wrote:

> Most iomux controllers allow a configuration per pin. These currently
> have no common device tree binding. There are many different SoC
> specific bindings for this class of iomux controllers. Some controllers
> artificially group pins together where in hardware no groups exist (for
> example lantiq). Other controllers just put each pin into a separate
> group which explodes to many many strings to parse (Tegra30).

So I'd specifically like Stephen Warrens comments on this proposal,
as well as from everyone else doing per-pin device tree configs.

Yours,
Linus Walleij
