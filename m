From: Brian Masney <masneyb@onstation.org>
Subject: Re: [PATCH v4 03/14] pinctrl: qcom: spmi-gpio: hardcode IRQ counts
Date: Mon, 14 Jan 2019 20:14:32 -0500
Message-ID: <20190115011432.GA7900@basecamp>
References: <20190113154716.5145-1-masneyb@onstation.org>
 <20190113154716.5145-4-masneyb@onstation.org>
 <20190115003428.GJ9278@minitux>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190115003428.GJ9278@minitux>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linus.walleij@linaro.org, sboyd@kernel.org, andy.gross@linaro.org, marc.zyngier@arm.com, shawnguo@kernel.org, dianders@chromium.org, linux-gpio@vger.kernel.org, nicolas.dechesne@linaro.org, niklas.cassel@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Jan 14, 2019 at 04:34:28PM -0800, Bjorn Andersson wrote:
> > -	npins = platform_irq_count(pdev);
> > -	if (!npins)
> > -		return -EINVAL;
> > -	if (npins < 0)
> > -		return npins;
> > -
> > -	BUG_ON(npins > ARRAY_SIZE(pmic_gpio_groups));
> > +	npins = (u16)(uintptr_t) device_get_match_data(&pdev->dev);
> 
> Why u16, afaict npins is an int? I'm pretty sure you can leave the last
> cast as implicit and as it's not actually a pointer that we're acquiring
> casting it to "unsigned long" is the idiomatic way.
> 
> Apart from this the change looks good.
> 
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

I can change it to this:

npins = (uintptr_t) device_get_match_data(&pdev->dev);

I'll send out V5 on Wednesday evening (GMT-5) to give time for any other
reviews that may trickle in.

Thanks Bjorn, Stephen, and Linus for the reviews. This was a fun task; I
learned a lot working on it.

I'll also convert SSBI based on this series.

Brian
