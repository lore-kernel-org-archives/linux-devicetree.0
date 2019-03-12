From: Icenowy Zheng <icenowy@aosc.io>
Subject: Re: [PATCH 04/14] pinctrl: sunxi: v3: really introduce support for V3
Date: Tue, 12 Mar 2019 23:45:06 +0800
Message-ID: <7B6C1341-BAB5-48C5-9E60-11BCEAC3D0CD@aosc.io>
References: <20190312152256.35574-1-icenowy@aosc.io> <20190312152256.35574-5-icenowy@aosc.io> <20190312153654.25r5orlw7qjtlhbt@flea>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190312153654.25r5orlw7qjtlhbt@flea>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, Maxime Ripard <maxime.ripard@bootlin.com>
Cc: devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, linux-sunxi@googlegroups.com, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org



于 2019年3月12日 GMT+08:00 下午11:36:54, Maxime Ripard <maxime.ripard@bootlin.com> 写到:
>On Tue, Mar 12, 2019 at 11:22:46PM +0800, Icenowy Zheng wrote:
>> Introduce the GPIO pins that is only available on V3 (not on V3s) to
>the
>> V3 pinctrl driver.
>> 
>> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
>> ---
>>  drivers/pinctrl/sunxi/pinctrl-sun8i-v3.c | 291
>+++++++++++++++++++++--
>>  drivers/pinctrl/sunxi/pinctrl-sunxi.h    |   2 +
>>  2 files changed, 275 insertions(+), 18 deletions(-)
>> 
>> diff --git a/drivers/pinctrl/sunxi/pinctrl-sun8i-v3.c
>b/drivers/pinctrl/sunxi/pinctrl-sun8i-v3.c
>> index 6704ce8e5e3d..54c210871a95 100644
>> --- a/drivers/pinctrl/sunxi/pinctrl-sun8i-v3.c
>> +++ b/drivers/pinctrl/sunxi/pinctrl-sun8i-v3.c
>> @@ -1,5 +1,5 @@
>>  /*
>> - * Allwinner V3s SoCs pinctrl driver.
>> + * Allwinner V3/V3s SoCs pinctrl driver.
>>   *
>>   * Copyright (C) 2016 Icenowy Zheng <icenowy@aosc.xyz>
>>   *
>> @@ -23,7 +23,7 @@
>>  
>>  #include "pinctrl-sunxi.h"
>>  
>> -static const struct sunxi_desc_pin sun8i_v3s_pins[] = {
>> +static const struct sunxi_desc_pin sun8i_v3_v3s_pins[] = {
>
>I'm not sure all that remaining is worth it to be honest. It adds a
>lot of noise for no particular reason (and the same goes for renaming
>the file itself)

Maybe keeping names is okay "for historial reasons".

In fact I want to keep them.

>
>Maxime

-- 
使用 K-9 Mail 发送自我的Android设备。
