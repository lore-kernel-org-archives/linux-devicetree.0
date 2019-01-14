From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 00/14] qcom: spmi: add support for hierarchical IRQ chip
Date: Mon, 14 Jan 2019 09:45:46 +0100
Message-ID: <CACRpkdYFCid1Hr1auSezwo83Djm9C82L7WF4LzfW1a8gKLLsaQ@mail.gmail.com>
References: <20190113154716.5145-1-masneyb@onstation.org> <CACRpkdbyiPwE8+onB0_Yu0i+6LZCFy8Z7MWWY7p-fjsb0JFVhw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdbyiPwE8+onB0_Yu0i+6LZCFy8Z7MWWY7p-fjsb0JFVhw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Masney <masneyb@onstation.org>, Andy Gross <andy.gross@linaro.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Marc Zyngier <marc.zyngier@arm.com>, Shawn Guo <shawnguo@kernel.org>, Doug Anderson <dianders@chromium.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Nicolas Dechesne <nicolas.dechesne@linaro.org>, Niklas Cassel <niklas.cassel@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, linux-arm-msm@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 14, 2019 at 9:43 AM Linus Walleij <linus.walleij@linaro.org> wrote:

> Regarding the device trees, I think we usually merge device tree
> changes in parallel (orthogonally) and as long as the end result
> after merging both driver code and device tree changes is correct
> we do not bother *too* much about any intermittent states.
>
> That said I can of course merge the DTS changes in the pin control
> tree if I get some ACK from the Qualcomm maintainers.
>
> Else I will just apply patches 1-7 to the pin control tree ASAP and
> the DTS changes need to go through qcom (Andy's tree) and
> ARM SoC.

PS that would mean dropping patches 6 and 14 obviously.
If I merge all patches, I can keep them around.

Yours,
Linus Walleij
