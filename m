From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio-exar: Use correct property prefix and document bindings
Date: Tue, 1 Aug 2017 13:44:47 +0200
Message-ID: <CACRpkdZ6CVMM9dUspCgubBvKcRLJwxi2PRo3SCk=OKT2zXzqhg@mail.gmail.com>
References: <dd5bb6b5-a6a7-a799-581f-b5fb83aa677b@siemens.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <dd5bb6b5-a6a7-a799-581f-b5fb83aa677b@siemens.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-gpio <linux-gpio@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 19, 2017 at 7:31 AM, Jan Kiszka <jan.kiszka@siemens.com> wrote:

> The device-specific property should be prefixed with the vendor name,
> not "linux,", as Linus Walleij pointed out. Change this and document the
> bindings of this platform device.
>
> We didn't ship the old binding in a release yet. So we can still change
> it without breaking an official API.
>
> Fixes: 380b1e2f3a2f ("gpio-exar/8250-exar: Make set of exported GPIOs configurable")
>
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>

Patch applied for fixes with Rob's ACK, nice fixup!

Yours,
Linus Walleij
