From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH] of: Provide dummy of_device_compatible_match() for compile-testing
Date: Tue, 13 Jun 2017 12:32:22 +0200
Message-ID: <CAMuHMdUwXXioxt8_nhDM0x1h=KBb6HnNgkzwdM-qGVy7cSNH9Q@mail.gmail.com>
References: <1493141928-29251-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1493141928-29251-1-git-send-email-geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 25, 2017 at 7:38 PM, Geert Uytterhoeven
<geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org> wrote:
> Most of_device_*() functions have dummy versions for CONFIG_OF=n,
> but of_device_compatible_match() hasn't.  Fix that to improve the
> ability to do compile-testing.
>
> Fixes: b9c13fe32faaa71c ("dt: Add of_device_compatible_match()")
> Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>

Any reason not to apply this patch?

Thanks!

> ---
>  include/linux/of.h | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/include/linux/of.h b/include/linux/of.h
> index 21e6323de0f3b786..bfd1a23221735161 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -620,6 +620,12 @@ static inline int of_device_is_compatible(const struct device_node *device,
>         return 0;
>  }
>
> +static inline  int of_device_compatible_match(struct device_node *device,
> +                                             const char *const *compat)
> +{
> +       return 0;
> +}
> +
>  static inline bool of_device_is_available(const struct device_node *device)
>  {
>         return false;
> --
> 2.7.4
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
