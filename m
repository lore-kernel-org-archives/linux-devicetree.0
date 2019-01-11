From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/3] spmi: pmic-arb: convert to v2 irq interfaces to
 support hierarchical IRQ chips
Date: Fri, 11 Jan 2019 13:29:21 +0100
Message-ID: <CACRpkda4j6WAS-s1Eo6q64dKwvSDYKsEstbWSG4PBeU9jNiZvQ@mail.gmail.com>
References: <20181229114755.8711-1-masneyb@onstation.org> <20181229114755.8711-2-masneyb@onstation.org>
 <154664792383.15366.9346249356552958882@swboyd.mtv.corp.google.com> <20190105014503.GA32383@basecamp>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190105014503.GA32383@basecamp>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Masney <masneyb@onstation.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Andy Gross <andy.gross@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Marc Zyngier <marc.zyngier@arm.com>, Shawn Guo <shawnguo@kernel.org>, Doug Anderson <dianders@chromium.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Nicolas Dechesne <nicolas.dechesne@linaro.org>, Niklas Cassel <niklas.cassel@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, linux-arm-msm@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Sat, Jan 5, 2019 at 2:45 AM Brian Masney <masneyb@onstation.org> wrote:
> [Stephen]
> > Otherwise patch looks good to me. Thanks for working on this. Are you
> > going to convert the ssbi master and gpio chip too?
>
> Yes, I will do that work as well once this patch series is accepted.
> I currently don't have the hardware to test it, but I'm willing to pick
> up a cheap device on ebay. Any suggestions for something that boots a
> mainline kernel with the ssbi? It looks like the Sony Xperia Z phone is
> one of the supported devices.

I think my APQ8060 DragonBoard uses SSBI:
https://dflund.se/~triad/krad/dragonboard/
arch/arm/boot/dts/qcom-apq8060-dragonboard.dts

So I can test it. Or even  write the patch once the SSPI is merged and
known working.

Yours,
Linus Walleij
