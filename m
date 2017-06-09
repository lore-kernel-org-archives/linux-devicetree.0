From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/5 v2] clk: qcom: Update DT bindings for the
 MSM8660/APQ8060 RPMCC
Date: Fri, 9 Jun 2017 10:48:57 +0200
Message-ID: <CACRpkdbW24L2kLL9buPRAawXOuQ1ypCLf58gCq5=BWP5ex4zuA@mail.gmail.com>
References: <20170419091326.11226-1-linus.walleij@linaro.org>
 <CACRpkdbXEFeVkD8rETyrnuoAxUvnFt2BL07UsXuXfSnq3Qdyfw@mail.gmail.com>
 <CACRpkdYvwwJcxKPtKUyZBLWsmjXji7pHDKNz9NRTETqj2P3drQ@mail.gmail.com> <20170601073858.GU20170@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20170601073858.GU20170@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, linux-clk <linux-clk@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 1, 2017 at 9:38 AM, Stephen Boyd <sboyd@codeaurora.org> wrote:
> On 05/24, Linus Walleij wrote:

>> I am sorry if you guys are swamped, I just don't know what to do,
>> clock drivers are starting to become the bottleneck for everything
>> I do. I bet the ARM SoC maintainers must be noticing it too.
(...)
> Meh. Life happens and msm8660 is about a decade old now and not
> something that I can easily review without digging through old
> websites to find documentation on the code I worked on 7 years
> ago. So sorry, but these sorts of patches are basically
> approaching priority none for me and I have to steal time to
> review them.

Sorry the reference above was mainly to the Gemini SoC clock driver
which was blocking ARM consolidation, the fact that this MSM8660
thing was stalled too just got me to think it was related.

I understand the MSM8660 is low prio, but the first DragonBoard
was pushed to developers en masse in 2012 (yours truly included),
which was just half a decade ago, and started
the community boards effort from Qualcomm, and yeah, community
moves slower than markets usually, the board is still supported by
the BSquare company that managed the board release for Qualcomm,
I can still login and check schematics and support forums,
cool isn't it :D

Yours,
Linus Walleij
