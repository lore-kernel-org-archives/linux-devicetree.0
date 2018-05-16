Return-Path: <SRS0=yNVQ=ID=linaro.org=linus.walleij@kernel.org>
MIME-Version: 1.0
In-Reply-To: <1525338346-31684-2-git-send-email-shubhrajyoti.datta@gmail.com>
References: <1525338346-31684-1-git-send-email-shubhrajyoti.datta@gmail.com> <1525338346-31684-2-git-send-email-shubhrajyoti.datta@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 May 2018 14:14:38 +0200
Message-ID: <CACRpkdZWPfQ24xOeoygKmqHJ08UzGkQnFupUmYRAhfONW+T5ew@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: xilinx: Add support for no initialisation at probe
Content-Type: text/plain; charset="UTF-8"
To: Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>, michals@xilinx.com
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, git-dev@xilinx.com, Rob Herring <robh+dt@kernel.org>, Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
List-ID: <devicetree@vger.kernel.org>

On Thu, May 3, 2018 at 11:05 AM,  <shubhrajyoti.datta@gmail.com> wrote:

> From: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
>
> Add a dt property to indicate no initialisation at probe.
> In some cases the user may want no initialisation of the
> gpios. For example PS only reset the user may not want the
> re-initialisation of the ip.
>
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>

Usually the recommendation is to leave electronics in the
power-on-state until their state is explicitly changed.

Is it possible to just make the new "no-init" behaviour
the default? Do we even need to keep the initialization code?

Michal?

Yours,
Linus Walleij
