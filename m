From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4] of: dynamic: fix memory leak related to properties of __of_node_dup
Date: Fri, 20 Oct 2017 13:12:25 -0500
Message-ID: <CAL_Jsq+OaT5XeUs4yhHwNUGSb932Nr53xQDaCjUXopR6ziifuA@mail.gmail.com>
References: <1507858967-40416-1-git-send-email-alan.1.wang@nokia-sbell.com> <1508464749-54218-1-git-send-email-alan.1.wang@nokia-sbell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1508464749-54218-1-git-send-email-alan.1.wang-FTnzSCDXTkYjo0HpFSRKWA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lixin Wang <alan.1.wang-FTnzSCDXTkYjo0HpFSRKWA@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 19, 2017 at 8:59 PM, Lixin Wang <alan.1.wang-FTnzSCDXTkYjo0HpFSRKWA@public.gmane.org> wrote:
> If a node with no properties is dynamically added, then a property is
> dynamically added to the node, then the property is dynamically removed,
> the result will be node->properties == NULL and node->deadprops != NULL.
>
> Add a separate function to release the properties in both lists.
>
> Signed-off-by: Lixin Wang <alan.1.wang-FTnzSCDXTkYjo0HpFSRKWA@public.gmane.org>
> Reviewed-by: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>
> ---
> Thanks the idea from Rob Herring, that I forgot to mention at patch v3.
> Thanks Frank Rowand for writing to me the example.
>
> v3 -> v4:
>  * Using the style that is more consistent with device tree
>    code, as suggested by Frank Rowand
>
>  drivers/of/dynamic.c | 25 +++++++++++++------------
>  1 file changed, 13 insertions(+), 12 deletions(-)

Applied.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
