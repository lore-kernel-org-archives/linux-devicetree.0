From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH V2 4/6] usb: ohci-platform: Add support for Broadcom STB SoC's
Date: Wed, 24 Oct 2018 08:11:09 +0100
Message-ID: <CAK8P3a3Qw6YraHveY4MW=3u-q5YyOzM3X8V9Q=X7Wr4=1gApGg@mail.gmail.com>
References: <1539815349-24126-1-git-send-email-alcooperx@gmail.com> <1539815349-24126-5-git-send-email-alcooperx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1539815349-24126-5-git-send-email-alcooperx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Al Cooper <alcooperx@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alan Stern <stern@rowland.harvard.edu>, Alban Bedel <albeu@free.fr>, Alex Elder <elder@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, Avi Fishman <avifishman70@gmail.com>, bcm-kernel-feedback-list@broadcom.com, Bjorn Andersson <bjorn.andersson@linaro.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>, David Miller <davem@davemloft.net>, DTML <devicetree@vger.kernel.org>, Dmitry Osipenko <digetx@gmail.com>, gregkh <gregkh@linuxfoundation.org>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Hans de Goede <hdegoede@redhat.com>, James Hogan <jhogan@kernel.org>, sunjianguo1@huawei.com, Johan Hovold <johan@kernel.org>, Kees Cook <keescook@chromium.org>, USB list <linux-usb@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 17, 2018 at 11:30 PM Al Cooper <alcooperx@gmail.com> wrote:
>
> Add support for Broadcom STB SoC's to the ohci platform driver.
>
> Signed-off-by: Al Cooper <alcooperx@gmail.com>
> ---
>  drivers/usb/host/ohci-platform.c | 35 +++++++++++++++++++++++++++++------
>  include/linux/usb/ohci_pdriver.h |  1 +
>  2 files changed, 30 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/usb/host/ohci-platform.c b/drivers/usb/host/ohci-platform.c
> index 65a1c3fdc88c..363d6fa676a5 100644
> --- a/drivers/usb/host/ohci-platform.c
> +++ b/drivers/usb/host/ohci-platform.c
> @@ -22,6 +22,7 @@
>  #include <linux/module.h>
>  #include <linux/err.h>
>  #include <linux/of.h>
> +#include <linux/of_device.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/reset.h>
> @@ -99,12 +100,24 @@ static int ohci_platform_probe(struct platform_device *dev)
>         if (usb_disabled())
>                 return -ENODEV;
>
> -       /*
> -        * Use reasonable defaults so platforms don't have to provide these
> -        * with DT probing on ARM.
> -        */
> -       if (!pdata)
> -               pdata = &ohci_platform_defaults;
> +       if (!pdata) {
> +               const struct usb_ohci_pdata *match_pdata;
> +
> +               match_pdata = of_device_get_match_data(&dev->dev);
> +               if (match_pdata) {
> +                       pdata = devm_kzalloc(&dev->dev, sizeof(*pdata),
> +                                            GFP_KERNEL);
> +                       if (!pdata)
> +                               return -ENOMEM;
> +                       *pdata = *match_pdata;

It looks like you copy the const pdata to get a non-const version.
Have you tried
propagating the 'const' modifier so that users can rely on that here?

> +               } else {
> +                       /*
> +                        * Use reasonable defaults so platforms don't have
> +                        * to provide these with DT probing on ARM.
> +                        */
> +                       pdata = &ohci_platform_defaults;
> +               }
> +       }

That would also allow you to unify it with the else path by listing
the ohci_platform_defaults
in the id table for all other compatible strings.

       Arnd
