From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/3] gpiolib-of: Support 'reserved-gpio-ranges' property
Date: Wed, 7 Feb 2018 14:34:19 +0100
Message-ID: <CACRpkda2_nt24pweyQTtB_9gypDJTK1NHRm1LjsinEaK-G8F_Q@mail.gmail.com>
References: <20180126011400.2191-1-sboyd@codeaurora.org> <20180126011400.2191-3-sboyd@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20180126011400.2191-3-sboyd@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-arm-msm@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, Timur Tabi <timur@codeaurora.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-gpio@vger.kernel.org, Grant Likely <grant.likely@secretlab.ca>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Stephen,

nice work!

On Fri, Jan 26, 2018 at 2:13 AM, Stephen Boyd <sboyd@codeaurora.org> wrote:

> For now, we plumb this into the gpiochip irq APIs so that
> GPIO/pinctrl drivers can use the gpiochip_irqchip_irq_valid() to
> test validity of GPIOs.

But is that the right thing to do, given that we just took the
trouble to define a DT binding that is explicitly about
any GPIO, not just IRQ capable ones?

I am worries that the *irq* infix etc on these functions
will be a bit confusing.

Is it a lot of work to make it just generic and maybe bake it
into the gpio_chip so as to refuse already in
gpiod_request_commit() in gpiolib already?

Yours,
Linus Walleij
