From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio: add export with name from dts
Date: Thu, 17 Oct 2013 11:47:11 +0200
Message-ID: <CACRpkdZ30LYdVRWT7QtSq35D8NX3dg3EKadKEVSA2OYahynoZA@mail.gmail.com>
References: <1382001269-6334-1-git-send-email-jiri.prchal@aksignal.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1382001269-6334-1-git-send-email-jiri.prchal@aksignal.cz>
Sender: linux-gpio-owner@vger.kernel.org
To: Jiri Prchal <jiri.prchal@aksignal.cz>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, John Crispin <blogic@openwrt.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Grant Likely <grant.likely@linaro.org>, Bryan Wu <cooloney@gmail.com>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 17, 2013 at 11:14 AM, Jiri Prchal <jiri.prchal@aksignal.cz> wrote:

> Add export possibility to sysfs with given name in device tree. It is nice for users to have board specific gpios exportet at boottime and with their names.

s/exportet/exported
s/bottime/boot-time

> It renames some functions in gpiolib and adds name as parameter. If is passed NULL as name everythink works like before, export by chip name.

if IT is passed ...
s/everythink/everything

> It can be done by extra function export_with_name without changing original export function but I think there would not to be twice almost the same.
> Even if gpio sysfs interface is almost to be deprecated, I would like to add this, cause new chardev interface is in farness future.
> Rebased from older unapplyed patch: [PATCH] owrt: GPIO: add gpio_export_with_name.
>
> Signed-off-by: Jiri Prchal <jiri.prchal@aksignal.cz>

Try to linebreak the commit message at column 70 or so.

(I'll fix up the spellings etc, so don't worry too much about this.)

> +3) gpio-export
> +--------------
> +
> +gpio-export will allow you to automatically export gpio to linux sysfs.

s/gpio/a GPIO line (I prefer upper-case and clear specification of what
GPIO is. Why do you say it is automatic? How else would it be done
if not by automation?

> +Can be used to describe hw gpio by "name" and to have them exported at
> +boot time to make it convenient for users.
> +
> +required properties:
> +- compatible: Should be "linux-gpio-export"

It seems other subsystems are using "linux," as prefix so change
this to "linux,gpio-export"

> +in each child node will represent a gpio or if no name is specified
> +a list of gpio to export

I don't quite understand this sentence. Do you mean:

"each child node of the compatible node represents  a GPIO line
 or, if it does not have a name specified, a list if GPIOs to export"

I don't think this works, the nodes get messy if some of
them specify a single GPIO line and set it as output or input,
and some specify an array.

You have to make your mind up here: either we export
exactly *one* GPIO line per node, or all nodes can export
an array and also pass in arrays of output values and so
on.

One node per GPIO is arguably easiest and most readable,
so please rewrite the patch in accordance.

Yours,
Linus Walleij
