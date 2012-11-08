From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/4] gpio: samsung: Skip registration if pinctrl driver is
 present on Exynos4x12
Date: Thu, 8 Nov 2012 22:12:52 +0100
Message-ID: <CACRpkdaOpzFvs_wqy9sdrmx1=wEs5uxqfh_rOrKxLTXV-q1K2Q@mail.gmail.com>
References: <1351089457-8205-1-git-send-email-t.figa@samsung.com>
	<1351089457-8205-3-git-send-email-t.figa@samsung.com>
	<CACRpkdYNDSp0K3wpvUem9ecsW-JQ9L6aKqaOmHNUR65DQTMNHA@mail.gmail.com>
	<0c5301cdbca2$30320240$909606c0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <0c5301cdbca2$30320240$909606c0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Tomasz Figa <t.figa@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kyungmin.park@samsung.com, m.szyprowski@samsung.com, tomasz.figa@gmail.com, thomas.abraham@linaro.org, swarren@wwwdotorg.org
List-Id: devicetree@vger.kernel.org

On Wed, Nov 7, 2012 at 5:41 AM, Kukjin Kim <kgene.kim@samsung.com> wrote:

> A commit 1b6056d6 ("pinctrl: samsung: Include bank-specific eint offset in
> bank struct") which is in your pinctrl tree (samsung branch) changed
> macro(EXYNOS_PIN_BANK_EINTG) to add offset. Eventually, this series(due to
> 3rd patch, pinctrl: samsung: Add support for Exynos4x12) breaks compilation
> without the commit. So if you don't have a plan to rebase samsung branch of
> your pinctrl tree, I'd like to merge it in my tree. Is it ok to you?

Sure tell me when you've merged it and I'll drop commit 1b6056d6
from my tree.

Yours,
Linus Walleij
