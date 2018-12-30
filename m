From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/3] qcom: spmi: add support for hierarchical IRQ chip
Date: Sun, 30 Dec 2018 21:11:29 +0100
Message-ID: <CACRpkdY8SvDUqHaem+wgV_xynzyWVqLnv5705mBEZ_SOuD_45g@mail.gmail.com>
References: <20181229114755.8711-1-masneyb@onstation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181229114755.8711-1-masneyb@onstation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Masney <masneyb@onstation.org>, Stephen Boyd <sboyd@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <andy.gross@linaro.org>, Marc Zyngier <marc.zyngier@arm.com>, Shawn Guo <shawnguo@kernel.org>, Doug Anderson <dianders@chromium.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Nicolas Dechesne <nicolas.dechesne@linaro.org>, Niklas Cassel <niklas.cassel@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, linux-arm-msm@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Sat, Dec 29, 2018 at 12:48 PM Brian Masney <masneyb@onstation.org> wrote:

> This patch series adds hierarchical IRQ chip support to spmi-gpio so
> that device tree consumers can request an IRQ directly from the GPIO
> block rather than having to request an IRQ from the underlying PMIC.
> The first patch in this series converts pmic-arb to use the version 2
> IRQ interface and patches 2 and 3 add support for the hierarchical
> IRQ chip to spmi-gpio.

Very nice stuff!

> The patches need to be applied in the order that I have them in order
> to allow for a proper bisection, however part of the series can be
> applied without any breakage. Maybe the spmi-arb change can go in
> for v4.21 and the spmi-gpio changes can go in for v4.22?

I'm fairly sure the SPMI maintainer (Stephen Boyd) can just ACK the
patch once he's happy with it and I can then apply it all to
the pin control tree.

> This work was tested on a LG Nexus 5 (hammerhead) phone. My status page
> at https://masneyb.github.io/nexus-5-upstream/ describes what is working
> so far with an upstream kernel.

I'm a big fan of your work. I have a few of these devices as well,
so the day I manage to create a serial cable for it, I'll gladly test
this stuff and see what I can add.

Yours,
Linus Walleij
