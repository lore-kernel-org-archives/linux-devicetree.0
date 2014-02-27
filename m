From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V6] gpio: New driver for LSI ZEVIO SoCs
Date: Thu, 27 Feb 2014 10:31:59 +0100
Message-ID: <CACRpkdZqAMMvHiGwVDNnZ7Lg9RUVtjFGdfnZF3+QrX0KRPVJGA@mail.gmail.com>
References: <1393271698-15829-1-git-send-email-fabian@ritter-vogt.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1393271698-15829-1-git-send-email-fabian@ritter-vogt.de>
Sender: linux-doc-owner@vger.kernel.org
To: Fabian Vogt <fabian@ritter-vogt.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Grant Likely <grant.likely@linaro.org>, Pawel Moll <pawel.moll@arm.com>, Rob Landley <rob@landley.net>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 24, 2014 at 8:54 PM, Fabian Vogt <fabian@ritter-vogt.de> wrote:

> This driver supports the GPIO controller found in LSI ZEVIO SoCs.
> It has been successfully tested on a TI nspire CX calculator.
>
> Signed-off-by: Fabian Vogt <fabian@ritter-vogt.de>

I like this version. Patch applied.

Q:

> +config GPIO_ZEVIO
> +       bool "LSI ZEVIO SoC memory mapped GPIOs"
> +       depends on OF

So OF_GPIO is not needed for the systems using this driver?
DT just used for probing the driver?

Yours,
Linus Walleij
