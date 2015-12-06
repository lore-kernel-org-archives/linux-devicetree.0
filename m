From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] of/address: fix typo in comment block of of_translate_one()
Date: Sun, 6 Dec 2015 14:43:33 -0600
Message-ID: <CAL_Jsq+o19ySchwEipSuM6rgQx1YoSfBkreNEhaJT_uzaMp87w@mail.gmail.com>
References: <1448864557-18658-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1448864557-18658-1-git-send-email-yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 30, 2015 at 12:22 AM, Masahiro Yamada
<yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org> wrote:
> Remove the "not" before "cannot".
>
> I am fixing the comment block style while I am here.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>

Applied for 4.4. Thanks.

Rob

> ---
>
>  drivers/of/address.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/of/address.c b/drivers/of/address.c
> index 5289c80..91a469d 100644
> --- a/drivers/of/address.c
> +++ b/drivers/of/address.c
> @@ -485,9 +485,10 @@ static int of_translate_one(struct device_node *parent, struct of_bus *bus,
>         int rone;
>         u64 offset = OF_BAD_ADDR;
>
> -       /* Normally, an absence of a "ranges" property means we are
> +       /*
> +        * Normally, an absence of a "ranges" property means we are
>          * crossing a non-translatable boundary, and thus the addresses
> -        * below the current not cannot be converted to CPU physical ones.
> +        * below the current cannot be converted to CPU physical ones.
>          * Unfortunately, while this is very clear in the spec, it's not
>          * what Apple understood, and they do have things like /uni-n or
>          * /ht nodes with no "ranges" property and a lot of perfectly
> --
> 1.9.1
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
