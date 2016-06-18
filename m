From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: sx150x: Update OF configuration
Date: Sat, 18 Jun 2016 11:02:02 +0200
Message-ID: <CACRpkdbDMo=cV5bmcWNbeHU+c-AyokpaFNNZJF4UPY+twDX8bw@mail.gmail.com>
References: <1466157063-10955-1-git-send-email-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1466157063-10955-1-git-send-email-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 17, 2016 at 11:51 AM, Neil Armstrong
<narmstrong@baylibre.com> wrote:

> In case of OF probing, the driver fails to initialize :
> - gpio_chip.base must be -1
> - irq_summary must be either -1 or valid
> - There is no way to use the other configurations
>
> Add OF parsing function to complete the HW configuration, make
> OF configuration dynamic instead of static with #defines and
> update the DT bindings.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

As you can see from the result of the build robot, the removal
of #ifdef CONFIG_OF_GPIO does not play well with non-DT
configurarions.

You need to figure something out here so that it builds for
both.

Yours,
Linus Walleij
