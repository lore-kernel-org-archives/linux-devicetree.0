From: Jianqun Xu <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH v2.1 2/4] spi: rockchip: add bindings for rk3399 spi
Date: Fri, 19 Feb 2016 10:44:42 +0800
Message-ID: <56C6819A.8090106@rock-chips.com>
References: <1455762983-29980-1-git-send-email-jay.xu@rock-chips.com>
 <1455762983-29980-3-git-send-email-jay.xu@rock-chips.com>
 <20160218094108.GA7129@sirena.org.uk> <2327512.KAqs6H56Km@phil>
 <56C5959D.3030806@rock-chips.com> <20160218135751.GE7129@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=gbk;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160218135751.GE7129-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sjoerd.simons-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Mark

=D4=DA 18/02/2016 21:57, Mark Brown =D0=B4=B5=C0:
> On Thu, Feb 18, 2016 at 05:57:49PM +0800, Jianqun Xu wrote:
>
>> I'm a little confuse, I have upstreamed rockchip-i2s, and the i2s dr=
iver set
>> the compatible like:
>> - compatible: should be one of the followings
>>     - "rockchip,rk3066-i2s": for rk3066
>>     - "rockchip,rk3188-i2s", "rockchip,rk3066-i2s": for rk3188
>>     - "rockchip,rk3288-i2s", "rockchip,rk3066-i2s": for rk3288
>>     - "rockchip,rk3399-i2s", "rockchip,rk3066-i2s": for rk3399
>> and the driver only has
>> static const struct of_device_id rockchip_i2s_match[] =3D {
>> 	{ .compatible =3D "rockchip,rk3066-i2s", },
>> 	{},
>> };
>
>> The spi of rk3399 as same as rk3066, rk3188, rk3288, like i2s, if th=
ey are
>> keep different rules ?
>
> No, that's just something that got missed in review and which should =
be
> fixed.
>
Got it, it's will be fixed in a separate patch later, thank you very mu=
ch.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
