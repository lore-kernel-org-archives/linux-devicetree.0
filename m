From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] gpiolib: Split GPIO flags parsing and GPIO configuration
Date: Fri, 16 Oct 2015 22:48:03 +0200
Message-ID: <CACRpkdaRGwHZu93OdK6qocU_18yJ9gvdtJ0aVa9BruGWZahvtA@mail.gmail.com>
References: <1444684821-17389-1-git-send-email-laurent.pinchart@ideasonboard.com>
	<1444684821-17389-2-git-send-email-laurent.pinchart@ideasonboard.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1444684821-17389-2-git-send-email-laurent.pinchart@ideasonboard.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Oct 12, 2015 at 11:20 PM, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:

> When requesting a GPIO through the legacy or the gpiod_* API the
> gpiochip request operation is first called and then the GPIO flags are
> parsed and the GPIO is configured. This prevents the gpiochip from
> rejecting the request if the flags are not supported by the device.
>
> To fix this split the parse-and-configure operation in two and parse
> flags before requesting the GPIO.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Very elegant, this is exactly how we need things to happen.
Patch applied.

Yours,
Linus Walleij
