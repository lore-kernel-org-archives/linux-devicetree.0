From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/9] mfd: pm8xxx: convert to v2 irq interfaces to support
 hierarchical IRQ chips
Date: Wed, 6 Feb 2019 15:37:47 +0100
Message-ID: <CACRpkdYSW0jNEevduPwN_4T8evihh9yEUQyQpAao6fBjEBRVhg@mail.gmail.com>
References: <20190125162302.14036-1-masneyb@onstation.org> <20190125162302.14036-4-masneyb@onstation.org>
 <CACRpkdZMe+JEQOa1yBfOoAErrC41Q9rggwxNb=_uwq1m2QKWyw@mail.gmail.com> <20190206141034.GA5833@basecamp>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190206141034.GA5833@basecamp>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Masney <masneyb@onstation.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <andy.gross@linaro.org>, Marc Zyngier <marc.zyngier@arm.com>, Lee Jones <lee.jones@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Shawn Guo <shawnguo@kernel.org>, Doug Anderson <dianders@chromium.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Nicolas Dechesne <nicolas.dechesne@linaro.org>, Niklas Cassel <niklas.cassel@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, linux-arm-msm@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
List-Id: devicetree@vger.kernel.org

On Wed, Feb 6, 2019 at 3:10 PM Brian Masney <masneyb@onstation.org> wrote:

> Thank you for testing all of this on actual hardware. You can either
> send out the little issues like this that need corrected and I'll
> collect everything up, and send out a V2 once you are done with testing.
> Or, you can just take my patches, incorporate the fixes, and add me
> with a Co-developed-by tag to the relevant patches. Whatever is easier
> for you. I assume that the latter approach may be easier since you're
> already making the changes in your tree for testing.

Well there are some remarks from Marc you need to address in v2
as well so you better keep the master patch set for now.

I can copy/paste the diff I have though, but there is some bug
I still need to dig into...

Yours,
Linus Walleij
