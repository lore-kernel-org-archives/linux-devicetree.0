From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/5] mfd: qcom-spmi-pmic: use devm_mfd_add_devices
 instead of devm_of_platform_populate
Date: Mon, 7 Jan 2019 11:53:07 +0100
Message-ID: <CACRpkdbLU_2JC1wT=M7EPsx6gPxL=poj2Ci8zTa++51K2qGZ4A@mail.gmail.com>
References: <20190107021145.6370-1-masneyb@onstation.org> <20190107021145.6370-3-masneyb@onstation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190107021145.6370-3-masneyb@onstation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Masney <masneyb@onstation.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <andy.gross@linaro.org>, Lee Jones <lee.jones@linaro.org>, Marc Zyngier <marc.zyngier@arm.com>, Shawn Guo <shawnguo@kernel.org>, Doug Anderson <dianders@chromium.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Nicolas Dechesne <nicolas.dechesne@linaro.org>, Niklas Cassel <niklas.cassel@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, linux-arm-msm@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 7, 2019 at 3:11 AM Brian Masney <masneyb@onstation.org> wrote:

> pmic_spmi_probe calls devm_of_platform_populate, which traverses all
> of the children in device tree from the parent down to the children,
> grandchildren, etc. of_irq_count is called on most of the nodes (via
> of_device_alloc) and this initializes all of the IRQs. Further along in
> the boot process, spmi-gpio is initialized as a hierarchical IRQ chip
> in a later patch (with spmi-arb as the parent IRQ domain), and the same
> hwirq is now associated with two Linux virqs and IRQs will not work as
> expected. Correct this issue by using devm_mfd_add_devices to initialize
> just the children so that IRQs are initialized on an as-needed basis.
>
> This patch also selects CONFIG_MFD_CORE since this is required by
> devm_mfd_add_devices.
>
> Signed-off-by: Brian Masney <masneyb@onstation.org>

Good catch! Now I see why this was acting so weird for you.
Also the MFD semantics are standardized and make much more
sense after this.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I suppose Lee can merge this in orthogonal in the MFD tree,
the end result will be functional after the v5.1 merge window.

I think I should also fix qcom-pm8xxx after this, as well as
the similar SSBI code for elder platforms.

Yours,
Linus Walleij
