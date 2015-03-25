From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] of: base: improve of_get_next_child() kernel-doc
Date: Tue, 24 Mar 2015 23:45:16 -0500
Message-ID: <CAL_JsqKvEYC9NUB2ZNgAgr7KrimT9ZmvGdxjJhNE+5uF9n+nkQ@mail.gmail.com>
References: <360c70ee4131ea8048b193bfff359360bb854fe3.1426766621.git.baruch@tkos.co.il>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <360c70ee4131ea8048b193bfff359360bb854fe3.1426766621.git.baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Mar 19, 2015 at 7:03 AM, Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org> wrote:
> Add two new facts to of_get_next_child() documentation:
>
>    * of_get_next_child() returns NULL when there is not next child
>
>    * of_get_next_child() decrements the refcount of prev
>
> Signed-off-by: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>

Applied. Thanks.

Rob

> ---
>  drivers/of/base.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index adb8764861c0..5ca5f900de9c 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -640,8 +640,9 @@ static struct device_node *__of_get_next_child(const struct device_node *node,
>   *     @node:  parent node
>   *     @prev:  previous child of the parent node, or NULL to get first
>   *
> - *     Returns a node pointer with refcount incremented, use
> - *     of_node_put() on it when done.
> + *     Returns a node pointer with refcount incremented, use of_node_put() on
> + *     it when done. Returns NULL when prev is the last child. Decrements the
> + *     refcount of prev.
>   */
>  struct device_node *of_get_next_child(const struct device_node *node,
>         struct device_node *prev)
> --
> 2.1.4
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
