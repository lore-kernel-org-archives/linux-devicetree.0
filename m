From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] pinctrl: s3c64xx: Fix build error caused by undefined chained_irq_enter
Date: Tue, 23 Apr 2013 14:00:11 +0200
Message-ID: <CACRpkdZ_9K-=4C7ksScqoX3WeF0LyPrzkCS6iMG6u_mCNnWRWw@mail.gmail.com>
References: <1366060483-20342-1-git-send-email-tomasz.figa@gmail.com>
	<20130416163331.GP26958@opensource.wolfsonmicro.com>
	<30362001.FF4K7WsZvh@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <30362001.FF4K7WsZvh@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Kukjin Kim <kgene.kim@samsung.com>, kwangwoo.lee@gmail.com, Peter Korsgaard <jacmet@sunsite.dk>, augulis.darius@gmail.com, mcuelenaere@gmail.com, Russell King - ARM Linux <linux@arm.linux.org.uk>, Rob Herring <robherring2@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Thomas Abraham <thomas.abraham@linaro.org>
List-Id: devicetree@vger.kernel.org

On Wed, Apr 17, 2013 at 12:23 AM, Tomasz Figa <tomasz.figa@gmail.com> wrote:

> Commit de88cbb7 moved definitions of chained_irq_enter and
> chained_irq_exit to a generic header, which must be now included instead
> of the legacy arch-specific one.
>
> This patch fixes build error caused by including the legacy header
> leading to undefined chained_irq_enter and chained_irq_exit symbols.
>
> Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>

Patch applied.

Thanks!
Linus Walleij
