From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 4/4] gpio: aspeed: Add open-source and open-drain support
Date: Mon, 24 Apr 2017 14:52:21 +0200
Message-ID: <CACRpkdb2ABf5ZttSA78dRKLB7L3y2g4W5-Ef932AiG__V21uvw@mail.gmail.com>
References: <20170407125902.15960-1-andrew@aj.id.au> <20170407125902.15960-5-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170407125902.15960-5-andrew@aj.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

On Fri, Apr 7, 2017 at 2:59 PM, Andrew Jeffery <andrew@aj.id.au> wrote:

> As per the datasheet, manage the IO and value states to implement
> open-source/open-drain, but do this by falling back to gpiolib's
> emulation.
>
> This commit simply makes the behaviour explicit for clarity, rather than
> relying on the implicit return of -ENOTSUPP to trigger the emulation.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Patch applied.

Yours,
Linus Walleij
