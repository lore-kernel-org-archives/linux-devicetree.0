From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/9] pinctrl: qcom: ssbi-gpio: hardcode IRQ counts
Date: Wed, 6 Feb 2019 13:01:15 +0100
Message-ID: <CACRpkdb=xsWG+x6pQZYrnpubAiOEx7Bs-puhKMZcQPuvxjX5gw@mail.gmail.com>
References: <20190125162302.14036-1-masneyb@onstation.org> <20190125162302.14036-2-masneyb@onstation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190125162302.14036-2-masneyb@onstation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Masney <masneyb@onstation.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <andy.gross@linaro.org>, Marc Zyngier <marc.zyngier@arm.com>, Lee Jones <lee.jones@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Shawn Guo <shawnguo@kernel.org>, Doug Anderson <dianders@chromium.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Nicolas Dechesne <nicolas.dechesne@linaro.org>, Niklas Cassel <niklas.cassel@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, linux-arm-msm@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
List-Id: devicetree@vger.kernel.org

Hi Brian!

I found a second bug in this patch:

On Fri, Jan 25, 2019 at 5:23 PM Brian Masney <masneyb@onstation.org> wrote:

> -       npins = platform_irq_count(pdev);
(...)
> -       pctrl->npins = npins;

Do not lose this assignment of pctrl->npins.

pctrl->npins is used further down in the code and the gpiochip
does not probe because of zero pins. You could
get rid of the local variable npins and just use pctrl->npins
everywhere though.

Yours,
Linus Walleij
