From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] devicetree: bindings: gpio-davinic: fix documentation
Date: Tue, 11 Mar 2014 11:21:57 +0100
Message-ID: <CACRpkdZT_noz0JnSr02tXvW6cddHt8kdNbstkrbfSzvLn45PJg@mail.gmail.com>
References: <1394085505-11227-1-git-send-email-prabhakar.csengg@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1394085505-11227-1-git-send-email-prabhakar.csengg@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Prabhakar Lad <prabhakar.csengg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Rob Landley <rob@landley.net>, Grygorii Strashko <grygorii.strashko@ti.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Mar 6, 2014 at 6:58 AM, Prabhakar Lad
<prabhakar.csengg@gmail.com> wrote:

> From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
>
> This patch adds missing #gpio-cells and also adds a
> usage example for leds.
>
> Reported-by: Alexander Holler <holler@ahsoftware.de>
> Signed-off-by: Lad, Prabhakar <prabhakar.csengg@gmail.com>

Thanks, patch applied.

Note:

> +  - second cell is used to specify optional parameters (unused)
(...)
> +               gpios = <&gpio 10 GPIO_ACTIVE_HIGH>;

So you're using the unused cell.

However it is maybe nice to put things like that in there as it
sort of documents the system so whatever.

Yours,
Linus Walleij
