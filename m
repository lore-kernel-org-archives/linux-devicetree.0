From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 1/2] of: remove extraneous 'const' in typedef
Date: Thu, 11 May 2017 09:44:50 -0500
Message-ID: <CAL_JsqJxubj3Swe7qr7sU8xJbQJRcK17LYKpDhN4DsF-yg7cHg@mail.gmail.com>
References: <20170511122458.3862716-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170511122458.3862716-1-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Frank Rowand <frowand.list@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, May 11, 2017 at 7:24 AM, Arnd Bergmann <arnd@arndb.de> wrote:
> One change that was meant to address a sparse warning turned out
> to cause hundreds of new gcc-7 warnings:

I guess you are the only one on gcc-7.

> include/linux/of_irq.h:11:13: error: type qualifiers ignored on function return type [-Werror=ignored-qualifiers]
>
> After reverting the change, the gcc warnings are gone again, and I
> can't reproduce the sparse warnings either.

Humm, maybe different sparse versions? I'm on 0.5.0.

>
> Fixes: 17a70355ea57 ("of: fix sparse warnings in fdt, irq, reserved mem, and resolver code")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  include/linux/of_irq.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/linux/of_irq.h b/include/linux/of_irq.h
> index ec6b11deb773..1e0deb8e8494 100644
> --- a/include/linux/of_irq.h
> +++ b/include/linux/of_irq.h
> @@ -8,7 +8,7 @@
>  #include <linux/ioport.h>
>  #include <linux/of.h>
>
> -typedef int const (*of_irq_init_cb_t)(struct device_node *, struct device_node *);
> +typedef int (*of_irq_init_cb_t)(struct device_node *, struct device_node *);
>
>  /*
>   * Workarounds only applied to 32bit powermac machines
> --
> 2.9.0
>
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
