From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC/PATCH v2 2/2] gpio-rcar: Add DT support
Date: Thu, 30 May 2013 19:38:12 +0200
Message-ID: <CACRpkdb8GYpx3ASzXB7HX5oEpAUBe-yBo0N5Ep9S+DqoE6oCLw@mail.gmail.com>
References: <1369136406-23800-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
	<1369136406-23800-3-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1369136406-23800-3-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-sh-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Magnus Damm <damm@opensource.se>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>
List-Id: devicetree@vger.kernel.org

On Tue, May 21, 2013 at 1:40 PM, Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:

> Add DT bindings for the gpio-rcar driver and read the device
> configuration from the DT node at probe time if available.
>
> Cc: devicetree-discuss@lists.ozlabs.org
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

I am assuming this will go through Simon's tree?

Note:

> +  - gpio-ranges: Range of pins managed by the GPIO controller as a 4-cells
> +    tuple using the following syntax.
> +
> +    <[phandle of the pin controller node]
> +     0
> +     [index of the first pin]
> +     [number of pins]>
> +
> +Please refer to gpio.txt in this directory for details of the common GPIO
> +bindings used by client devices.

The above ranges are part of that document.

Yours,
Linus Walleij
