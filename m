From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V4 3/5] pinctrl: max77620: add pincontrol driver for MAX77620/MAX20024
Date: Thu, 28 Jan 2016 11:04:10 +0100
Message-ID: <CACRpkdZEYw2aADQDNSi0kKns17nKZQZKY+harLhc0j3pA-5FuA@mail.gmail.com>
References: <1453198783-28383-1-git-send-email-ldewangan@nvidia.com>
	<1453198783-28383-4-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1453198783-28383-4-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Rob Herring <robh+dt@kernel.org>, =?UTF-8?Q?Pawe=C5=82_Moll?= <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Alexandre Courbot <gnurou@gmail.com>, Lee Jones <lee.jones@linaro.org>, Mark Brown <broonie@kernel.org>, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Liam Girdwood <lgirdwood@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "rtc-linux@googlegroups.com" <rtc-linux@googlegroups.com>, Stephen Warren <swarren@nvidia.com>, Thierry Reding <treding@nvidia.com>, =?UTF-8?Q?Krzysztof_Koz=C5=82owski?= <k.kozlowski@samsung.com>, vreddytalla@nvidia.com, Chaitanya
List-Id: devicetree@vger.kernel.org

On Tue, Jan 19, 2016 at 11:19 AM, Laxman Dewangan <ldewangan@nvidia.com> wrote:

> MAXIM Semiconductor's PMIC, MAX77620/MAX20024 has 8 GPIO pins
> which also act as the special function in alternate mode. Also
> there is configuration like push-pull, open drain, FPS timing
> etc for these pins.
>
> Add pincontrol driver to configure these parameters through
> pincontrol APIs.
>
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> Signed-off-by: Chaitanya Bandi <bandik@nvidia.com>

Nice. This driver looks like a lot of hard work, but I think
it's worth it.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I guess Lee will be merging this into the MTD tree.

(I still had those comments on the DT bindings but this driver
part looks fine.)

Yours,
Linus Walleij
