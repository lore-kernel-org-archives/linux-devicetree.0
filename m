From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/3] mfd: pm8921: Expose pm8xxx_read_irq_status
Date: Wed, 9 Jul 2014 09:59:02 +0200
Message-ID: <CACRpkdaYRwSb2cd88KEjKHKN_3sRv5BvJTvNMmF3CZszu8c2HQ@mail.gmail.com>
References: <1404782785-1824-1-git-send-email-bjorn.andersson@sonymobile.com>
	<1404782785-1824-2-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1404782785-1824-2-git-send-email-bjorn.andersson@sonymobile.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Cc: Lee Jones <lee.jones@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 8, 2014 at 3:26 AM, Bjorn Andersson
<bjorn.andersson@sonymobile.com> wrote:

> Most status bits, e.g. for GPIO and MPP input, is retrieved by reading
> the interrupt status registers, so this needs to be exposed to clients.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>

Hm do you mean you read the input *values* from the interrupt status
registers?

What madness in that case.... :-)

Anyway, since the driver is based on regmap, can't the children just
get a regmap * somehow and then just go read the same register
instead of having to add a special function for it?

When I look at it it seems like it's doing regmap strangely or
something, like it's one write then one read operation to get
the register(s) and isn't that all supposed to be hidden behind
regmap so you don't need the local lock chip->pm_irq_lock?

Yours,
Linus Walleij
