From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/4] pinctrl: rockchip: add support for the rk3228
Date: Fri, 11 Dec 2015 19:11:12 +0100
Message-ID: <CACRpkdY6U2aYZY6Sd_cyMVWNOL_LfU812g+jezGoFLjEi7HYKQ@mail.gmail.com>
References: <1449797452-19389-1-git-send-email-jeffy.chen@rock-chips.com>
	<1449797452-19389-2-git-send-email-jeffy.chen@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1449797452-19389-2-git-send-email-jeffy.chen@rock-chips.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Jeffy Chen <jeffy.chen@rock-chips.com>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Russell King - ARM Linux <linux@arm.linux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Fri, Dec 11, 2015 at 2:30 AM, Jeffy Chen <jeffy.chen@rock-chips.com> wrote:

> The pinctrl of rk3228 is much the same as rk3288's, but
> without pmu.
>
> Signed-off-by: Jeffy Chen <jeffy.chen@rock-chips.com>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> Acked-by: Rob Herring <robh@kernel.org>
>
> ---
>
> Changes in v2: None

Same as I applied then, I also added the same Review/ACKs.

Yours,
Linus Walleij
