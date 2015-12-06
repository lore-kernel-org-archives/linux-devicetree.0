From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] of/address: replace printk(KERN_ERR ...) with pr_err(...)
Date: Sun, 6 Dec 2015 14:40:01 -0600
Message-ID: <CAL_JsqJNsQtGe9cUJVj_iqzsRfB+CyCxACNW6FBDDE28T3tm_w@mail.gmail.com>
References: <1448864059-12319-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1448864059-12319-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@linaro.org>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 30, 2015 at 12:14 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> A trivial change suggested by checkpatch.pl.

You might as well all levels while you are at it. Looks like that is
only one more:

drivers/of/address.c:   printk(KERN_DEBUG "%s", s);

Rob

>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
>  drivers/of/address.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/of/address.c b/drivers/of/address.c
> index cd53fe4..5289c80 100644
> --- a/drivers/of/address.c
> +++ b/drivers/of/address.c
> @@ -596,7 +596,7 @@ static u64 __of_translate_address(struct device_node *dev,
>                 pbus = of_match_bus(parent);
>                 pbus->count_cells(dev, &pna, &pns);
>                 if (!OF_CHECK_COUNTS(pna, pns)) {
> -                       printk(KERN_ERR "prom_parse: Bad cell count for %s\n",
> +                       pr_err("prom_parse: Bad cell count for %s\n",
>                                of_node_full_name(dev));
>                         break;
>                 }
> --
> 1.9.1
>
