From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH RESEND v1 2/5] drivers: pinctrl: msm: enable PDC interrupt only
 during suspend
Date: Tue, 04 Sep 2018 15:00:36 -0700
Message-ID: <153609843656.119890.7258329648640765778@swboyd.mtv.corp.google.com>
References: <20180817191026.32245-1-ilina@codeaurora.org>
 <20180817191026.32245-3-ilina@codeaurora.org>
 <153509896098.28926.3622217918056498792@swboyd.mtv.corp.google.com>
 <20180824171432.GM5081@codeaurora.org>
 <153540005334.129321.18196967002233663397@swboyd.mtv.corp.google.com>
 <20180904210934.GA23990@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180904210934.GA23990@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lina Iyer <ilina@codeaurora.org>
Cc: bjorn.andersson@linaro.org, evgreen@chromium.org, linus.walleij@linaro.org, marc.zyngier@arm.com, rplsssn@codeaurora.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, rnayak@codeaurora.org, devicetree@vger.kernel.org, andy.gross@linaro.org, dianders@chromium.org
List-Id: devicetree@vger.kernel.org

Quoting Lina Iyer (2018-09-04 14:09:34)
> On Mon, Aug 27 2018 at 14:01 -0600, Stephen Boyd wrote:
> >
> >Can't we just configure a different chained IRQ handler with
> >irq_set_chained_handler_and_data() for each of the GPIO IRQs that are
> >handled by PDC to be the interrupts provide by the PDC irq controller
> >that match the GPIOs? And then set their parent irq with
> >irq_set_parent() for completeness? And also move those GPIOs from the
> >existing msm_gpio irqchip to a different PDC gpio irqchip that does
> >nothing besides push irqchip calls up to the PDC irqchip? Then we don't
> >even have to think about resending anything and we can rely on PDC to do
> >all the interrupt sensing all the time but still provide the irqs from
> >the GPIO controller.
> >
> Seems like the irqchips need to be in hierarchy for this to work, which
> is not the case with TLMM and the PDC, currently.
> =


Why? Does something mandate that the chained irq is also the
hierarchical parent irqchip?
