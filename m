From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [Patch v6 1/2] gpio: add GPIO hogging mechanism
Date: Wed, 4 Mar 2015 11:09:53 +0100
Message-ID: <CACRpkdYKuobhTJQ062+8srQ_nCZsnyuMbiM2gVp=u47Zi_jF6Q@mail.gmail.com>
References: <1422899085-678-1-git-send-email-bparrot@ti.com>
	<1422899085-678-2-git-send-email-bparrot@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1422899085-678-2-git-send-email-bparrot@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Benoit Parrot <bparrot@ti.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Jiri Prchal <jiri.prchal@aksignal.cz>, Pantelis Antoniou <panto@antoniou-consulting.com>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 2, 2015 at 6:44 PM, Benoit Parrot <bparrot@ti.com> wrote:

> Based on Boris Brezillion's work this is a reworked patch
> of his initial GPIO hogging mechanism.
> This patch provides a way to initially configure specific GPIO
> when the GPIO controller is probed.
>
> The actual DT scanning to collect the GPIO specific data is performed
> as part of gpiochip_add().
>
> The purpose of this is to allow specific GPIOs to be configured
> without any driver specific code.
> This is particularly useful because board design are getting
> increasingly complex and given SoC pins can now have more
> than 10 mux values, a lot of connections are now dependent on
> external IO muxes to switch various modes.
>
> Specific drivers should not necessarily need to be aware of
> what accounts to a specific board implementation. This board level
> "description" should be best kept as part of the dts file.
>
> Signed-off-by: Benoit Parrot <bparrot@ti.com>
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

Patch applied.

Good to have this in place for Linux 4.1!

Yours,
Linus Walleij
