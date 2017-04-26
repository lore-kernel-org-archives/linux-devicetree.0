From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/4] gpio - Add EXAR XRA1403 SPI GPIO expander driver
Date: Wed, 26 Apr 2017 16:42:18 +0200
Message-ID: <CACRpkdb82RLyjTW8t-bWynSQH0tV2dnrq9AfefQfKzTEt_TFPw@mail.gmail.com>
References: <cover.1492077070.git.nandor.han@ge.com> <f28eef264102786357ac5ed7205813619c508fb4.1492077070.git.nandor.han@ge.com>
 <CACRpkdZHMWH2W-i4MGZ7NKzPHUURRmC-5YwiK7cVLCHKDsb7sw@mail.gmail.com> <CANjd3ndZkVi5OA0eqDewrpqVLQpT11QbVOA98F=ghMhcwPu2hQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CANjd3ndZkVi5OA0eqDewrpqVLQpT11QbVOA98F=ghMhcwPu2hQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Benjamin Henrion <zoobab@gmail.com>
Cc: Nandor Han <nandor.han@ge.com>, Greg KH <gregkh@linuxfoundation.org>, "David S. Miller" <davem@davemloft.net>, Geert Uytterhoeven <geert@linux-m68k.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Daniel Vetter <daniel.vetter@ffwll.ch>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Semi Malinen <semi.malinen@ge.com>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 25, 2017 at 9:07 AM, Benjamin Henrion <zoobab@gmail.com> wrote:

> I doubt you will be able to convince the majority of people toggling
> GPIOs via a simple shell script to switch to write a complex C
> program. Not to mention cross compilation and the libraries
> dependencies here.

I do not need to convince anyone, I'm not into politics.

The way to attract users to the character device is by offering better
features... so we smack in the following goodies:

- Need a userspace ABI? No more need to select CONFIG_GPIO_SYSFS!
  The chardev is always there for any gpio chip in newer kernels!
  Board vendors would have to actively delete core code to disable it!

- Need open drain? The chardev will support that, the sysfs will never.

- Need to set/get multiple lines with a single context switch? Chardev
  does this. Also the set operation will turn into a single register write
  if your driver implements .set_multiple()

- All future needs: line biasing? Schmitt triggers? Drive strengths?
  All that will use the character device, and the sysfs ABI will never
  support any of it.

> Is there some good cli tools to access the new char device? If they
> are shipped with most distros, that would reduce the pain.

I have those that come with the kernel:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/gpio

Then libgpiod as mentioned:
https://github.com/brgl/libgpiod/tree/master/src/tools

Yours,
Linus Walleij
