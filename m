From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v5 2/7] gpio: davinci: use readl/writel instead of __raw_*
Date: Mon, 18 Nov 2013 14:01:43 +0100
Message-ID: <CACRpkdbUpGdxCn6VZO+dVCsc-3SbFC4N_E49=MAEFHd5VXqRHw@mail.gmail.com>
References: <1383905510-31760-1-git-send-email-prabhakar.csengg@gmail.com>
	<1383905510-31760-3-git-send-email-prabhakar.csengg@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1383905510-31760-3-git-send-email-prabhakar.csengg@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Prabhakar Lad <prabhakar.csengg@gmail.com>
Cc: Sekhar Nori <nsekhar@ti.com>, Grygorii Strashko <grygorii.strashko@ti.com>, LKML <linux-kernel@vger.kernel.org>, DLOS <davinci-linux-open-source@linux.davincidsp.com>, LAK <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Landley <rob@landley.net>, Grant Likely <grant.likely@linaro.org>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 8, 2013 at 11:11 AM, Prabhakar Lad
<prabhakar.csengg@gmail.com> wrote:
> From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
>
> This patch replaces the __raw_readl/writel with
> readl and writel, Although the code runs on ARMv5
> based SOCs, changing this will help copying the code
> for other uses.
>
> Signed-off-by: Lad, Prabhakar <prabhakar.csengg@gmail.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
