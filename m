From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [Patch v6 0/2] gpio: add GPIO hogging mechanism
Date: Thu, 26 Feb 2015 18:38:37 +0900
Message-ID: <CAAVeFuL3yrsysB2N7auaTR5CVy5D=6jvnEMEY6RxO37xrn46Fw@mail.gmail.com>
References: <1422899085-678-1-git-send-email-bparrot@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1422899085-678-1-git-send-email-bparrot@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Benoit Parrot <bparrot@ti.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Jiri Prchal <jiri.prchal@aksignal.cz>, Pantelis Antoniou <panto@antoniou-consulting.com>
List-Id: devicetree@vger.kernel.org

Linus, this looks good to me in its current form, what are your thoughts?

On Tue, Feb 3, 2015 at 2:44 AM, Benoit Parrot <bparrot@ti.com> wrote:
> This patch set re-introduces the gpio hogging concept first
> presented by Boris Brezillion.
> This patch set provides a way to initially configure specific GPIO
> when the GPIO controller is probed.
>
> The actual DT scanning to collect the GPIO specific data is performed
> as part of of_gpiochip_add().
>
> The purpose of this is to allow specific GPIOs to be configured
> without any driver specific code.
> This is particularly useful because board design are getting
> increasingly complex and given SoC pins can now have more
> than 10 mux values a lot of connections are now dependent on
> external IO muxes to switch various modes.
>
> Specific drivers should not necessarily need to be aware of
> what accounts to a specific board implementation. This board level
> "description" should be best kept as part of the dts file.
>
> Changes since v5:
>  * Addressed review comment from Linus Walleij
>  * Replace "state" property back with separate boolean properties
>  * Renamed helper function
>  * Refactored pr_* calls to remove "__func__"
>
> Changes since v4:
>  * Addressed review comments from Alexandre Courbot
>
> Changes since v3:
>  * Relocated the non-DT "hog" function to gpiolib.c.
>  * Rename some of the function to be clearer and remove _ prefixes.
>  * Replace the gpiod_request/gpiod_put usage with
>    gpiochip_request_own_desc/free_own_desc version instead.
>  * Refactor some of the logic to better handle error condition/reporting
>  * Renamed the "direction" DT properties to "state".
>
> Changes since v2:
>  * Refactor the gpio-hog mechanism to split the DT related action
>    from the actual "hogging" operation.
>  * This allows non-DT providers to implement hogs as well.
>  * Added FLAG_IS_HOGGED to mark hogged gpio and make gpiochip removal
>    able to release hogged gpio.
>  * Similarly to the hogging, the cleanup is performed as part of
>    of_gpiochip_remove
>
> Changes since v1:
>  * Split the devicetree bindings documentation in its own patch.
>  * Refactor the gpio-hog mechanism as private functions meant to
>    be to invoked from of_gpiochip_add().
>
>
> Benoit Parrot (2):
>   gpio: add GPIO hogging mechanism
>   gpio: Document GPIO hogging mechanism
>
>  Documentation/devicetree/bindings/gpio/gpio.txt |  30 ++++++
>  drivers/gpio/gpiolib-of.c                       | 111 +++++++++++++++++++++
>  drivers/gpio/gpiolib.c                          | 124 ++++++++++++++++++++----
>  drivers/gpio/gpiolib.h                          |   3 +
>  4 files changed, 249 insertions(+), 19 deletions(-)
>
> --
> 1.8.5.1
>
