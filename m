From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/2] pinctrl: Allow indicating loss of pin states
 during low-power
Date: Wed, 29 Nov 2017 14:01:18 +0100
Message-ID: <CACRpkdZtFRB_iy1bDPZ0wkK0jf7pkTGtbZG4gQUJVR+eiO+dhA@mail.gmail.com>
References: <20171102231551.16220-1-f.fainelli@gmail.com> <20171102231551.16220-3-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20171102231551.16220-3-f.fainelli@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>, ext Tony Lindgren <tony@atomide.com>
Cc: linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, Charles Keepax <ckeepax@opensource.cirrus.com>, Charles Keepax <ckeepax@opensource.wolfsonmicro.com>, Stephen Warren <swarren@nvidia.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Al Cooper <alcooperx@gmail.com>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 3, 2017 at 12:15 AM, Florian Fainelli <f.fainelli@gmail.com> wrote:

> Some platforms (e.g: Broadcom STB: BMIPS_GENERIC/ARCH_BRCMSTB) will lose
> their register contents when entering their lower power state. In such a
> case, the pinctrl-single driver that is used will not be able to restore
> the power states without telling the core about it and having
> pinctrl_select_state() check for that.
>
> This patch adds a new optional boolean property that Device Tree can
> define in order to obtain exactly that and having the core pinctrl code
> take that into account.
>
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

Florian, I'm really sorry for losing track of this patch set, it's
important stuff and I see why systems are dependent on something
like this.

Tony: can you look at this from a pinctrl-single point of view?
This is the intended consumer: pinctrl-single users that lose the
hardware state over suspend/resume.

How do you see this working with other pinctrl-single users?

Yours,
Linus Walleij
