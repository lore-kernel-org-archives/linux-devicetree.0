From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/6] doc: dt: Document the indirect overlay method.
Date: Mon, 9 May 2016 16:59:14 -0500
Message-ID: <CAL_JsqL6fTdUDNW_v0gb++vTK+hnDcR1vFEFevUxbg+s7khUqg@mail.gmail.com>
References: <1462817147-7620-1-git-send-email-pantelis.antoniou@konsulko.com> <1462817147-7620-4-git-send-email-pantelis.antoniou@konsulko.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1462817147-7620-4-git-send-email-pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Koen Kooi <koen-QLwJDigV5abLmq1fohREcCpxlwaOVQ5f@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, May 9, 2016 at 1:05 PM, Pantelis Antoniou
<pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
> Add a description of the indirect overlay method to the overlay
> documention file.

Why? Please write some decent commit messages.

> Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> ---
>  Documentation/devicetree/overlay-notes.txt | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/Documentation/devicetree/overlay-notes.txt b/Documentation/devicetree/overlay-notes.txt
> index d418a6c..dd595e6 100644
> --- a/Documentation/devicetree/overlay-notes.txt
> +++ b/Documentation/devicetree/overlay-notes.txt
> @@ -100,6 +100,10 @@ Finally, if you need to remove all overlays in one-go, just call
>  of_overlay_destroy_all() which will remove every single one in the correct
>  order.
>
> +If your board has multiple slots/places where a single overlay can work
> +and each slot is defined by a node, you can use the of_overlay_create_indirect()
> +method to select the target.
> +
>  Overlay DTS Format
>  ------------------
>
> @@ -113,6 +117,11 @@ The DTS of an overlay should have the following format:
>                 target=<phandle>;       /* phandle target of the overlay */
>         or
>                 target-path="/path";    /* target path of the overlay */

Why not just let these take multiple values and the user just selects index?

> +       or
> +               target-indirect {       /* indirect target selector */
> +                       foo { target|target-path ... };
> +                       bar { .... };
> +               };
>
>                 __overlay__ {
>                         property-a;     /* add property-a to the target */
> @@ -131,3 +140,7 @@ Using the non-phandle based target method allows one to use a base DT which does
>  not contain a __symbols__ node, i.e. it was not compiled with the -@ option.
>  The __symbols__ node is only required for the target=<phandle> method, since it
>  contains the information required to map from a phandle to a tree location.
> +
> +The indirect target requires the use of a selector target on the call to
> +of_overlay_create_indirect(). I.e. passing the "foo" id will select the target
> +in the foo node, "bar" in bar node, etc.
> --
> 1.7.12
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
