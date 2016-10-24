From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: mcp23s08: Add option to configure pullups.
Date: Mon, 24 Oct 2016 02:53:31 +0200
Message-ID: <CACRpkdY15Hv_ydHyOXRM6G0ewVTHkVa1w3Z89AdvSDR=eyi7sQ@mail.gmail.com>
References: <1477062035-30825-1-git-send-email-enric.balletbo@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1477062035-30825-1-git-send-email-enric.balletbo@collabora.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 21, 2016 at 5:00 PM, Enric Balletbo i Serra
<enric.balletbo@collabora.com> wrote:

> Default is without pullups, but if property is specified in DT and the bit
> is set, set a pullup on GPIO-n.
>
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

I don't generally like this.

In device tree it is the consumer that specifies how the line is used,
not the producer (gpiochip).

We currently only specify polarity, open drain and open source
for consumers though.

And the entire pin control system came into being *exactly* because
Grant didn't like me adding these things to the GPIO drivers.

So how many other things does the MCP support? Drive strength?
Schmitt trigger? Is there a datasheet?

Yours,
Linus Walleij
