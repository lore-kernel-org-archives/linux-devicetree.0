From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 6/6] doc: dt: Document the target root overlay method
Date: Tue, 17 May 2016 07:58:22 -0500
Message-ID: <CAL_JsqKX1m-gKBGUcxaHJm-ih-QHhHbpHBqMJbb5KXeG9eStQQ@mail.gmail.com>
References: <1463429892-3369-1-git-send-email-pantelis.antoniou@konsulko.com> <1463429892-3369-7-git-send-email-pantelis.antoniou@konsulko.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1463429892-3369-7-git-send-email-pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Koen Kooi <koen-QLwJDigV5abLmq1fohREcCpxlwaOVQ5f@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, May 16, 2016 at 3:18 PM, Pantelis Antoniou
<pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
> Add a description of the target root overlay method to the overlay
> documention file.
>
> Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> ---
>  Documentation/devicetree/overlay-notes.txt | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/Documentation/devicetree/overlay-notes.txt b/Documentation/devicetree/overlay-notes.txt
> index 6995fc1..3e8df30 100644
> --- a/Documentation/devicetree/overlay-notes.txt
> +++ b/Documentation/devicetree/overlay-notes.txt
> @@ -104,6 +104,10 @@ If your board has multiple slots/places where a single overlay can work
>  and each slot is defined by a node, you can use the
>  of_overlay_create_target_index() method to select the target.
>
> +For overlays on probeable busses, use the of_overlay_create_target_root() method
> +in which you supply a device node as a target root, and which all target
> +references in the overlay are performed relative to that node.

This needs a better explanation and an example. "Applying overlays to
multiple places for probeable busses" is not sufficient. Describe what
is the problem/flow, and then how does the implementation work. I
don't think this problem is limited to probeable busses either. Not
knowing the target to apply the overlay to is the same problem for
connectors with non-probeable signals.

I find a couple of things problematic with the implementation. There's
no way to validate that an overlay should apply to a base node. If
users just always make the target "/", then any overlay can apply to
any location the nodes could apply anywhere. It requires a kernel
change for every location you want to apply the overlay to. Maybe I
don't understand the usecase.

I feel like we are creating too many syntax's to apply overlays. I get
that there are different usecases, but that doesn't necessarily mean
the syntax needs to be different.

> +
>  Overlay DTS Format
>  ------------------
>
> @@ -141,3 +145,7 @@ contains the information required to map from a phandle to a tree location.
>  Using a target index requires the use of a selector target on the call to
>  of_overlay_create_target_index(). I.e. passing an index of 0 will select the
>  target in the foo node, an index of 1 the bar node, etc.
> +
> +Note that when using the target root create method all target references must
> +lie under the target root node. I.e. the overlay is not allowed to 'break' out
> +of the root.

That is not enforceable though, right?

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
