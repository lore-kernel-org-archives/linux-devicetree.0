From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 2/4] clk: rockchip: RK3288: add suspend and resume
Date: Wed, 15 Oct 2014 20:34:21 -0700
Message-ID: <CAD=FV=Vuwhsf4FeL6ZkB5dguEWxawWOeA6Ex-3mZdepX1bZKsA@mail.gmail.com>
References: <1413405987-16196-1-git-send-email-zyw@rock-chips.com>
	<1413406102-16293-1-git-send-email-zyw@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1413406102-16293-1-git-send-email-zyw@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chris <zyw@rock-chips.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Mike Turquette <mturquette@linaro.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Tony Xie <xxx@rock-chips.com>
List-Id: devicetree@vger.kernel.org

Chris,

On Wed, Oct 15, 2014 at 1:48 PM,  <zyw@rock-chips.com> wrote:
> From: Chris Zhong <zyw@rock-chips.com>
>
> save and restore some clks, which might be changed in suspend.
>
> Signed-off-by: Tony Xie <xxx@rock-chips.com>
> Signed-off-by: Chris Zhong <zyw@rock-chips.com>
> ---
>
>  drivers/clk/rockchip/clk-rk3288.c |   61 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 61 insertions(+)

Put this as patch set #1?  It's safe to do this first and the other
patch won't work without it (right?)


> +static int rk3288_clk_suspend(void)
> +{
> +       int i, reg_id;
> +
> +       for (i = 0; i < ARRAY_SIZE(rk3288_saved_cru_reg_ids); i++) {
> +               reg_id = rk3288_saved_cru_reg_ids[i];
> +
> +               rk3288_saved_cru_regs[i] =
> +                               __raw_readl(rk3288_cru_base + reg_id);

As talked about off-list, should probably not be the __raw version
here and elsewhere in this file.
