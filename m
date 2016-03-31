From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: 74x164: add dt support for nxp's 74x594
Date: Thu, 31 Mar 2016 10:26:53 +0200
Message-ID: <CACRpkdb5Yqw4dMqV1wBh2hL701XgxEWGDguVvuK2gvsmakj4eg@mail.gmail.com>
References: <1457998330-8070-1-git-send-email-nicolassaenzj@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1457998330-8070-1-git-send-email-nicolassaenzj@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nicolas Saenz Julienne <nicolassaenzj@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, =?UTF-8?Q?Pawe=C5=82_Moll?= <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Tue, Mar 15, 2016 at 12:32 AM, Nicolas Saenz Julienne
<nicolassaenzj@gmail.com> wrote:

> The chip is also an 8 bit shift register which works out of the box as a GPO
> expander with this patch
>
> Signed-off-by: Nicolas Saenz Julienne <nicolassaenzj@gmail.com>

Patch applied.

I'm not a compatible-string minimalist. Add as many as you
like.

Yours,
Linus Walleij
