From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V2 3/5] gpio: of: Return error if gpio hog configuration failed
Date: Tue, 15 Mar 2016 15:12:59 +0100
Message-ID: <CACRpkdbsu+yfFvCR2=vKO3+S46+GHSy+3wu+5uwMmsu0_mfP-Q@mail.gmail.com>
References: <1457703804-3016-1-git-send-email-ldewangan@nvidia.com>
	<1457703804-3016-4-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1457703804-3016-4-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Rob Herring <robh+dt@kernel.org>, =?UTF-8?Q?Pawe=C5=82_Moll?= <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Markus Pargmann <mpa@pengutronix.de>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <treding@nvidia.com>, Benoit Parrot <bparrot@ti.com>, Alexandre Courbot <acourbot@nvidia.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Mar 11, 2016 at 2:43 PM, Laxman Dewangan <ldewangan@nvidia.com> wrote:

> If GPIO hog configuration failed while adding OF based
> gpiochip() then return the error instead of ignoring it.
>
> This helps of properly handling the gpio driver dependency.
>
> When adding the gpio hog nodes for NVIDIA's Tegra210 platforms,
> the gpio_hogd() fails with EPROBE_DEFER because pinctrl is not
> ready at this time and gpio_request() for Tegra GPIO driver
> returns error. The error was not causing the Tegra GPIO driver
> to fail as the error was getting ignored.
>
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> Cc: Benoit Parrot <bparrot@ti.com>
> Cc: Alexandre Courbot <acourbot@nvidia.com>
> Reviewed-by: Thierry Reding <treding@nvidia.com>

Oops is this something I should apply for fixes and tag
for stable?

Yours,
Linus Walleij
