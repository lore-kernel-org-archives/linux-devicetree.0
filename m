From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v4 06/14] spmi: pmic-arb: disassociate old virq if hwirq mapping already exists
Date: Mon, 14 Jan 2019 15:50:37 -0800
Message-ID: <154750983758.169631.7250053254022211406@swboyd.mtv.corp.google.com>
References: <20190113154716.5145-1-masneyb@onstation.org> <20190113154716.5145-7-masneyb@onstation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190113154716.5145-7-masneyb@onstation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Masney <masneyb@onstation.org>, andy.gross@linaro.org, bjorn.andersson@linaro.org, linus.walleij@linaro.org
Cc: marc.zyngier@arm.com, shawnguo@kernel.org, dianders@chromium.org, linux-gpio@vger.kernel.org, nicolas.dechesne@linaro.org, niklas.cassel@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Brian Masney (2019-01-13 07:47:08)
> Check to see if the hwirq is already associated with another virq on
> this IRQ domain. If so, then disassociate it before associating the
> hwirq with the new virq.
>=20
> This is a temporary hack that is needed in order to not break git
> bisect for existing boards. The next patch in this series converts
> spmi-gpio to be a hierarchical IRQ chip, then there are several patches
> to update all of the device tree files, and finally this patch will be
> reverted within the same patch series.
>=20
> IRQs for spmi-gpio are all initially setup without an IRQ hierarchy
> on pmic-arb when mfd/qcom-spmi-pmic.c is probed (via the
> devm_of_platform_populate call) due to the interrupts property in
> device tree. Once spmi-gpio is converted to be a hierarchical IRQ chip
> in the next patch, existing users of gpio[d]_to_irq() will call
> pmic_gpio_to_irq(), and that will use the new IRQ chip code in
> spmi-gpio that sets up the IRQ in an IRQ hierarchy. The hwirq is now
> associated with two Linux virqs and interrupts will not work as
> expected. This patch corrects that issue.
>=20
> Driver was tested using gpio-keys and iadc/vadc on the LG Nexus 5
> (hammerhead) phone.
>=20
> Signed-off-by: Brian Masney <masneyb@onstation.org>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
