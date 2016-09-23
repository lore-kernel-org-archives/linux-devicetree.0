From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] of: Prevent unaligned access in of_alias_scan()
Date: Fri, 23 Sep 2016 17:13:32 +0100
Message-ID: <CACxGe6secYUbnZYCpoZH44nEDAU7chfzjxehxWyyotSQE7fWHg@mail.gmail.com>
References: <20160923153827.8263-1-paul.burton@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160923153827.8263-1-paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Cc: linux-mips <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 23, 2016 at 4:38 PM, Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org> wrote:
> When allocating a struct alias_prop, of_alias_scan() only requested that
> it be aligned on a 4 byte boundary. The struct contains pointers which
> leads to us attempting 64 bit writes on 64 bit systems, and if the CPU
> doesn't support unaligned memory accesses then this causes problems -
> for example on some MIPS64r2 CPUs including the "mips64r2-generic" QEMU
> emulated CPU it will trigger an address error exception.
>
> Fix this by requesting alignment for the struct alias_prop allocation
> matching that which the compiler expects, using the __alignof__ keyword.
>
> Signed-off-by: Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>

Looks right to me.

Reviewed-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>

> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
> Cc: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
> ---
>  drivers/of/base.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index 3ce6953..448aa40 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -2042,7 +2042,7 @@ void of_alias_scan(void * (*dt_alloc)(u64 size, u64 align))
>                         continue;
>
>                 /* Allocate an alias_prop with enough space for the stem */
> -               ap = dt_alloc(sizeof(*ap) + len + 1, 4);
> +               ap = dt_alloc(sizeof(*ap) + len + 1, __alignof__(*ap));
>                 if (!ap)
>                         continue;
>                 memset(ap, 0, sizeof(*ap) + len + 1);
> --
> 2.10.0
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
