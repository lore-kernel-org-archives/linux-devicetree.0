From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v4 4/6] ARM: rockchip: add suspend and resume for RK3288
Date: Tue, 21 Oct 2014 22:01:46 -0700
Message-ID: <CAD=FV=VBOqkMn+wSoYdFgdTu=0Hq38xk7_fo8Vr_ACupLVBkVw@mail.gmail.com>
References: <1413933461-25602-1-git-send-email-zyw@rock-chips.com>
	<1413933928-25803-1-git-send-email-zyw@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1413933928-25803-1-git-send-email-zyw@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chris Zhong <zyw@rock-chips.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Mike Turquette <mturquette@linaro.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Linus Walleij <linus.walleij@linaro.org>, Tony Xie <xxx@rock-chips.com>
List-Id: devicetree@vger.kernel.org

Chris,

On Tue, Oct 21, 2014 at 4:25 PM, Chris Zhong <zyw@rock-chips.com> wrote:
> @@ -34,7 +40,8 @@ static const char * const rockchip_board_dt_compat[] = {
>  };
>
>  DT_MACHINE_START(ROCKCHIP_DT, "Rockchip Cortex-A9 (Device Tree)")
> -       .l2c_aux_val    = 0,
> -       .l2c_aux_mask   = ~0,
> +       .l2c_aux_val    = 0,
> +       .l2c_aux_mask   = ~0,

Please avoid unrelated spacing changes.


Other than that this is looking like a good starting point.  I'm sure
we'll find other things to do, but I'd be in favor of landing this and
spinning.  I can see a device suspend/resume with this patch, so:

Tested-by: Doug Anderson <dianders@chromium.org>
Reviewed-by: Doug Anderson <dianders@chromium.org>
