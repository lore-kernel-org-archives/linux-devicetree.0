From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v4 1/6] pinctrl: rockchip: add suspend/resume functions
Date: Tue, 21 Oct 2014 21:19:33 -0700
Message-ID: <CAD=FV=WZtcOcAQDyMDNPFdMz6P9ZSqkUPZ52UgecZbSXU92mzg@mail.gmail.com>
References: <1413933461-25602-1-git-send-email-zyw@rock-chips.com>
	<1413933557-25684-1-git-send-email-zyw@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1413933557-25684-1-git-send-email-zyw@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chris Zhong <zyw@rock-chips.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Mike Turquette <mturquette@linaro.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Linus Walleij <linus.walleij@linaro.org>
List-Id: devicetree@vger.kernel.org

Chris,

On Tue, Oct 21, 2014 at 4:19 PM, Chris Zhong <zyw@rock-chips.com> wrote:
> From: Chris <zyw@rock-chips.com>

I think your git is misconfigured.  The above "From" line will make
the author end up without your last name.  Heiko mentioned this in v4.

> diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
> index 016f457..c4a988d 100644
> --- a/drivers/pinctrl/pinctrl-rockchip.c
> +++ b/drivers/pinctrl/pinctrl-rockchip.c
> @@ -1770,6 +1770,25 @@ static struct rockchip_pin_ctrl *rockchip_pinctrl_get_soc_data(
>         return ctrl;
>  }
>
> +#ifdef CONFIG_PM_SLEEP
> +static int rockchip_pinctrl_suspend(struct device *dev)

Why didn't you take Dmitry's suggestion from v3?  I think you can get
rid of the #ifdef and add the "__maybe_unused" annotation to avoid
errors when PM_SLEEP isn't defined.

This does work, though, so:

Tested-by: Doug Anderson <dianders@chromium.org>
