From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/3] ARM: dts: aspeed: Deprecate g[45]-style compatibles
Date: Mon, 29 Jul 2019 23:53:04 +0200
Message-ID: <CACRpkdapypySGPrLgSMSNy1fzkca2BfMUGzf3koFWQZ-M5VOvg@mail.gmail.com>
References: <20190724081313.12934-1-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190724081313.12934-1-andrew@aj.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Jeffery <andrew@aj.id.au>
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>, Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Joel Stanley <joel@jms.id.au>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 24, 2019 at 10:13 AM Andrew Jeffery <andrew@aj.id.au> wrote:

> It's probably best if we push the three patches all through one tree rather
> than fragmenting. Is everyone happy if Joel applies them to the aspeed tree?

If you are sure it will not collide with parallell work in the
pinctrl tree, yes.
Acked-by: Linus Walleij <linus.walleij@linaro.org>

(If it does collide I'd prefer to take the pinctrl patches and fix the
conflicts in my tree.)

Yours,
Linus Walleij
