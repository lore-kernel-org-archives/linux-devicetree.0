Return-Path: <SRS0=nu7X=RB=gmail.com=andy.shevchenko@kernel.org>
MIME-Version: 1.0
References: <1551078369-1654-1-git-send-email-jun.li@nxp.com> <1551078369-1654-2-git-send-email-jun.li@nxp.com>
In-Reply-To: <1551078369-1654-2-git-send-email-jun.li@nxp.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 26 Feb 2019 09:25:11 +0200
Message-ID: <CAHp75VcOt0L_RgrSDsn_ybbmd0-bk4TABT+MtYFRFOXcnGNTOA@mail.gmail.com>
Subject: Re: [PATCH 2/2] usb: typec: add typec switch via GPIO control
Content-Type: text/plain; charset="UTF-8"
To: Jun Li <jun.li@nxp.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "hdegoede@redhat.com" <hdegoede@redhat.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
List-ID: <devicetree@vger.kernel.org>

On Mon, Feb 25, 2019 at 9:27 AM Jun Li <jun.li@nxp.com> wrote:
>
> This patch adds a simple typec switch driver which only needs
> a GPIO to switch the super speed active channel according to
> typec orientation.

> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/kernel.h>
> +#include <linux/platform_device.h>

> +#include <linux/of.h>
> +#include <linux/of_gpio.h>

I don't see how these are in use.

-- 
With Best Regards,
Andy Shevchenko
