From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RESEND PATCH 1/2] dt-bindings: gpio: aspeed: Remove reference to
 clock name
Date: Tue, 15 Aug 2017 11:25:31 +0200
Message-ID: <CACRpkdbzU2=-ny962gZ+-3+Gdme3ohewfaqozkfk6q1Wy1dHKg@mail.gmail.com>
References: <20170808061634.11857-1-andrew@aj.id.au> <20170808061634.11857-2-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170808061634.11857-2-andrew@aj.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Joel Stanley <joel@jms.id.au>, Ryan Chen <ryan_chen@aspeedtech.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-aspeed@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Tue, Aug 8, 2017 at 8:16 AM, Andrew Jeffery <andrew@aj.id.au> wrote:

> HPLL was in fact not the clock we need. Remove prescription of which
> clock to avoid further error. Please refer to your datasheet and double
> check like I should have.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Patch applied with the ACKs.

Yours,
Linus Walleij
