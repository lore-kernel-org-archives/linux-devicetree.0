From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] Documentation: of: fix typo in graph bindings
Date: Tue, 13 Jan 2015 14:04:15 -0600
Message-ID: <CAL_JsqLNw_n5dpsx7AsuToH1BEDkE-WsC+NDwg2bA4BNUH_FJw@mail.gmail.com>
References: <1420452136-76466-1-git-send-email-xiakaixu@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1420452136-76466-1-git-send-email-xiakaixu-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kaixu Xia <xiakaixu-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Cc: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kaixu.xia-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jan 5, 2015 at 4:02 AM, Kaixu Xia <xiakaixu-hv44wF8Li93QT0dZR+AlfA@public.gmane.org> wrote:
> Just fix a minor typo about the example path.
>
> Signed-off-by: Kaixu Xia <xiakaixu-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>

Applied for 3.20. Thanks.

> ---
>  Documentation/devicetree/bindings/graph.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/graph.txt b/Documentation/devicetree/bindings/graph.txt
> index 1a69c07..fcb1c6a 100644
> --- a/Documentation/devicetree/bindings/graph.txt
> +++ b/Documentation/devicetree/bindings/graph.txt
> @@ -19,7 +19,7 @@ type of the connections, they just map their existence. Specific properties
>  may be described by specialized bindings depending on the type of connection.
>
>  To see how this binding applies to video pipelines, for example, see
> -Documentation/device-tree/bindings/media/video-interfaces.txt.
> +Documentation/devicetree/bindings/media/video-interfaces.txt.
>  Here the ports describe data interfaces, and the links between them are
>  the connecting data buses. A single port with multiple connections can
>  correspond to multiple devices being connected to the same physical bus.
> --
> 1.8.5.5
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
