From: Mark yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH v8.1 1/2] drm/rockchip: hdmi: add Innosilicon HDMI support
Date: Thu, 18 Feb 2016 10:54:02 +0800
Message-ID: <56C5324A.5080009@rock-chips.com>
References: <1454049768-30872-1-git-send-email-ykk@rock-chips.com> <1454492697-7837-1-git-send-email-ykk@rock-chips.com> <3883951.Go5JsyhPRt@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3883951.Go5JsyhPRt@phil>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ken Mixte <kmixter-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Ben Chan <benchan-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Zheng Yang <zhengyang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2016=E5=B9=B402=E6=9C=8818=E6=97=A5 05:00, Heiko Stuebner wrote:
> Am Mittwoch, 3. Februar 2016, 17:44:57 schrieb Yakir Yang:
>> The Innosilicon HDMI is a low power HDMI 1.4 transmitter
>> IP, and it have been integrated on some rockchip CPUs
>> (like RK3036, RK312x).
>>
>> Signed-off-by: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> On a Kylin board against 4.5-rc
> Tested-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>

Good, Thanks your Tested-by.

> @Mark: While testing I noticed a black box around my cursor. It moves=
 with
> the cursor, so seems to be the plane itself - the hdmi driver is of c=
ourse
> innocent. May there exist an issue with plane transparency?

Oh, yes, it's my problem, forget to add transparency for rk3036 plane, =
I=20
will do it later soon.

>
>
> Heiko
>
>
>

--=20
=EF=BC=ADark Yao


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
