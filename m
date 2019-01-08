From: Brian Masney <masneyb@onstation.org>
Subject: Re: [PATCH v2 4/5] qcom: spmi-gpio: add support for hierarchical IRQ
 chip
Date: Tue, 8 Jan 2019 05:35:45 -0500
Message-ID: <20190108103545.GB3643@basecamp>
References: <20190107021145.6370-1-masneyb@onstation.org>
 <20190107021145.6370-5-masneyb@onstation.org>
 <154689814280.15366.2705028033847856491@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <154689814280.15366.2705028033847856491@swboyd.mtv.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: andy.gross@linaro.org, bjorn.andersson@linaro.org, lee.jones@linaro.org, linus.walleij@linaro.org, marc.zyngier@arm.com, shawnguo@kernel.org, dianders@chromium.org, linux-gpio@vger.kernel.org, nicolas.dechesne@linaro.org, niklas.cassel@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Jan 07, 2019 at 01:55:42PM -0800, Stephen Boyd wrote:
> > +       ret = pmic_gpio_domain_translate(domain, fwspec, &hwirq, &type);
> > +       if (ret)
> > +               return ret;
> > +
> > +       for (i = 0; i < nr_irqs; i++)
> > +               irq_domain_set_info(domain, virq + i, hwirq + i,
> > +                                   &pmic_gpio_irq_chip, state,
> > +                                   handle_level_irq, NULL, NULL);
> > +
> > +       parent_fwspec.fwnode = domain->parent->fwnode;
> > +       parent_fwspec.param_count = 4;
> > +       parent_fwspec.param[0] = 0;
> > +       parent_fwspec.param[1] = fwspec->param[0] + 0xc0 - 1;
> 
> Is the -1 there twice, once in pmic_gpio_domain_translate() and then
> here?

That should be 'hwirq + c0' to improve the code readability.

Brian
