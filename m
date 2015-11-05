From: Xing Zheng <zhengxing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH v6 6/8] ARM: rockchip: add support smp for rk3036
Date: Thu, 05 Nov 2015 11:00:46 +0800
Message-ID: <563AC65E.6050201@rock-chips.com>
References: <1446639503-11763-1-git-send-email-zhengxing@rock-chips.com> <1446639916-11957-1-git-send-email-zhengxing@rock-chips.com> <3167530.TSdLBvl1Zs@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3167530.TSdLBvl1Zs@phil>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2015=E5=B9=B411=E6=9C=8805=E6=97=A5 07:33, Heiko Stuebner wrote:
> Am Mittwoch, 4. November 2015, 20:25:16 schrieb Xing Zheng:
>> From: Heiko Stuebner<heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
>>
>> The dual-core Cortex A7 rk3036 is a bit special in that it does not =
allow
>> to control the actual powerdomain of the cpu cores, while the rest o=
f the
>> smp-bringup like reset control and entry address handling stays the =
same.
>> Its bigger sibling, the quad-core rk3128 again allows powerdomain co=
ntrol.
>>
>> So allow that case by introducing a separate smp-enable-method, that=
 simply
>> disables powerdomain handling in the common code.
>>
>> Signed-off-by: Heiko Stuebner<heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
>> Tested-by: Xing Zheng<zhengxing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>> Signed-off-by: Xing Zheng<zhengxing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> This patch can work standalone, so I took the liberty of applying it =
to my soc
> branch for 4.5 already, so you don't need to resend it in future vers=
ions.
>
>
>
OK=EF=BC=8C thanks Heiko. :)

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
