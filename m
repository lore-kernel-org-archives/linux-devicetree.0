From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] GPIO: Add driver for 74xx-ICs with MMIO access
Date: Mon, 29 Sep 2014 14:04:47 +0200
Message-ID: <CACRpkdYAohAjHiabQC7zs=CrJzDJh+jFKTYhATFoHdNOH2Ef0A@mail.gmail.com>
References: <1411112404-16040-1-git-send-email-shc_work@mail.ru>
	<1411112404-16040-2-git-send-email-shc_work@mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1411112404-16040-2-git-send-email-shc_work@mail.ru>
Sender: linux-gpio-owner@vger.kernel.org
To: Alexander Shiyan <shc_work@mail.ru>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 19, 2014 at 9:40 AM, Alexander Shiyan <shc_work@mail.ru> wrote:

> This patch adds driver to support GPIO functionality for 74xx-compatible
> ICs with MMIO access. Compatible models include:
>  1 bit:   74AHC1G125 (Input), 74AUC1G74 (Output)
>  2 bits:  74LVC2G125 (Input), 74HC74 (Output)
>  4 bits:  74HC125 (Input), 74HC175 (Output)
>  6 bits:  74HC365 (Input), 74HC174 (Output)
>  8 bits:  74HC244 (Input), 74HC273 (Output)
>  16 bits: 74AC1624 (Input), 74AC16374 (Output)
>
> Signed-off-by: Alexander Shiyan <shc_work@mail.ru>

Looking good, if you fix up the DT bindings to not include
technology as indicated in reply to patch 2/2 I'll be happy to
apply this patch.

Sorry for the delay.

Yours,
Linus Walleij
