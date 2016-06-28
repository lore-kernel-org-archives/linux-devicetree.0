From: Xing Zheng <zhengxing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [RESEND PATCH v2 0/4] Add support i2s/spdif/gmac features for
 RK322x SoCs
Date: Tue, 28 Jun 2016 17:53:06 +0800
Message-ID: <57724902.2060802@rock-chips.com>
References: <1466565413-31027-1-git-send-email-zhengxing@rock-chips.com>
 <16135166.EFsm9ojsF0@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <16135166.EFsm9ojsF0@phil>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, radek.dostal-6oiIBCxl0MMjD8S081q9vkEOCMrvLtNR@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, roger.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Thanks Heiko. :-)

On 2016=E5=B9=B406=E6=9C=8828=E6=97=A5 03:43, Heiko Stuebner wrote:
> Am Mittwoch, 22. Juni 2016, 11:16:49 schrieb Xing Zheng:
>> Hi,
>>    We have the brother chipset product that RK3228 and RK3229,
>> They have many common configuration, but there are a number
>> of different features. In order to develop the future when they
>> are easy to distinguish, we need them to be independent.
>>    And, these patchset add i2s/gmac dts nodes for RK322x SoCs,
>> and add the new dts file of the rk3229 evb board.
> applied to my dts32 branch for 4.8 with the following changes
>
>> Xing Zheng (4):
>>    ARM: dts: rockchip: rename rk3228.dtsi to rk322x.dtsi
> we'll refrain from adding empty rk3228.dtsi files until we have actua=
l things
> to fill it with.
>
>>    ARM: dts: rockchip: add i2s nodes for RK322x SoCs
> moved i2s node to correct position according to register map
>
>>    ARM: dts: rockchip: add GMAC nodes for RK322x SoCs
> dropped phy-mode and pinctrl settings, as rgmii <-> rmii is a per-boa=
rd
> thing
>
>>    ARM: dts: rockchip: add support rk3229 evb board
> again dropped the empty rk3229.dtsi, we can add that once there are
> additions not shared between rk3228/rk3229.
>
>
> Heiko
>
>
>

--=20
- Xing Zheng


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
