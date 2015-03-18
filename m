From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 1/2] of: Add vendor prefix for Aptina Imaging
Date: Wed, 18 Mar 2015 10:59:49 -0500
Message-ID: <CAL_Jsq+pfYG-UowKVgeqW2yu_iSO_Yoo6q=9ZrdaOeW1Hu3vTw@mail.gmail.com>
References: <1426345057-2752-1-git-send-email-laurent.pinchart@ideasonboard.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1426345057-2752-1-git-send-email-laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: "linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?UTF-8?Q?Carlos_Sanmart=C3=ADn_Bustos?= <carsanbu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Mar 14, 2015 at 9:57 AM, Laurent Pinchart
<laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org> wrote:
> Signed-off-by: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>  1 file changed, 1 insertion(+)
>
> Aptina has recently been acquired by ON Semiconductor, but the name Aptina is
> still widely used. Should the onnn prefix be used instead ?

Using aptina is fine.

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Rob

>
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> index 389ca13..4326f52 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -20,6 +20,7 @@ amlogic       Amlogic, Inc.
>  ams    AMS AG
>  amstaos        AMS-Taos Inc.
>  apm    Applied Micro Circuits Corporation (APM)
> +aptina Aptina Imaging
>  arm    ARM Ltd.
>  armadeus       ARMadeus Systems SARL
>  asahi-kasei    Asahi Kasei Corp.
> --
> Regards,
>
> Laurent Pinchart
>
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
