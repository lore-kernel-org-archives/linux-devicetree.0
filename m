From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v10 0/2] drivers/gpio: Altera soft IP GPIO driver
Date: Sat, 7 Mar 2015 20:35:59 +0100
Message-ID: <CACRpkdZvbKMdqY_b3ZUCEA3mq4M1s3kZ9VHnXWZGPMETWYg5kw@mail.gmail.com>
References: <1424771583-4404-1-git-send-email-thloh@altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1424771583-4404-1-git-send-email-thloh@altera.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Tien Hock Loh <thloh@altera.com>
Cc: Dinh Nguyen <dinguyen@altera.com>, Rob Herring <robh+dt@kernel.org>, =?UTF-8?Q?Pawe=C5=82_Moll?= <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Grant Likely <grant.likely@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, "David S. Miller" <davem@davemloft.net>, Greg KH <gregkh@linuxfoundation.org>, Joe Perches <joe@perches.com>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Antti Palosaari <crope@iki.fi>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Tien Hock Loh <thloh.linux@gmail.com>
List-Id: devicetree@vger.kernel.org

On Tue, Feb 24, 2015 at 10:53 AM,  <thloh@altera.com> wrote:

> From: Tien Hock Loh <thloh@altera.com>
>
> Adds a new device tree binding and driver for Altera soft GPIO IP.
> The driver is able to do read/write and allows GPIO to be a interrupt controller.
>
> Tested on Altera GHRD on interrupt handling and IO.
>
> v10:
> Updated conflicting device tree parameters
> Removed unused headers
> Used macro instead of magic numbers for ngpio
> Code readability cleanup using ?: and temporal variables
> Removed leftover garbage and unnecessary function calls
> Checked bgpio_init but unusable because Altera GPIO may not be a multiple of 8 bits

This v10 patch applied. Any remaining issues can certainly be resolved
by additional patches in-tree.

Good patience and good work, the driver looks really really neat now.

Yours,
Linus Walleij
