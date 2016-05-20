From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 3/3] ARM64: dts: amlogic: Enable Reset Controller on
 GXBB-based platforms
Date: Fri, 20 May 2016 14:19:25 +0200
Message-ID: <573F00CD.8070504@baylibre.com>
References: <1463732875-23141-1-git-send-email-narmstrong@baylibre.com>
 <1463732875-23141-4-git-send-email-narmstrong@baylibre.com>
 <20160520084748.GC16732@mephisto> <573ED06F.9070909@baylibre.com>
 <20160520091050.GC19888@mephisto>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160520091050.GC19888@mephisto>
Sender: linux-kernel-owner@vger.kernel.org
To: Carlo Caione <carlo@caione.org>
Cc: devicetree@vger.kernel.org, xing.xu@amlogic.com, victor.wan@amlogic.com, linux-kernel@vger.kernel.org, p.zabel@pengutronix.de, jerry.cao@amlogic.com, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 05/20/2016 11:10 AM, Carlo Caione wrote:
> On 20/05/16 10:53, Neil Armstrong wrote:
>> On 05/20/2016 10:47 AM, Carlo Caione wrote:
>>> On 20/05/16 10:27, Neil Armstrong wrote:
>>>> Update DTSI file to add the reset controller node.
>>>>
>>>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>>>> ---
>>>>  arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 6 ++++++
>>>>  1 file changed, 6 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
>>>> index 832815d..2463e04 100644
>>>> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
>>>> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
>>>> @@ -129,6 +129,12 @@
>>>>  			#size-cells = <2>;
>>>>  			ranges = <0x0 0x0 0x0 0xc1100000 0x0 0x100000>;
>>>>  
>>>> +			reset: reset-controller@4404 {
>>>> +				compatible = "amlogic,meson-gxbb-reset";
>>>> +				reg = <0x0 0x04404 0x0 0x20>;
>>>> +				#reset-cells = <1>;
>>>> +			};
>>>> +
>>>>  			uart_A: serial@84c0 {
>>>>  				compatible = "amlogic,meson-uart";
>>>>  				reg = <0x0 0x084c0 0x0 0x14>;
>>>
>>> Missing #include <dt-bindings/reset/amlogic,meson-gxbb-reset.h> ?
>>>
>>> Thanks,
>>>
>>
>> Shouldn't we wait until the reset bindings are actually used in the dtsi ?
>> I'm quite sure kevin will post it with the Ethernet nodes.
> 
> Why? The header file is related to the reset controller. Better add it
> now with this patchset.
> 
> Cheers,
> 

OK, I will add it in gxbb and meson8b dtsi files.

Neil
