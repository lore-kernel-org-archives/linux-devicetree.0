From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 1/6] pinctrl: rockchip: add suspend/resume functions
Date: Tue, 28 Oct 2014 17:23:17 +0100
Message-ID: <CACRpkdZhQpCS+S-EA_ehjrpj=uS7bnb4L_OohbnBw5sXfGgaeA@mail.gmail.com>
References: <1413933461-25602-1-git-send-email-zyw@rock-chips.com>
	<1413933557-25684-1-git-send-email-zyw@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1413933557-25684-1-git-send-email-zyw@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chris Zhong <zyw@rock-chips.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Mike Turquette <mturquette@linaro.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Doug Anderson <dianders@chromium.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 22, 2014 at 1:19 AM, Chris Zhong <zyw@rock-chips.com> wrote:

> From: Chris <zyw@rock-chips.com>
>
> support suspend/resume of pinctrl, it allows handling sleep mode
> for hogged pins in pinctrl
>
> Signed-off-by: Chris Zhong <zyw@rock-chips.com>

Looks good but I'm delegating to Heiko to collect and review patches
on the Rockchip pin control driver.

I will point out if I see something immediately disturbing.

Yours,
Linus Walleij
