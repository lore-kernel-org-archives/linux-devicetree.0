From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/8] pinctrl: aspeed: Preparation for AST2600
Date: Wed, 26 Jun 2019 09:54:50 +0200
Message-ID: <CACRpkdboxjMmeb8feffyG5JJ7fGPR6hqC8sc+XV5We3TC__LXg@mail.gmail.com>
References: <20190626071430.28556-1-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190626071430.28556-1-andrew@aj.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Jeffery <andrew@aj.id.au>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Joel Stanley <joel@jms.id.au>, linux-aspeed@lists.ozlabs.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jun 26, 2019 at 9:15 AM Andrew Jeffery <andrew@aj.id.au> wrote:

> The ASPEED AST2600 is in the pipeline, and we have enough information to start
> preparing to upstream support for it. This series lays some ground work;
> splitting the bindings and dicing the implementation up a little further to
> facilitate differences between the 2600 and previous SoC generations.

All looks good to me, but Rob should have a glance at the DT bindings
and YAML syntax before I proceed to apply them.

Yours,
Linus Walleij
