From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 1/4] soc: qcom: add an EBI2 device tree bindings
Date: Mon, 29 Aug 2016 15:42:55 +0200
Message-ID: <201608291542.55387.arnd@arndb.de>
References: <1470691445-27571-1-git-send-email-linus.walleij@linaro.org> <CAL_JsqJPckLGDSiqnspvtP_=t+yZ+0vO-8MxGB6x7poOZiyK+Q@mail.gmail.com> <CACRpkdaRPa=tCH2FQUOUzp0Q2YvdLNA7R2y3w==sH40DwJ2vGA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <CACRpkdaRPa=tCH2FQUOUzp0Q2YvdLNA7R2y3w==sH40DwJ2vGA@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, linux-soc@vger.kernel.org, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: devicetree@vger.kernel.org

On Monday 29 August 2016, Linus Walleij wrote:
> Gnah. Each chipselect can (in theory) house several memory-mapped
> devices at different offsets. Like two ethernet controllers. It gets a bit
> weird.

How theoretical is that setup though? From looking at other external
bus interfaces that we support, I can't find anyone actually doing
this.

	Arnd
