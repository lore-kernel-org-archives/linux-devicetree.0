From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V2 1/5] gpio: of: Scan available child node for gpio-hog
Date: Tue, 15 Mar 2016 15:09:45 +0100
Message-ID: <CACRpkda=e+Mzk-ZTuXUUQa61dmbQ+-TSHvnVQ=mDAXg-+UmObw@mail.gmail.com>
References: <1457703804-3016-1-git-send-email-ldewangan@nvidia.com>
	<1457703804-3016-2-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1457703804-3016-2-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Rob Herring <robh+dt@kernel.org>, =?UTF-8?Q?Pawe=C5=82_Moll?= <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Markus Pargmann <mpa@pengutronix.de>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <treding@nvidia.com>, Benoit Parrot <bparrot@ti.com>, Alexandre Courbot <acourbot@nvidia.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Mar 11, 2016 at 2:43 PM, Laxman Dewangan <ldewangan@nvidia.com> wrote:

> Look for child node which are available when iterating for
> gpio hog node for request/set GPIO initial configuration
> during OF gpio chip registration.
>
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> Reviewed-by: Thierry Reding <treding@nvidia.com>

So if I understand the patch correctly all it really does is make
it possible to set status = "disabled"; in the hog nodes, and
then they will not be applied?

That should be stated in the commit message.

Yours,
Linus Walleij
