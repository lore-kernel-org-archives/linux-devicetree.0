From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V5] gpio: New driver for LSI ZEVIO SoCs
Date: Thu, 29 Aug 2013 20:30:18 +0200
Message-ID: <CACRpkdbnvnCiJ1apWA4gq03QH-vhmKae_3yYjYxEqGzYsWjaqg@mail.gmail.com>
References: <1377541133-7427-1-git-send-email-fabian@ritter-vogt.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1377541133-7427-1-git-send-email-fabian@ritter-vogt.de>
Sender: linux-doc-owner@vger.kernel.org
To: Fabian Vogt <fabian@ritter-vogt.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Grant Likely <grant.likely@linaro.org>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <rob.herring@calxeda.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 26, 2013 at 8:18 PM, Fabian Vogt <fabian@ritter-vogt.de> wrote:

> This driver supports the GPIO controller found in LSI ZEVIO SoCs.
> It has been successfully tested on a TI nspire CX calculator.
> ---
>  .../devicetree/bindings/gpio/gpio-zevio.txt        |  15 ++
>  drivers/gpio/Kconfig                               |   6 +
>  drivers/gpio/Makefile                              |   1 +
>  drivers/gpio/gpio-zevio.c                          | 210 +++++++++++++++++++++
>  4 files changed, 232 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-zevio.txt
>  create mode 100644 drivers/gpio/gpio-zevio.c

Repeating what Stephen said, can you please provide a changelog?
I need an overview of what changed over time.

Yours,
Linus Walleij
