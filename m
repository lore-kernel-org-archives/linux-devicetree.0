From: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 1/2] dt-bindings: add media/cec.txt
Date: Mon, 12 Jun 2017 14:59:08 +0200
Message-ID: <a76d4eca-c9fa-a61c-dddf-435ff49af365@samsung.com>
References: <20170609175401.40204-1-hverkuil@xs4all.nl>
        <20170609175401.40204-2-hverkuil@xs4all.nl>
        <CGME20170612125919epcas1p312a7ecbffd99e025a26ba8d4444f1a5b@epcas1p3.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <20170609175401.40204-2-hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Content-language: en-GB
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 06/09/2017 07:54 PM, Hans Verkuil wrote:
> From: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
> 
> Document common HDMI CEC bindings. Add this to the MAINTAINERS file
> as well.
> 
> Signed-off-by: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>

Acked-by: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

> ---
>   Documentation/devicetree/bindings/media/cec.txt | 8 ++++++++
>   MAINTAINERS                                     | 1 +
>   2 files changed, 9 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/media/cec.txt
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

For a common property I would rather make it "hdmi-controller", this
"-phandle" part feels like appending "_pointer" to variable names in C code.
But since you are just rearranging existing documentation and Rob agrees with
that I have no objections.

> +- needs-hpd: if present the CEC support is only available when the HPD
> +  is high. Some boards only let the CEC pin through if the HPD is high,
> +  for example if there is a level converter that uses the HPD to power
> +  up or down.
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 053c3bdd1fe5..4ac340d189a3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3137,6 +3137,7 @@ F:	include/media/cec.h
>   F:	include/media/cec-notifier.h
>   F:	include/uapi/linux/cec.h
>   F:	include/uapi/linux/cec-funcs.h
> +F:	Documentation/devicetree/bindings/media/cec.txt
>   
>   CELL BROADBAND ENGINE ARCHITECTURE
>   M:	Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org
--
Regards,
Sylwester
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
