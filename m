From: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH v8 02/17] drm: bridge: analogix/dp: split exynos dp driver
 to bridge directory
Date: Fri, 27 Nov 2015 09:20:44 +0800
Message-ID: <5657AFEC.60004@rock-chips.com>
References: <1446020143-32645-1-git-send-email-ykk@rock-chips.com>
 <1446020519-625-1-git-send-email-ykk@rock-chips.com>
 <1812354.kkj0DGG9mi@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1812354.kkj0DGG9mi@diego>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Seung-Woo Kim <sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Gustavo Padovan <gustavo.padovan-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, ajaynumb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, dri-deve
List-Id: devicetree@vger.kernel.org

Hi Heiko,

Thanks you for feedback, I do see some conflicts in Exynos Make/Kconfig
file [02/17] and dtsi file [07/17] when I try to apply this series on=20
4.4-rc1
branch.

Hmm... Due to I have update some patches to version 10 already, this
series may be become harder to reviewed, should I just send the whole
series out that update the version to v10.

Thanks
- Yakir


On 11/27/2015 01:30 AM, Heiko St=FCbner wrote:
> Hi Yakir,
>
> Am Mittwoch, 28. Oktober 2015, 16:21:59 schrieb Yakir Yang:
>> Split the dp core driver from exynos directory to bridge directory,
>> and rename the core driver to analogix_dp_*, rename the platform
>> code to exynos_dp.
>>
>> Beside the new analogix_dp driver would export four hooks.
>> "analogix_dp_bind()" and "analogix_dp_unbind()"
>> "analogix_dp_detect()" and "analogix_dp_get_modes()"
>>
>> The bind/unbind symbols is used for analogix platform driver to conn=
ect
>> with analogix_dp core driver. And the detect/get_modes is used for a=
nalogix
>> platform driver to init the connector.
>>
>> They reason why connector need register in helper driver is rockchip=
 drm
>> haven't implement the atomic API, but Exynos drm have implement it, =
so
>> there would need two different connector helper functions, that's wh=
y we
>> leave the connector register in helper driver.
>>
>> Tested-by: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
>> Signed-off-by: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> [...]
>
>> diff --git a/drivers/gpu/drm/exynos/Kconfig b/drivers/gpu/drm/exynos=
/Kconfig
>> index bd1a415..5f74f80 100644
>> --- a/drivers/gpu/drm/exynos/Kconfig
>> +++ b/drivers/gpu/drm/exynos/Kconfig
>> @@ -55,8 +55,9 @@ config DRM_EXYNOS_DSI
>>   	  This enables support for Exynos MIPI-DSI device.
>>
>>   config DRM_EXYNOS_DP
>> -	bool "EXYNOS DRM DP driver support"
>> +	bool "EXYNOS specific extensions for Analogix DP driver"
>>   	depends on DRM_EXYNOS && (DRM_EXYNOS_FIMD || DRM_EXYNOS7_DECON)
>> +	select DRM_ANALOGIX_DP
>>   	default DRM_EXYNOS
>>   	select DRM_PANEL
>>   	help
> This doesn't apply anymore to 4.4-rc due to other changes in there. T=
he
> exynos/Makefile is affected as well.
>
>
>
>


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
