From: Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] dt-bindings: add media/cec.txt
Date: Mon, 12 Jun 2017 14:50:51 +0200
Message-ID: <CA+M3ks7SbgyvWCKbkJD2T9gdyhbKQ9PGyp9jY1M0sbuuNDtXLQ@mail.gmail.com>
References: <20170609175401.40204-1-hverkuil@xs4all.nl> <20170609175401.40204-2-hverkuil@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170609175401.40204-2-hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Cc: "linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

2017-06-09 19:54 GMT+02:00 Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>:
> From: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
>
> Document common HDMI CEC bindings. Add this to the MAINTAINERS file
> as well.
>
> Signed-off-by: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
> Cc: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Cc: Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> ---
>  Documentation/devicetree/bindings/media/cec.txt | 8 ++++++++
>  MAINTAINERS                                     | 1 +
>  2 files changed, 9 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/cec.txt
>
> diff --git a/Documentation/devicetree/bindings/media/cec.txt b/Documentation/devicetree/bindings/media/cec.txt
> new file mode 100644
> index 000000000000..22d7aae3d3d7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/cec.txt
> @@ -0,0 +1,8 @@
> +Common bindings for HDMI CEC adapters
> +
> +- hdmi-phandle: phandle to the HDMI controller.
> +
> +- needs-hpd: if present the CEC support is only available when the HPD
> +  is high. Some boards only let the CEC pin through if the HPD is high,
> +  for example if there is a level converter that uses the HPD to power
> +  up or down.
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 053c3bdd1fe5..4ac340d189a3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3137,6 +3137,7 @@ F:        include/media/cec.h
>  F:     include/media/cec-notifier.h
>  F:     include/uapi/linux/cec.h
>  F:     include/uapi/linux/cec-funcs.h
> +F:     Documentation/devicetree/bindings/media/cec.txt
>
>  CELL BROADBAND ENGINE ARCHITECTURE
>  M:     Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> --
> 2.11.0
>

Looks good for me

Acked-by: Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
