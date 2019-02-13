From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 00/11] qcom: ssbi-gpio: add support for hierarchical
 IRQ chip
Date: Wed, 13 Feb 2019 09:38:23 +0100
Message-ID: <CACRpkdYHK1qwcy3AzRjwC1A_FB3ns9T7O_UnCgbtk30Nx=S8+A@mail.gmail.com>
References: <20190208021631.30252-1-masneyb@onstation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190208021631.30252-1-masneyb@onstation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Masney <masneyb@onstation.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <andy.gross@linaro.org>, Marc Zyngier <marc.zyngier@arm.com>, Lee Jones <lee.jones@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Shawn Guo <shawnguo@kernel.org>, Doug Anderson <dianders@chromium.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Nicolas Dechesne <nicolas.dechesne@linaro.org>, Niklas Cassel <niklas.cassel@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, linux-arm-msm@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
List-Id: devicetree@vger.kernel.org

On Fri, Feb 8, 2019 at 3:16 AM Brian Masney <masneyb@onstation.org> wrote:

> This patch series adds hierarchical IRQ chip support to ssbi-gpio so
> that device tree consumers can request an IRQ directly from the GPIO
> block rather than having to request an IRQ from the underlying PMIC.
>
> For more background information, see the email thread with Linus
> Walleij's excellent description of the problem at
> https://www.spinics.net/lists/linux-gpio/msg34655.html.
>
> These changes were tested by Linus Walleij on an APQ8060 DragonBoard.
>
> See the notes on the individual patches for the changelog.

SInce we have definitive ACKs from the irqchip and
MFD maintainers I have queued this series on an immutable branch
that I will merge for v5.1 and offer to the MFD and ARM SoC
once it builds fine on the test servers.

I don't think the Qcom maintainers will complain.

Yours,
Linus Walleij
