From: Jianqun Xu <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH] spi/rockchip: Add dt-binding for Rockchip rk3399 spi
Date: Wed, 17 Feb 2016 08:21:58 +0800
Message-ID: <56C3BD26.3030704@rock-chips.com>
References: <1455614538-4415-1-git-send-email-jay.xu@rock-chips.com>
 <20160216132223.GM18327@sirena.org.uk> <1730751.NYv1NxJVuB@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=gbk;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1730751.NYv1NxJVuB@phil>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Heiko

=D4=DA 16/02/2016 22:37, Heiko Stuebner =D0=B4=B5=C0:
> Am Dienstag, 16. Februar 2016, 13:22:23 schrieb Mark Brown:
>> On Tue, Feb 16, 2016 at 05:22:18PM +0800, jianqun.xu wrote:
>>>   Documentation/devicetree/bindings/spi/spi-rockchip.txt | 1 +
>>>   1 file changed, 1 insertion(+)
>>
>> I'd expect this to be added to both the driver and the binding docum=
ent
>> not just the document.
>
> It seems the driver can still use the rk3066-variant - aka nobody has=
 found
> specific issues in the rk3399 IP implementation.
>
> Having the more specific IP names already in the dts before actually =
using
> them was suggested by devicetree people to not have to exchange every=
thing
> once specific issues were found.
>
> So right now it's using the fallback-mechanism of binding to the rk30=
66
> name, but if some obstacle appears it will only take adding the bindi=
ng in
> the driver to make it work (even with old devicetrees).
>
>
Thank you, got it, and I will re-send this patch with the driver patch.
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
