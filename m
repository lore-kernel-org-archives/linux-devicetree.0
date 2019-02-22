From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 05/11] mfd: pm8xxx: disassociate old virq if hwirq
 mapping already exists
Date: Fri, 22 Feb 2019 10:07:44 +0100
Message-ID: <CACRpkdbFQ2B7AvVW38etdsq-R38p5uX7eMrD2oKxTtDE3_W5aA@mail.gmail.com>
References: <20190208021631.30252-1-masneyb@onstation.org> <20190208021631.30252-6-masneyb@onstation.org>
 <155020988635.115909.8353948296231202388@swboyd.mtv.corp.google.com>
 <20190215134733.GA21208@basecamp> <155026608236.115909.9007817366859489104@swboyd.mtv.corp.google.com>
 <20190216002359.GA24752@basecamp> <155077482380.77512.11109337732610217265@swboyd.mtv.corp.google.com>
 <20190222085713.16f7822d@why.wild-wind.fr.eu.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190222085713.16f7822d@why.wild-wind.fr.eu.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <masneyb@onstation.org>, Andy Gross <andy.gross@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Lee Jones <lee.jones@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Shawn Guo <shawnguo@kernel.org>, Doug Anderson <dianders@chromium.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Nicolas Dechesne <nicolas.dechesne@linaro.org>, Niklas Cassel <niklas.cassel@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, linux-arm-msm@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDING
List-Id: devicetree@vger.kernel.org

On Fri, Feb 22, 2019 at 9:57 AM Marc Zyngier <marc.zyngier@arm.com> wrote:

> To be honest, I'd like to make progress on that too, if only to put
> something in core code so that individual drivers don't have to play
> that kind of game.

I am trying to pull hierarchical IRQ into the gpiolib core by refactoring
based on these and some other patches (like the IXP4xx GPIO driver).

I am working under the assumptions of what compatible strings
indicating the hierarchy topology and hard coded ranges of
offsets from parent to child in the driver only associated with
the compatible string, so no IRQ range mapping in the device
tree.

AFAICT that is how hierarchical irqdomain is engineered as of
today.

Yours,
Linus Walleij
