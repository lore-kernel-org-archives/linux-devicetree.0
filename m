Return-Path: <SRS0=yNVQ=ID=linaro.org=linus.walleij@kernel.org>
MIME-Version: 1.0
In-Reply-To: <1525338346-31684-1-git-send-email-shubhrajyoti.datta@gmail.com>
References: <1525338346-31684-1-git-send-email-shubhrajyoti.datta@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 May 2018 14:12:00 +0200
Message-ID: <CACRpkdafmXFZfcrBtO7S0f_E7rnpTubTKXDOg8bgtiQTXaTDcg@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: gpio-xilinx: Update no-init property
Content-Type: text/plain; charset="UTF-8"
To: Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, git-dev@xilinx.com, Rob Herring <robh+dt@kernel.org>, michals@xilinx.com, Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
List-ID: <devicetree@vger.kernel.org>

On Thu, May 3, 2018 at 11:05 AM,  <shubhrajyoti.datta@gmail.com> wrote:

> From: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
>
> In some cases the user may not want to initialise the
> gpios to default. Add a property to allow the same. This is specially
> useful in case the PS is reset and PL is not.
>
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
(...)
> @@ -25,6 +25,7 @@ Optional properties:
>  - xlnx,dout-default-2 : as above but the second channel
>  - xlnx,gpio2-width : as above but for the second channel
>  - xlnx,tri-default-2 : as above but for the second channel
> +- xlnx,no-init : No initialisation at probe

This doesn't seem very Xilinx-specific? It looks more like something
any GPIO driver would want to do.

So a no-init-hardware; in gpio.txt seems more appropriate,
if this is even needed, see comments on next patch.

Yours,
Linus Walleij
