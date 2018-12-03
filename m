From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v1 07/12] usb: roles: Find the usb role switch by also
 matching against the device node
Date: Mon, 3 Dec 2018 10:17:20 +0200
Message-ID: <CAHp75VfUKAQ+Q0cQz-4-=i2JL9uACBX1bVvCeNjZLL1HStDGKQ@mail.gmail.com>
References: <20181203034515.91412-1-chenyu56@huawei.com> <20181203034515.91412-8-chenyu56@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181203034515.91412-8-chenyu56@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: chenyu56@huawei.com
Cc: USB <linux-usb@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Suzhuangluan <suzhuangluan@hisilicon.com>, Kongfei <kongfei@hisilicon.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Krogerus, Heikki" <heikki.krogerus@linux.intel.com>, Hans de Goede <hdegoede@redhat.com>, John Stultz <john.stultz@linaro.org>
List-Id: devicetree@vger.kernel.org

On Mon, Dec 3, 2018 at 5:45 AM Yu Chen <chenyu56@huawei.com> wrote:
>
> This patch adds code for supporting find usb role switch by matching against
> the device node described using of_graph.

>  #include <linux/module.h>
>  #include <linux/mutex.h>
>  #include <linux/slab.h>
> +#include <linux/of.h>
> +#include <linux/of_graph.h>

Keep it ordered.

> +static int __switch_match_by_of_node(struct device *dev, const void *name)
> +{
> +       if (!dev->parent || !dev->parent->of_node)
> +               return 0;
> +
> +       return of_node_name_eq(dev->parent->of_node, (const char *)name);
> +}

I think Heikki has introduced some more generic function for this.

>         sw = device_connection_find_match(dev, "usb-role-switch", NULL,
>                                           usb_role_switch_match);

> +       sw = of_graph_find_match_by_type(dev, "usb-role-switch");

Why this is here?! device_connection_find_match() should take care for OF case.

-- 
With Best Regards,
Andy Shevchenko
