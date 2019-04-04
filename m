From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [v3 PATCH 5/6] usb: roles: add USB Type-B GPIO connector driver
Date: Thu, 4 Apr 2019 23:35:27 +0700
Message-ID: <CACRpkdatNdzZ+97pZNBudyPNVtQDLKU_o31MSe=T7kJzWtaWUg@mail.gmail.com>
References: <1554257354-7440-1-git-send-email-chunfeng.yun@mediatek.com> <1554257354-7440-6-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1554257354-7440-6-git-send-email-chunfeng.yun@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Adam Thomson <Adam.Thomson.Opensource@diasemi.com>, Li Jun <jun.li@nxp.com>, Badhri Jagan Sridharan <badhri@google.com>, Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Min Guo <min.guo@mediatek.com>, Alan Stern <stern@rowland.harvard.edu>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-usb@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, moderated list:ARM/Mediatek SoC suppor
List-Id: devicetree@vger.kernel.org

On Wed, Apr 3, 2019 at 9:09 AM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:

> Due to the requirement of usb-connector.txt binding, the old way
> using extcon to support USB Dual-Role switch is now deprecated
> when use Type-B connector.
> This patch introduces a driver of Type-B connector which typically
> uses an input GPIO to detect USB ID pin, and try to replace the
> function provided by extcon-usb-gpio driver
>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
(...)
> +#include <linux/gpio.h>

If you need this include in a consumer, something is wrong. Just delete it,

> +       info->id_gpiod = devm_gpiod_get_from_of_node(
> +                               dev, child, "id-gpios", 0, GPIOD_IN, "idpin");

This is OK if the child does not have any Linux device (struct platform_device
etc) created from it. Is this the case?

Yours,
Linus Walleij
