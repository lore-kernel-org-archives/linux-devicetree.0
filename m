From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 2/6] pinctrl: rockchip: save and restore gpio6_c6
 pinmux in suspend/resume
Date: Tue, 28 Oct 2014 16:52:54 +0100
Message-ID: <CACRpkda6ebV51bPeyn6qsR97CdeV6nSTTsJmHmrcj-C0OXyDEw@mail.gmail.com>
References: <1413862894-2623-1-git-send-email-zyw@rock-chips.com>
	<1413863011-2736-1-git-send-email-zyw@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1413863011-2736-1-git-send-email-zyw@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chris Zhong <zyw@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>
Cc: Mike Turquette <mturquette@linaro.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Doug Anderson <dianders@chromium.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 21, 2014 at 5:43 AM,  <zyw@rock-chips.com> wrote:

> From: Chris Zhong <zyw@rock-chips.com>
>
> Save and restore the gpio6_c6 pinmux setting, since Maskrom of RK3288
> would modify it to sdmmc0_det, so it need to be restored to the correct
> setting after resume from Maskrom.
>
> Signed-off-by: Chris Zhong <zyw@rock-chips.com>
> ---
>
> Changes in v3: None
> Changes in v2: None

Heiko, ping on this too.

Yours,
Linus Walleij
