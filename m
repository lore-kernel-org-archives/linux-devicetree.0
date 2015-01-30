From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/4] pinctrl: Broadcom Cygnus pinctrl device tree binding
Date: Fri, 30 Jan 2015 14:54:23 +0100
Message-ID: <CACRpkdZF8UHQEQh6AULEQ4RktgY2QNx0rbN_NHRj6gDsUJqM0A@mail.gmail.com>
References: <rjui@broadcom.com>
	<1417131990-17954-1-git-send-email-rjui@broadcom.com>
	<1417131990-17954-2-git-send-email-rjui@broadcom.com>
	<CACRpkdb5pNMbXmWGjrGpAYNLLwv6pWWOJQy0C6BLetNcStFM6A@mail.gmail.com>
	<54B01D44.5080601@broadcom.com>
	<CACRpkdbW5P=w0CPYYf_gfBuD7W0WOdAYCKpTXM5MsK9mdYDc5w@mail.gmail.com>
	<54C1AE9F.3020407@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <54C1AE9F.3020407@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ray Jui <rjui@broadcom.com>
Cc: Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Scott Branden <sbranden@broadcom.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jan 23, 2015 at 3:14 AM, Ray Jui <rjui@broadcom.com> wrote:

> I have another question here. In the B0 revision of our Cygnus chip, the
> ASIC team added a feature to allow individual pins to be muxed to GPIO.
> The pinmux controller can still only do group-based muxing in general,
> but at the same time, you can override most (but not all) individual
> pins to GPIO.
>
> I believe this HW design actually forces us to mix use "groups" and
> "pins" in DT.
>
> For example, assuming we mux pins 1 - 10 as MMC (one cmd line, one clk
> line, and 8 data lines). One might make the decision that he only needs
> 4 data lines instead of 8 data lines, and he wants to free up the 4 data
> lines and uses as GPIO.

I would split the 8 available data lines in two groups,
like "data-1-4" and "data-5-8" since the use case is such
that either you use four or eight lines, not 6 or 7, either
just "data-1-4" or both "data-1-4" and "data-5-8".

> Based on this example, is the following DT
> configuration valid?

> sd_node {
>     function = "sd";
>     groups = "sd_grps";
> };
>
> gpio_node {
>     function = "gpio";
>     pins = "gpio_7", "gpio_8", "gpio_9", "gpio_10"; /* assuming 1:1
> mapping between gpio and pin number to make this example simple */
> };

Muxing an individual GPIO from the device tree is seldom a
good idea as you realized in your follow-up mail ;)

But this:

sd_node {
     function = "sd";
     groups = "data-1-4", "data-5-8", "other-pin-group";
};

Is perfectly fine. One function, several groups.

Yours,
Linus Walleij
