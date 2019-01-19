From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v6 00/15] qcom: spmi: add support for hierarchical IRQ chip
Date: Sun, 20 Jan 2019 00:13:45 +0100
Message-ID: <CACRpkdaumxXfFW6SeMzrrQjX7hxc2PddC8=DuL_d9x7CH3ZwWA@mail.gmail.com>
References: <20190119204252.18370-1-masneyb@onstation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190119204252.18370-1-masneyb@onstation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Masney <masneyb@onstation.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <andy.gross@linaro.org>, Marc Zyngier <marc.zyngier@arm.com>, Shawn Guo <shawnguo@kernel.org>, Doug Anderson <dianders@chromium.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Nicolas Dechesne <nicolas.dechesne@linaro.org>, Niklas Cassel <niklas.cassel@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, linux-arm-msm@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Sat, Jan 19, 2019 at 9:43 PM Brian Masney <masneyb@onstation.org> wrote:

> This patch series adds hierarchical IRQ chip support to spmi-gpio so
> that device tree consumers can request an IRQ directly from the GPIO
> block rather than having to request an IRQ from the underlying PMIC.
>
> For more background information, see the email thread with Linus
> Walleij's excellent description of the problem at
> https://www.spinics.net/lists/linux-gpio/msg34655.html.
>
> This work was tested on a LG Nexus 5 (hammerhead) phone. My status page
> at https://masneyb.github.io/nexus-5-upstream/ describes what is working
> so far with the upstream kernel.
>
> Changes since v5:
> - Patch 4: Set handler to edge or level when the IRQ is mapped.
> - Patch 7: Change IRQ_TYPE_NONE to IRQ_TYPE_EDGE_RISING
> - Patch 14: New patch to validate type when mapping IRQ

If Marc Z is happy I think I will apply all patches on an immutable branch in
the pin control tree, so that ARM SoC and GPIO can pull it in later if need
be. (E.g. if they get conflicts.)

I was thinking to also include the DTS changes as it all is so neatly
coupled, then offer the branch to ARM SoC.

Anyone against?

Yours,
Linus Walleij
