From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/4] gpio: aspeed: dt: Add optional clocks property
Date: Mon, 24 Apr 2017 14:47:32 +0200
Message-ID: <CACRpkdbXiRhLhVqA3TN6KC0ESA=5Zuqw_AHPJZZkLodZ__PxDQ@mail.gmail.com>
References: <20170407125902.15960-1-andrew@aj.id.au> <20170407125902.15960-3-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20170407125902.15960-3-andrew@aj.id.au>
Sender: linux-gpio-owner@vger.kernel.org
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

On Fri, Apr 7, 2017 at 2:59 PM, Andrew Jeffery <andrew@aj.id.au> wrote:

> We need a reference to the HPLL to calculate debounce cycles. If the
> clocks property is not supplied in the GPIO node then the consumer
> should deny any debounce requests.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Patch applied with Rob's ACK.

Yours,
Linus Walleij
