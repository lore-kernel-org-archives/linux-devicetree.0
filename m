From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/2] gpio: Add Cadence GPIO driver
Date: Mon, 17 Dec 2018 23:21:47 +0100
Message-ID: <CACRpkdYq5Eg2DrwdED-yTZ4kMoCxew+0rdU-b4zuinOf7BEr6Q@mail.gmail.com>
References: <20181217153652.20056-1-jank@cadence.com> <20181217153652.20056-3-jank@cadence.com>
 <CAMpxmJXrjyK3m4JwgkxwkHjSj-ugb7UzwNrYcBwYjWwj+JBNxw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMpxmJXrjyK3m4JwgkxwkHjSj-ugb7UzwNrYcBwYjWwj+JBNxw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Jan Kotas <jank@cadence.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-gpio <linux-gpio@vger.kernel.org>, linux-devicetree <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Dec 17, 2018 at 4:51 PM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:

> The driver looks good but is there any particular reason not to use
> regmap for register IO?

I thought we only use regmap for MMIO when the register range is
shared (as in a system controller) so that some registers are for this,
some register or even bits in a register for some other driver, so they
need the spinlock in the regmap to protect the register range.

It is also nice for shadowing/caching of register contents I guess,
wat does this driver get from regmap MMIO?

Yours,
Linus Walleij
