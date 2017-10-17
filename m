From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] of: overlay: fix memory leak related to duplicated property
Date: Tue, 17 Oct 2017 09:06:18 -0500
Message-ID: <CAL_JsqKFZMLQSEY8655GS2i1bnO2c4+08bCaUMG=32sL9YLuZA@mail.gmail.com>
References: <1507864056-52089-1-git-send-email-alan.1.wang@nokia-sbell.com> <1508147672-58291-1-git-send-email-alan.1.wang@nokia-sbell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1508147672-58291-1-git-send-email-alan.1.wang-FTnzSCDXTkYjo0HpFSRKWA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lixin Wang <alan.1.wang-FTnzSCDXTkYjo0HpFSRKWA@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Oct 16, 2017 at 4:54 AM, Lixin Wang <alan.1.wang-FTnzSCDXTkYjo0HpFSRKWA@public.gmane.org> wrote:
> From: alawang <alan.1.wang-FTnzSCDXTkYjo0HpFSRKWA@public.gmane.org>
>
> Function of_changeset_add_property or of_changeset_update_property may
> fails. In this case the property just allocated is never deallocated.
>
> Signed-off-by: Lixin Wang <alan.1.wang-FTnzSCDXTkYjo0HpFSRKWA@public.gmane.org>
> ---
>  drivers/of/overlay.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)

Applied. Your author name and S-o-b name don't match. I fixed up the
author name. Please fix your git config.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
