From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 2/4] gpio - Add EXAR XRA1403 SPI GPIO expander driver
Date: Tue, 25 Apr 2017 09:15:44 +0200
Message-ID: <CAMuHMdUvQwqhuoWnS3h1S7p0q1K9m5BBFue54pkOykMgi+xmWw@mail.gmail.com>
References: <cover.1492077070.git.nandor.han@ge.com> <f28eef264102786357ac5ed7205813619c508fb4.1492077070.git.nandor.han@ge.com>
 <CACRpkdZHMWH2W-i4MGZ7NKzPHUURRmC-5YwiK7cVLCHKDsb7sw@mail.gmail.com> <CANjd3ndZkVi5OA0eqDewrpqVLQpT11QbVOA98F=ghMhcwPu2hQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CANjd3ndZkVi5OA0eqDewrpqVLQpT11QbVOA98F=ghMhcwPu2hQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: zoobab@gmail.com
Cc: Linus Walleij <linus.walleij@linaro.org>, Nandor Han <nandor.han@ge.com>, Greg KH <gregkh@linuxfoundation.org>, "David S. Miller" <davem@davemloft.net>, Mauro Carvalho Chehab <mchehab@kernel.org>, Daniel Vetter <daniel.vetter@ffwll.ch>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Semi Malinen <semi.malinen@ge.com>
List-Id: devicetree@vger.kernel.org

Hi Benjamin,

On Tue, Apr 25, 2017 at 9:07 AM, Benjamin Henrion <zoobab@gmail.com> wrote:
> On Mon, Apr 24, 2017 at 3:47 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
>> On Thu, Apr 13, 2017 at 12:27 PM, Nandor Han <nandor.han@ge.com> wrote:
>>
>>> This is a simple driver that provides a /sys/class/gpio
>>> interface for controlling and configuring the GPIO lines.
>>> It does not provide support for chip select or interrupts.
>>>
>>> Signed-off-by: Nandor Han <nandor.han@ge.com>
>>> Signed-off-by: Semi Malinen <semi.malinen@ge.com>
>>
>> I almost want to make the driver depend on !GPIO_SYSFS because
>> of this commit message.
>>
>> DO NOT USE OR ENCOURAGE THE USE OF THE GPIO SYSFS
>> INTERFACE.
>>
>> Use the character device.
>
> I doubt you will be able to convince the majority of people toggling
> GPIOs via a simple shell script to switch to write a complex C
> program. Not to mention cross compilation and the libraries
> dependencies here.
>
> Is there some good cli tools to access the new char device? If they
> are shipped with most distros, that would reduce the pain.

https://github.com/brgl/libgpiod

A bit early to expect it to be shipped with all distros, though.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
