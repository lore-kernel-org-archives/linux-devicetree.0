From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH RFC] drivers: misc: boardcfg: Export GPIOs from device
 tree to user space
Date: Mon, 11 Jul 2016 14:29:46 +0200
Message-ID: <CACRpkdZuUxQbceMAMsB8W34jAANd16wANEzaw=jOH_9HJcb4qA@mail.gmail.com>
References: <1467887440-17737-1-git-send-email-dirk.behme@de.bosch.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1467887440-17737-1-git-send-email-dirk.behme@de.bosch.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Oleksij Rempel <fixed-term.Oleksij.Rempel@de.bosch.com>, Jonas Oester <jonas.oester@de.bosch.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 7, 2016 at 12:30 PM, Dirk Behme <dirk.behme@de.bosch.com> wrote:

> From: Oleksij Rempel <fixed-term.Oleksij.Rempel@de.bosch.com>
>
> The device tree is the only source of board dependent information in
> the system, and thus it is the logical place to list which GPIOs, ADC
> channels etc. to use for various functions.  It is straight-forward to
> use this information in kernel space and the contents of the device
> tree can also be exported to user space.
>
> If user space applications need to use GPIOs, they can do so over the
> existing sysfs interface and they could use the device tree
> information to find out which GPIO pin to use for a given function,
> but unfortunately the numbering of GPIOs exported through sysfs is
> totally unrelated to the device tree standard for how references to
> GPIO pins are made.  This patch creates a virtual device which is used
> to provide symbolic links to GPIO pins in sysfs using logical names
> taken from the device tree.
>
> Signed-off-by: Jonas Oester <jonas.oester@de.bosch.com>
> Cc: devicetree@vger.kernel.org
> Cc: linux-gpio@vger.kernel.org

NACK! But a year ago it would have been a completely valid reasoning.

In kernel v4.6 I introduced a GPIO character device, and since v4.7
it is possible to name lines from the device tree using gpio-names
like I do in this patch:
http://marc.info/?l=linux-arm-kernel&m=146672328215354&w=2

For the kernel v4.8 merge window I am also adding ABIs to hammer
GPIOs up/down and to listen for GPIO events using the character
device.

Just checkout linux-next, go to tools/gpio and enjoy the new stuff
from userspace as it was designed by the example of lsgpio,
gpio-hammer and gpio-event-mon.

Yours,
Linus Walleij
