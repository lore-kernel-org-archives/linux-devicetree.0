From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] of: fdt: mark unflattened tree as detached
Date: Mon, 18 Jul 2016 16:44:01 -0500
Message-ID: <CAL_JsqLiFYbcqj__B+WB7Q4=MCsr0NOwg4BpRqg1GH+=gadsVg@mail.gmail.com>
References: <cover.1466971467.git.hramrach@gmail.com> <01da4c372750e6618638a0320e7ea2f656da3ae5.1466971467.git.hramrach@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <01da4c372750e6618638a0320e7ea2f656da3ae5.1466971467.git.hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Jun 26, 2016 at 3:11 PM, Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> The tree returned from of_fdt_unflatten_tree cannot be attached to the
> live tree because it is not marked as detached so mark it as such. The
> dt resolver checks the flag and refuses to process the tree otherwise.
>
> Signed-off-by: Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/of/fdt.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)

This doesn't apply because the unflattening code has been re-written.
Please rebase to current -rc and resend.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
