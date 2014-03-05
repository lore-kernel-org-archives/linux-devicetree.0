From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v12] gpio: add a driver for the Synopsys DesignWare APB
 GPIO block
Date: Wed, 5 Mar 2014 09:01:56 +0800
Message-ID: <CACRpkdbSk3Vv+-U=jQTH=8E=yx4tkHApGq-ARfwXs-cBf4=ddA@mail.gmail.com>
References: <1393369261-17469-1-git-send-email-delicious.quinoa@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1393369261-17469-1-git-send-email-delicious.quinoa@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alan Tull <delicious.quinoa@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Jamie Iles <jamie@jamieiles.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Grant Likely <grant.likely@secretlab.ca>, Mark Rutland <mark.rutland@arm.com>, Steffen Trumtrar <s.trumtrar@pengutronix.de>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Alan Tull <atull@altera.com>, Dinh Nguyen <dinguyen@altera.com>, Yves Vandervennet <rocket.yvanderv@gmail.com>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 26, 2014 at 7:01 AM, Alan Tull <delicious.quinoa@gmail.com> wrote:

> From: Jamie Iles <jamie@jamieiles.com>
>
> The Synopsys DesignWare block is used in some ARM devices (picoxcell)
> and can be configured to provide multiple banks of GPIO pins.
>
> Signed-off-by: Jamie Iles <jamie@jamieiles.com>
> Signed-off-by: Alan Tull <atull@altera.com>
> Reviewed-by: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
>
> v12: - Add irq_startup/shutdown
>      - do irq_create_mapping() in probe, irq_find_mapping() in to_irq()
>      - Adjust mappings to show support for 1 gpio per port.
>      - gpio-cells = <1>

Patch applied!

You've done a tremendous work on this driver and there is
absolutely nothing controversial about the bindings, so it is
my pleasure to include this driver.

Yours,
Linus Walleij
