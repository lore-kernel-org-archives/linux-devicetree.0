From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Subject: Re: [PATCH v2 0/6] pintrl: meson: add support for GPIO IRQs
Date: Sun, 14 May 2017 12:19:51 +0200
Message-ID: <c9810441-66d7-fb5b-7e3a-57a236f2ff5d@suse.de>
References: <36164ed8-aa59-2a77-b7fc-9adce03a2fc1@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <36164ed8-aa59-2a77-b7fc-9adce03a2fc1@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <marc.zyngier@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Thomas Gleixner <tglx@linutronix.de>, Thierry Reding <treding@nvidia.com>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, linux-amlogic@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Heiner,

Am 12.05.2017 um 21:01 schrieb Heiner Kallweit:
> Heiner Kallweit (5):
>   pinctrl: meson: add interrupts to pinctrl data
>   pinctrl: meson: document GPIO IRQ DT binding
>   pinctrl: meson: add DT node for GPIO IRQ on Meson GX
>   pinctrl: meson: add DT node for GPIO IRQ on Meson 8 / 8b
>   pinctrl: meson: improve meson_get_bank and export it
>   pinctrl: meson: add support for GPIO interrupts

For some odd reason, all subjects of your actual patches arrived without
the c in pinctrl, but you have it spelled correctly above...

Regards,
Andreas

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer, Jane Smithard, Graham Norton
HRB 21284 (AG Nürnberg)
