From: Caesar Wang <caesar.upstream-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5 1/8] ARM: dts: rockchip: add hdmi/vop device node for
 rk3036
Date: Sun, 21 Feb 2016 10:18:41 +0800
Message-ID: <56C91E81.2090803@gmail.com>
References: <1454384032-6794-1-git-send-email-wxt@rock-chips.com>
 <1454384453-7127-1-git-send-email-wxt@rock-chips.com>
 <6774166.XfKvalhQ7F@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <6774166.XfKvalhQ7F@phil>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, leozwang-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, keescook-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org



=E5=9C=A8 2016=E5=B9=B402=E6=9C=8821=E6=97=A5 08:03, Heiko Stuebner =E5=
=86=99=E9=81=93:
> Am Dienstag, 2. Februar 2016, 11:40:50 schrieb Caesar Wang:
>> This patch adds the needed display info for rk3036 SOCs.
>>
>> The rk3036 support two overlay plane and one hwc plane,
>> it supports IOMMU, and its IOMMU same as rk3288's.
>> Meanwhile, add the inno hdmi for HDMI display.
>>
>> Signed-off-by: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> I've split this into 3 patches (vop, hdmi, kylin enablement) and appl=
ied
> this to my dts32 branch.

That's great, thanks.


>
> Heiko
>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip


--=20
Thanks,
Caesar

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
