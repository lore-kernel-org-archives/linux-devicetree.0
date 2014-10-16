From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 1/4] ARM: rockchip: add suspend and resume for RK3288
Date: Wed, 15 Oct 2014 20:44:40 -0700
Message-ID: <CAD=FV=Ve4=BuqqrboJ5uyz6+RAxAEvAe+G2myf+BCk8q2+3LGA@mail.gmail.com>
References: <1413405987-16196-1-git-send-email-zyw@rock-chips.com>
	<1413406066-16257-1-git-send-email-zyw@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1413406066-16257-1-git-send-email-zyw@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chris <zyw@rock-chips.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Mike Turquette <mturquette@linaro.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Tony Xie <xxx@rock-chips.com>
List-Id: devicetree@vger.kernel.org

Chris,

On Wed, Oct 15, 2014 at 1:47 PM,  <zyw@rock-chips.com> wrote:
> +static const struct platform_suspend_ops rk3288_suspend_ops = {
> +       .enter = rk3288_suspend_enter,
> +       .valid = suspend_valid_only_mem,
> +};

As per offline discussion, let's add the regulator calls in prepare / finish.
