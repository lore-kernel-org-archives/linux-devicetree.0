From: Benoit Parrot <bparrot@ti.com>
Subject: Re: [Patch v6 0/2] gpio: add GPIO hogging mechanism
Date: Wed, 18 Feb 2015 11:23:42 -0600
Message-ID: <20150218172341.GA3851@ti.com>
References: <AAE35E953C746D4784A1A0C604EFEA714DFBD819@DLEE10.ent.ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <AAE35E953C746D4784A1A0C604EFEA714DFBD819@DLEE10.ent.ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Alexandre Courbot <gnurou@gmail.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Jiri Prchal <jiri.prchal@aksignal.cz>, Pantelis Antoniou <panto@antoniou-consulting.com>, Benoit Parrot <bparrot@ti.com>
List-Id: devicetree@vger.kernel.org

Gentle ping.

Is there any chance this will make it in 3.21?

Benoit

Parrot, Benoit <bparrot@ti.com> wrote on Wed [2015-Feb-02 17:44:43 -0600]:
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
> * Addressed review comment from Linus Walleij
> * Replace "state" property back with separate boolean properties
> * Renamed helper function
> * Refactored pr_* calls to remove "__func__"
>  
> Changes since v4:
> * Addressed review comments from Alexandre Courbot
>  
> Changes since v3:
> * Relocated the non-DT "hog" function to gpiolib.c.
> * Rename some of the function to be clearer and remove _ prefixes.
> * Replace the gpiod_request/gpiod_put usage with
>    gpiochip_request_own_desc/free_own_desc version instead.
> * Refactor some of the logic to better handle error condition/reporting
> * Renamed the "direction" DT properties to "state".
>  
> Changes since v2:
> * Refactor the gpio-hog mechanism to split the DT related action
>    from the actual "hogging" operation.
> * This allows non-DT providers to implement hogs as well.
> * Added FLAG_IS_HOGGED to mark hogged gpio and make gpiochip removal
>    able to release hogged gpio.
> * Similarly to the hogging, the cleanup is performed as part of
>    of_gpiochip_remove
>  
> Changes since v1:
> * Split the devicetree bindings documentation in its own patch.
> * Refactor the gpio-hog mechanism as private functions meant to
>    be to invoked from of_gpiochip_add().
>  
>  
> Benoit Parrot (2):
>   gpio: add GPIO hogging mechanism
>   gpio: Document GPIO hogging mechanism
>  
> Documentation/devicetree/bindings/gpio/gpio.txt |  30 ++++++
> drivers/gpio/gpiolib-of.c                       | 111 +++++++++++++++++++++
> drivers/gpio/gpiolib.c                          | 124 ++++++++++++++++++++----
> drivers/gpio/gpiolib.h                          |   3 +
> 4 files changed, 249 insertions(+), 19 deletions(-)
>  
> --
> 1.8.5.1
>  
> --
> To unsubscribe from this list: send the line "unsubscribe linux-gpio" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>  
> 
