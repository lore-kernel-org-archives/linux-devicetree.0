From: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH v12 0/11] dw-hdmi: convert imx hdmi to bridge/dw_hdmi
Date: Wed, 26 Nov 2014 10:29:12 +0800
Message-ID: <54753AF8.1060803@rock-chips.com>
References: <1415793593-5075-1-git-send-email-andy.yan@rock-chips.com>	<1416221635-12797-1-git-send-email-andy.yan@rock-chips.com> <CAOMZO5BH0TwOk3aFeabAqE+JssG9YL=CsTz2Tq3Q1L46fTbcCQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOMZO5BH0TwOk3aFeabAqE+JssG9YL=CsTz2Tq3Q1L46fTbcCQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, =?UTF-8?B?SGVpa28gU3TDvGJuZXI=?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, DRI mailing list <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Josh Boyer <jwboyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel@>
List-Id: devicetree@vger.kernel.org

Hi Fabio:

On 2014=E5=B9=B411=E6=9C=8826=E6=97=A5 10:14, Fabio Estevam wrote:
> Hi Andy,
>
> On Mon, Nov 17, 2014 at 8:53 AM, Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org> w=
rote:
>
>> Andy Yan (11):
>>    staging: imx-drm: imx-hdmi: make checkpatch happy
>>    staging: imx-drm: imx-hdmi: return defer if can't get ddc i2c ada=
pter
>>    staging: imx-drm: imx-hdmi: convert imx-hdmi to drm_bridge mode
>>    staging: imx-drm: imx-hdmi: move imx-hdmi to bridge/dw_hdmi
> imx-drm has moved out of staging.
>
> Please see Phillip's patch:
> http://cgit.freedesktop.org/~airlied/linux/commit/?h=3Ddrm-next&id=3D=
6556f7f82b9c401950d703072c0d8137b6f9f516
>
> So you need to re-submit your series against drm-next.
>
>
   Thanks very much for you pointing out this, I will re-submit my=20
patch  set against drm-next  soon.


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
