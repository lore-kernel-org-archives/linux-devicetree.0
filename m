From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH] of/irq: introduce of_has_named_irqs helper
Date: Fri, 24 Jul 2015 14:14:57 -0500
Message-ID: <CAL_Jsq+JGpNBwS3HF1fF4HdefRCwhniaYCm5G4_WAnio7t-1og@mail.gmail.com>
References: <20150724182655.GA22007@dtor-ws>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150724182655.GA22007@dtor-ws>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jul 24, 2015 at 1:26 PM, Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
> Sometimes drivers might wish to transition from index-based to named
> interrupt descriptions. To aid in decision-making when parsing device
> tree data let's provide a helper that will indicate the scheme that is
> being used.

Generally, IRQs are retrieved by platform_get_irq or
platform_get_irq_byname. Drivers should not call the of_irq_*
functions directly in most cases.

>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>
> The intent is to it like this:
>
>         if (of_has_named_irqs(np) {
>                 /* Wake IRQ is optional */
>                 dev->wakeirq = of_irq_get_byname(np, "wakeup");
>                 if (dev->wakeirq < 0 && dev->wakeirq != -ENODATA)
>                         return dev->wakeirq;
>         }

of_irq_get_byname will already return an error if the property is not
present. Use that.

Rob
