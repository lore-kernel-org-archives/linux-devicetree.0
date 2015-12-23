From: Andy Gross <andy.gross@linaro.org>
Subject: Re: next-20151222 build: 3 failures 13 warnings (next-20151222)
Date: Tue, 22 Dec 2015 21:46:36 -0600
Message-ID: <20151223034636.GA4569@hector.tx.rr.com>
References: <E1aBIky-0007nI-7t@optimist>
 <20151222122228.GL5727@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20151222122228.GL5727@sirena.org.uk>
Sender: linux-next-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Andy Gross <agross@codeaurora.org>, =?iso-8859-1?Q?Bj=F6rn?= Andersson <bjorn.andersson@sonymobile.com>, Linus Walleij <linus.walleij@linaro.org>, "Ivan T. Ivanov" <iivanov@mm-sol.com>, kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Dec 22, 2015 at 12:22:28PM +0000, Mark Brown wrote:
> On Tue, Dec 22, 2015 at 08:57:20AM +0000, Build bot for Mark Brown wrote:
> 
> Today's linux-next fails to link an arm64 allmodconfig due to:
> 
> > ERROR: "of_irq_count" [drivers/pinctrl/qcom/pinctrl-ssbi-mpp.ko] undefined!
> > ERROR: "of_irq_count" [drivers/pinctrl/qcom/pinctrl-ssbi-gpio.ko] undefined!
> > ERROR: "of_irq_count" [drivers/pinctrl/qcom/pinctrl-spmi-mpp.ko] undefined!
> > ERROR: "of_irq_count" [drivers/pinctrl/qcom/pinctrl-spmi-gpio.ko] undefined!
> 
> which are caused by ab4256cfeab91569 (pinctrl: qcom: pmic-gpio/mpp:
> of_irq_count() == npins) which adds uses of irq_of_count() but that is
> not exported so can't be used in modules.  I've just sent a patch adding
> the export.

Thanks for fixing that Mark.  I had seen it in the pinctrl builds but hadn't
gotten the screen time to send in a fix.
