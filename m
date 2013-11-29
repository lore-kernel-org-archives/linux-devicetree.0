From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v6 3/6] gpio: davinci: remove unused variable intc_irq_num
Date: Fri, 29 Nov 2013 08:43:00 +0100
Message-ID: <CACRpkdZaSgEMTPPSYJyENc+zhTTLhzchi2F=CzdZs=DskMvVwg@mail.gmail.com>
References: <1385057731-4348-1-git-send-email-prabhakar.csengg@gmail.com>
	<1385057731-4348-4-git-send-email-prabhakar.csengg@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1385057731-4348-4-git-send-email-prabhakar.csengg@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Prabhakar Lad <prabhakar.csengg@gmail.com>
Cc: Sekhar Nori <nsekhar@ti.com>, Grygorii Strashko <grygorii.strashko@ti.com>, LKML <linux-kernel@vger.kernel.org>, DLOS <davinci-linux-open-source@linux.davincidsp.com>, LAK <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Landley <rob@landley.net>, Grant Likely <grant.likely@linaro.org>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 21, 2013 at 7:15 PM, Prabhakar Lad
<prabhakar.csengg@gmail.com> wrote:

> From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
>
> As the davinci-gpio driver is migrated to use irqdomain
> there is no need to pass the irq base for the gpio driver.
> This patch removes this variable from davinci_gpio_platform_data
> and also the refrences from the machine file.
>
> Signed-off-by: Lad, Prabhakar <prabhakar.csengg@gmail.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

*Very* nice patch!

Yours,
Linus Walleij
