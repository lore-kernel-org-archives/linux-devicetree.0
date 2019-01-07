From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/5] spmi: pmic-arb: hardcode IRQ counts
Date: Mon, 7 Jan 2019 11:47:16 +0100
Message-ID: <CACRpkdas_OLjbAAX=chzwwoVjW35L3iS=BhpNXS9QC6ccFMtsA@mail.gmail.com>
References: <20190107021145.6370-1-masneyb@onstation.org> <20190107021145.6370-2-masneyb@onstation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190107021145.6370-2-masneyb@onstation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Masney <masneyb@onstation.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <andy.gross@linaro.org>, Lee Jones <lee.jones@linaro.org>, Marc Zyngier <marc.zyngier@arm.com>, Shawn Guo <shawnguo@kernel.org>, Doug Anderson <dianders@chromium.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Nicolas Dechesne <nicolas.dechesne@linaro.org>, Niklas Cassel <niklas.cassel@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, linux-arm-msm@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 7, 2019 at 3:11 AM Brian Masney <masneyb@onstation.org> wrote:

> Note: The qcom,pms405-gpio looks suspicious to me. The existing code
> will start at gpio1, which is supposed to be a hole according to the
> comment. I can fix this in a later patch if there is a desire. I didn't
> do it now to try to keep this series as small as possible. Its no
> worse than what was there before.

If the range has holes the valid_mask should be set up to mask
them off for this variant.

That would be a separate patch though and hardly your problem
as you say.

Yours,
Linus Walleij
