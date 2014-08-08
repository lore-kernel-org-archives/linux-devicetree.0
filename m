From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v5 1/4] Documentation: dt-bindings: add dt binding info
 for Rockchip dwc2
Date: Fri, 8 Aug 2014 08:42:14 -0700
Message-ID: <CAD=FV=WzGJ5HMffxRKMTS_Rue5VRK+M6kU3suv316sJS=81sQw@mail.gmail.com>
References: <1407470159-14722-1-git-send-email-kever.yang@rock-chips.com>
	<1407470159-14722-2-git-send-email-kever.yang@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1407470159-14722-2-git-send-email-kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Paul Zimmerman <paulz-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Sonny Rao <sonnyrao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Addy Ke <addy.ke-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Eddie Cai <cf-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Jianqun Xu <xjq-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, wulf <wulf-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, lyz <lyz-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, han jiang <hj-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Tao Huang <huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Paul Zimmerman <Paul.Zimmerman-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Kever,

On Thu, Aug 7, 2014 at 8:55 PM, Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org> wrote:
> This add necessary dwc2 binding documentation for Rockchip socs:
> rk3066, rk3188 and rk3288
>
> Signed-off-by: Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>
> Changes in v5: None
> Changes in v4: None
> Changes in v3: None
> Changes in v2:
> - Split out dr_mode and rk3288 bindings.
> - add compatible "snps,dwc2" bingding info
>
>  Documentation/devicetree/bindings/usb/dwc2.txt | 3 +++
>  1 file changed, 3 insertions(+)

IMHO this series is ready to go in for 3.18 whenever maintainers feel
it's the right time.

Reviewed-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
