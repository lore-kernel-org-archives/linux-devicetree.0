From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/2] of/gpio: Define OF_GPIO_OPEN_DRAIN and
 OF_GPIO_OPEN_SOURCE flags.
Date: Mon, 24 Feb 2014 13:11:13 +0100
Message-ID: <CACRpkdaO5a6WBHHkDCFVN_Eg8P2Z7pkaONXCcxji9unOmkOsqw@mail.gmail.com>
References: <1392148200-5393-1-git-send-email-ddaney.cavm@gmail.com>
	<1392148200-5393-2-git-send-email-ddaney.cavm@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1392148200-5393-2-git-send-email-ddaney.cavm@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: David Daney <ddaney.cavm@gmail.com>
Cc: Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, David Daney <david.daney@cavium.com>
List-Id: devicetree@vger.kernel.org

On Tue, Feb 11, 2014 at 8:49 PM, David Daney <ddaney.cavm@gmail.com> wrote:

>  enum of_gpio_flags {
>         OF_GPIO_ACTIVE_LOW = 0x1,
> +       OF_GPIO_OPEN_DRAIN = 0x2,
> +       OF_GPIO_OPEN_SOURCE = 0x4,
>  };

BTW I think this enum shall be deleted and replaced by
#include <dt-bindings/gpio/gpio.h> and use the definition from
there.

Yours,
Linus Walleij
