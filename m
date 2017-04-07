From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/1] gpio: core: Decouple open drain/source flag with
 active low/high
Date: Fri, 7 Apr 2017 12:25:49 +0200
Message-ID: <CACRpkdaK1ut-1=NtqqL15QuQV+P2n8XidNqVspOfu+7x=XMvog@mail.gmail.com>
References: <1491485752-28030-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1491485752-28030-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 6, 2017 at 3:35 PM, Laxman Dewangan <ldewangan@nvidia.com> wrote:

> Currently, the GPIO interface is said to Open Drain if it is Single
> Ended and active LOW. Similarly, it is said as Open Source if it is
> Single Ended and active HIGH.
>
> The active HIGH/LOW is used in the interface for setting the pin
> state to HIGH or LOW when enabling/disabling the interface.
>
> In Open Drain interface, pin is set to HIGH by putting pin in
> high impedance and LOW by driving to the LOW.
>
> In Open Source interface, pin is set to HIGH by driving pin to
> HIGH and set to LOW by putting pin in high impedance.
>
> With above, the Open Drain/Source is unrelated to the active LOW/HIGH
> in interface. There is interface where the enable/disable of interface
> is ether active LOW or HIGH but it is Open Drain type.
>
> Hence decouple the Open Drain with Single Ended + Active LOW and
> Open Source with Single Ended + Active HIGH.
>
> Adding different flag for the Open Drain/Open Source which is valid
> only when Single ended flag is enabled.
>
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>

Patch applied.

Good that you found this and fixed it before someone git hurt.

Sorry for screwing it up, my fault.

Yours,
Linus Walleij
