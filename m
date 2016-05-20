From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 3/3] ARM64: dts: amlogic: Enable Reset Controller on
 GXBB-based platforms
Date: Fri, 20 May 2016 14:23:46 +0200
Message-ID: <573F01D2.1090602@baylibre.com>
References: <1463732875-23141-1-git-send-email-narmstrong@baylibre.com>
 <1463732875-23141-4-git-send-email-narmstrong@baylibre.com>
 <20160520084748.GC16732@mephisto> <573ED06F.9070909@baylibre.com>
 <20160520091050.GC19888@mephisto> <573F00CD.8070504@baylibre.com>
 <20160520122245.GA22047@mephisto>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160520122245.GA22047@mephisto>
Sender: linux-kernel-owner@vger.kernel.org
To: Carlo Caione <carlo@caione.org>
Cc: devicetree@vger.kernel.org, xing.xu@amlogic.com, victor.wan@amlogic.com, linux-kernel@vger.kernel.org, p.zabel@pengutronix.de, linux-amlogic@lists.infradead.org, jerry.cao@amlogic.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 05/20/2016 02:22 PM, Carlo Caione wrote:
> On 20/05/16 14:19, Neil Armstrong wrote:
> 
> [...]
>>>>> Missing #include <dt-bindings/reset/amlogic,meson-gxbb-reset.h> ?
>>>>>
>>>>> Thanks,
>>>>>
>>>>
>>>> Shouldn't we wait until the reset bindings are actually used in the dtsi ?
>>>> I'm quite sure kevin will post it with the Ethernet nodes.
>>>
>>> Why? The header file is related to the reset controller. Better add it
>>> now with this patchset.
>>>
>>> Cheers,
>>>
>>
>> OK, I will add it in gxbb and meson8b dtsi files.
> 
> Why also meson8b DTSI?
> 

Sorry, I'll add the meson8b specific header of course.

Neil
