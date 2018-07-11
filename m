From: Icenowy Zheng <icenowy@aosc.io>
Subject: Re: [linux-sunxi] Re: [PATCH 1/2] ARM: sun8i: h3: enable HDMI output on Banana Pi M2 Zero
Date: Wed, 11 Jul 2018 23:15:50 +0800
Message-ID: <8F6CDF5C-2AC1-43EC-858A-5C6345CF279A@aosc.io>
References: <20180711132233.42301-1-icenowy@aosc.io> <20180711132233.42301-2-icenowy@aosc.io> <20180711150532.6gzm7krouriddreh@flea>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180711150532.6gzm7krouriddreh@flea>
Sender: linux-kernel-owner@vger.kernel.org
To: maxime.ripard@bootlin.comMaxime Ripard <maxime.ripard@bootlin.com>
Cc: Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org



于 2018年7月11日 GMT+08:00 下午11:05:32, Maxime Ripard <maxime.ripard@bootlin.com> 写到:
>Hi,
>
>On Wed, Jul 11, 2018 at 09:22:32PM +0800, Icenowy Zheng wrote:
>> Banana Pi M2 Zero board has a miniHDMI port connected to the HDMI
>> controller of Allwinner H3 SoC.
>> 
>> Enable the HDMI output in Banana Pi M2 Zero device tree.
>> 
>> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
>> ---
>>  .../dts/sun8i-h2-plus-bananapi-m2-zero.dts    | 25
>+++++++++++++++++++
>>  1 file changed, 25 insertions(+)
>> 
>> diff --git a/arch/arm/boot/dts/sun8i-h2-plus-bananapi-m2-zero.dts
>b/arch/arm/boot/dts/sun8i-h2-plus-bananapi-m2-zero.dts
>> index 7d01f9322658..eb61dcf32797 100644
>> --- a/arch/arm/boot/dts/sun8i-h2-plus-bananapi-m2-zero.dts
>> +++ b/arch/arm/boot/dts/sun8i-h2-plus-bananapi-m2-zero.dts
>> @@ -26,6 +26,17 @@
>>  		stdout-path = "serial0:115200n8";
>>  	};
>>  
>> +	hdmi-connector {
>> +		compatible = "hdmi-connector";
>> +		type = "c";
>
>This is not one of the connector type declared in DRM, how is it
>exposed to the userspace?

So just use "A" here (because of single link)?

>
>Maxime
