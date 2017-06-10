From: icenowy@aosc.io
Subject: Re: [linux-sunxi] Re: [PATCH v2 01/11] dt-bindings: update the
 binding for Allwinner H3 TVE support
Date: Sat, 10 Jun 2017 23:26:47 +0800
Message-ID: <34f5ad92200d09a854d4b62ef7d60a4f@aosc.io>
References: <20170604160149.30230-1-icenowy@aosc.io>
 <20170609164915.enap3epreg5vr2gy@flea.home>
 <53E8FC74-8AC0-461A-B875-812EE4A3267E@aosc.io>
 <7305754.diZEu7DK25@jernej-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <7305754.diZEu7DK25@jernej-laptop>
Sender: linux-clk-owner@vger.kernel.org
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@siol.net>
Cc: linux-sunxi@googlegroups.com, maxime.ripard@free-electrons.com, Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

在 2017-06-10 05:24，Jernej Škrabec 写道：
> Hi!
> 
> Dne petek, 09. junij 2017 ob 18:51:02 CEST je Icenowy Zheng napisal(a):
>> 于 2017年6月10日 GMT+08:00 上午12:49:15, Maxime Ripard <maxime.ripard@free-
> electrons.com> 写到:
>> >On Wed, Jun 07, 2017 at 04:48:50PM +0800, Icenowy Zheng wrote:
>> >> >> @@ -189,6 +211,8 @@ supported.
>> >> >>
>> >> >>  Required properties:
>> >> >>    - compatible: value must be one of:
>> >> >>      * allwinner,sun8i-v3s-de2-mixer
>> >> >>
>> >> >> +    * allwinner,sun8i-h3-de2-mixer0
>> >> >> +    * allwinner,sun8i-h3-de2-mixer1
>> >> >
>> >> >Again, please explain why we need to have different compatibles
>> >> >here. If it's only about the number of planes, this should be dealt
>> >> >with a property, not a compatible.
>> >>
>> >> Only mixer0 has "VEP" and write-back support, at least on H3.
>> >
>> >What is that VEP? writeback support can also be expressed by a
>> >property.
>> 
>> I don't know what VEP is...
> 
> VEP is probably Video Enhancement Processor (?). Although I'm not sure 
> if that
> is really mixer specific. Icenowy, can you explain where did you get 
> this info?

In 
lichee/linux-3.4/drivers/video/sunxi/disp2/disp/de/lowlevel_sun8iw7/de_feat.c:

static const int de_is_support_vep[] = {
	/* DISP0 CH0 */
	1,
	/* DISP0 CH1 */
	0,
	/* DISP0 CH2 */
	0,
	/* DISP0 CH3 */
	0,
	/* DISP1 CH0 */
	0,
	/* DISP1 CH1 */
	0,
};

> 
> Best regards,
> Jernej
> 
>> 
>> But we are really facing different cores, like sun50i-a64-mmc
>> and sun50i-a64-emmc.
>> 
>> >Maxime
>> 
>> --
>> You received this message because you are subscribed to the Google 
>> Groups
>> "linux-sunxi" group. To unsubscribe from this group and stop receiving
>> emails from it, send an email to 
>> linux-sunxi+unsubscribe@googlegroups.com.
>> For more options, visit https://groups.google.com/d/optout.
