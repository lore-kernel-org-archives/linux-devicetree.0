From: "Andrew Jeffery" <andrew@aj.id.au>
Subject: Re: [PATCH 0/8] pinctrl: aspeed: Preparation for AST2600
Date: Thu, 27 Jun 2019 10:38:44 +0930
Message-ID: <fa54f9a1-481e-4146-a4c2-7c43cf9a26e8@www.fastmail.com>
References: <20190626071430.28556-1-andrew@aj.id.au>
 <CACRpkdboxjMmeb8feffyG5JJ7fGPR6hqC8sc+XV5We3TC__LXg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdboxjMmeb8feffyG5JJ7fGPR6hqC8sc+XV5We3TC__LXg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Joel Stanley <joel@jms.id.au>, linux-aspeed@lists.ozlabs.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org



On Wed, 26 Jun 2019, at 17:25, Linus Walleij wrote:
> On Wed, Jun 26, 2019 at 9:15 AM Andrew Jeffery <andrew@aj.id.au> wrote:
> 
> > The ASPEED AST2600 is in the pipeline, and we have enough information to start
> > preparing to upstream support for it. This series lays some ground work;
> > splitting the bindings and dicing the implementation up a little further to
> > facilitate differences between the 2600 and previous SoC generations.
> 
> All looks good to me, but Rob should have a glance at the DT bindings
> and YAML syntax before I proceed to apply them.

Thanks for the quick review. Rob's responded, looks like I'll need to send a v2 at
least. Might need a hand sorting out describing generic pinctrl dt bits (subnodes
with function and group properties).

Cheers,

Andrew
