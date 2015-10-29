From: Yakir Yang <ykk@rock-chips.com>
Subject: Re: [PATCH v8 06/17] dt-bindings: add document for analogix display
 port driver
Date: Thu, 29 Oct 2015 09:12:21 +0800
Message-ID: <56317275.90508@rock-chips.com>
References: <1446020143-32645-1-git-send-email-ykk@rock-chips.com>
 <1446020793-10532-1-git-send-email-ykk@rock-chips.com>
 <103292898.nCEg51kmfI@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <103292898.nCEg51kmfI@phil>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: Inki Dae <inki.dae@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Jingoo Han <jingoohan1@gmail.com>, Thierry Reding <treding@nvidia.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Yao <mark.yao@rock-chips.com>, Russell King <linux@arm.linux.org.uk>, djkurtz@chromium.org, dianders@chromium.org, Sean Paul <seanpaul@chromium.org>, Kukjin Kim <kgene@kernel.org>, Kumar Gala <galak@codeaurora.org>, emil.l.velikov@gmail.com, Ian Campbell <ijc+devicetree@hellion.org.uk>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Kishon Vijay Abraham I <kishon@ti.com>, Pawel Moll <pawel.moll@arm.com>, ajaynumb@gmail.com, robherring2@gmail.com, javier@osg.samsung.com, Andy Yan <andy.yan@rock-chips.com>, dri-deve
List-Id: devicetree@vger.kernel.org

Hi Heiko,

On 10/29/2015 04:02 AM, Heiko Stuebner wrote:
> Hi Yakir,
>
> Am Mittwoch, 28. Oktober 2015, 16:26:33 schrieb Yakir Yang:
>> diff --git a/Documentation/devicetree/bindings/display/exynos/exynos_dp.txt b/Documentation/devicetree/bindings/display/exynos/exynos_dp.txt
>> index 7a3a9cd..9905081 100644
>> --- a/Documentation/devicetree/bindings/display/exynos/exynos_dp.txt
>> +++ b/Documentation/devicetree/bindings/display/exynos/exynos_dp.txt
>> @@ -31,45 +31,31 @@ Required properties for dp-controller:
>>   		from general PHY binding: the phandle for the PHY device.
>>   	-phy-names:
>>   		from general PHY binding: Should be "dp".
>> -	-samsung,color-space:
>> -		input video data format.
>> -			COLOR_RGB = 0, COLOR_YCBCR422 = 1, COLOR_YCBCR444 = 2
>> -	-samsung,dynamic-range:
>> -		dynamic range for input video data.
>> -			VESA = 0, CEA = 1
>> -	-samsung,ycbcr-coeff:
>> -		YCbCr co-efficients for input video.
>> -			COLOR_YCBCR601 = 0, COLOR_YCBCR709 = 1
>> -	-samsung,color-depth:
>> -		number of bits per colour component.
>> -			COLOR_6 = 0, COLOR_8 = 1, COLOR_10 = 2, COLOR_12 = 3
>> -	-samsung,link-rate:
>> -		link rate supported by the panel.
>> -			LINK_RATE_1_62GBPS = 0x6, LINK_RATE_2_70GBPS = 0x0A
>> -	-samsung,lane-count:
>> -		number of lanes supported by the panel.
>> -			LANE_COUNT1 = 1, LANE_COUNT2 = 2, LANE_COUNT4 = 4
>> -	- display-timings: timings for the connected panel as described by
>> -		Documentation/devicetree/bindings/video/display-timing.txt
> 											^^ display/display-timings.txt
> otherwise this patch does not apply.

I thought I have deleted this old path of "display-timing.txt", and 
changed it to

-		Documentation/devicetree/bindings/video/display-timing.txt

+		Documentation/devicetree/bindings/display/panel/display-timing.txt

And the real path of "display-timing.txt" in linux-next [tag 20151022] 
do under
the "display/panel/", those change should be right.

Thanks,
- Yakir
