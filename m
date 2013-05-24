From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH -next] pinctrl: sunxi: fix error return code in sunxi_pinctrl_probe()
Date: Fri, 24 May 2013 11:23:04 +0200
Message-ID: <CACRpkdbAhSRLpvLt8K8suL57cs7ts7rH-SqHJgQc1LA96=JO8Q@mail.gmail.com>
References: <CAPgLHd_v3oNBP5DcqJ9bkGKkCDqwr1UzJNnVT6uz8V--FWEQ0Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAPgLHd_v3oNBP5DcqJ9bkGKkCDqwr1UzJNnVT6uz8V--FWEQ0Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Wei Yongjun <weiyj.lk@gmail.com>, Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Emilio Lopez <emilio@elopez.com.ar>, Wei Yongjun <yongjun_wei@trendmicro.com.cn>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

On Thu, May 23, 2013 at 11:32 AM, Wei Yongjun <weiyj.lk@gmail.com> wrote:

> From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
>
> Fix to return a negative error code from the devm_clk_get() error
> handling case instead of 0, as done elsewhere in this function.
>
> Introduced by commit 950707c0eb5c7aeaa2c446a04c824f4be686d2f6
> (pinctrl: sunxi: add clock support)
>
> Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Patch applied for fixes, thanks!

Maxime: OK?

Yours,
Linus Walleij
