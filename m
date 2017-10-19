From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] of: overlay: make pr_err() string unique
Date: Thu, 19 Oct 2017 17:13:19 -0500
Message-ID: <CAL_JsqLJFdevya05xFYdMR4cXCUOsmHoVWN2irfrBrsWznhJBQ@mail.gmail.com>
References: <1508449091-9506-1-git-send-email-frowand.list@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1508449091-9506-1-git-send-email-frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 19, 2017 at 4:38 PM,  <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> From: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>
>
> The same error string occurs in drivers/of/resolver.c.  Change
> the error here to more precisely describe this case, and avoid
> the possible confusion of looking in the wrong source location
> to understand the cause of an error.
>
> Signed-off-by: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>
> ---
>
> And yes, I was looking in the wrong file and not understanding
> how this error could have been triggered by the example
> provided.  :-)
>
>  drivers/of/overlay.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
