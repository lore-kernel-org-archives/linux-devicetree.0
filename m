From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Usage of for_each_child_of_node()
Date: Sat, 12 Oct 2013 22:15:03 -0500
Message-ID: <CAL_Jsq+wBGV6KGo4Ngrxr4_aZ=0eWPTbt0n4bhhrpERB55bQyg@mail.gmail.com>
References: <5259B6F8.3070701@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5259B6F8.3070701-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Oct 12, 2013 at 3:54 PM, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org> wrote:
> Hi all,
>
> for_each_child_of_node() and similar functions increase the refcount
> on each returned node and expect the caller to release the node by
> calling of_node_put() when done.
>
> Looking through the kernel code, it appears this is hardly ever done,
> if at all. Some code even calls of_node_get() on returned nodes again.
>
> I guess this doesn't matter in cases where devicetree is a static entity.
> However, this is not (or no longer) the case with devicetree overlays,
> or more generically in cases where devicetree nodes are added and
> removed dynamically.
>
> Fundamental question: Would patches to fix this problem be accepted upstream
> ?

Certainly.

> Or, of course, stepping a bit back: Am I missing something essential ?

No. I think this is frequently wrong since it typically doesn't matter
for static entries as you mention.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
