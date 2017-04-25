From: Benjamin Henrion <zoobab@gmail.com>
Subject: Re: [PATCH v2 2/4] gpio - Add EXAR XRA1403 SPI GPIO expander driver
Date: Tue, 25 Apr 2017 09:07:06 +0200
Message-ID: <CANjd3ndZkVi5OA0eqDewrpqVLQpT11QbVOA98F=ghMhcwPu2hQ@mail.gmail.com>
References: <cover.1492077070.git.nandor.han@ge.com> <f28eef264102786357ac5ed7205813619c508fb4.1492077070.git.nandor.han@ge.com>
 <CACRpkdZHMWH2W-i4MGZ7NKzPHUURRmC-5YwiK7cVLCHKDsb7sw@mail.gmail.com>
Reply-To: zoobab@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdZHMWH2W-i4MGZ7NKzPHUURRmC-5YwiK7cVLCHKDsb7sw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Nandor Han <nandor.han@ge.com>, Greg KH <gregkh@linuxfoundation.org>, "David S. Miller" <davem@davemloft.net>, Geert Uytterhoeven <geert@linux-m68k.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Daniel Vetter <daniel.vetter@ffwll.ch>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Semi Malinen <semi.malinen@ge.com>
List-Id: devicetree@vger.kernel.org

On Mon, Apr 24, 2017 at 3:47 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Thu, Apr 13, 2017 at 12:27 PM, Nandor Han <nandor.han@ge.com> wrote:
>
>> This is a simple driver that provides a /sys/class/gpio
>> interface for controlling and configuring the GPIO lines.
>> It does not provide support for chip select or interrupts.
>>
>> Signed-off-by: Nandor Han <nandor.han@ge.com>
>> Signed-off-by: Semi Malinen <semi.malinen@ge.com>
>
> I almost want to make the driver depend on !GPIO_SYSFS because
> of this commit message.
>
> DO NOT USE OR ENCOURAGE THE USE OF THE GPIO SYSFS
> INTERFACE.
>
> Use the character device.

I doubt you will be able to convince the majority of people toggling
GPIOs via a simple shell script to switch to write a complex C
program. Not to mention cross compilation and the libraries
dependencies here.

Is there some good cli tools to access the new char device? If they
are shipped with most distros, that would reduce the pain.

Best,

--
Benjamin Henrion <bhenrion at ffii.org>
FFII Brussels - +32-484-566109 - +32-2-3500762
"In July 2005, after several failed attempts to legalise software
patents in Europe, the patent establishment changed its strategy.
Instead of explicitly seeking to sanction the patentability of
software, they are now seeking to create a central European patent
court, which would establish and enforce patentability rules in their
favor, without any possibility of correction by competing courts or
democratically elected legislators."
