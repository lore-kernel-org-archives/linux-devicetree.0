From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 04/11] gpio: altera-a10sr: Add A10 System Resource Chip
 GPIO support.
Date: Fri, 29 Apr 2016 11:29:28 +0200
Message-ID: <CACRpkdbQSCqC-wYsigVKsm3=o2Uq8iOLXOnCMYgAkSddvUEODw@mail.gmail.com>
References: <1461339219-15255-1-git-send-email-tthayer@opensource.altera.com>
	<1461339219-15255-5-git-send-email-tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-hwmon-owner@vger.kernel.org>
In-Reply-To: <1461339219-15255-5-git-send-email-tthayer@opensource.altera.com>
Sender: linux-hwmon-owner@vger.kernel.org
To: tthayer@opensource.altera.com
Cc: Lee Jones <lee.jones@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, jdelvare@suse.com, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, =?UTF-8?Q?Pawe=C5=82_Moll?= <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, Dinh Nguyen <dinguyen@opensource.altera.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-hwmon@vger.kernel.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Apr 22, 2016 at 5:33 PM,  <tthayer@opensource.altera.com> wrote:

> From: Thor Thayer <tthayer@opensource.altera.com>
>
> Add the GPIO functionality for the Altera Arria10 MAX5 System Resource
> Chip. The A10 MAX5 has 12 bits of GPIO assigned to switches, buttons,
> and LEDs as a GPIO extender on the SPI bus.
>
> Signed-off-by: Thor Thayer <tthayer@opensource.altera.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Lee feel free to queue this.

Yours,
Linus Walleij
