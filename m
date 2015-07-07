From: Dinh Nguyen <dinguyen@opensource.altera.com>
Subject: Re: [PATCH 1/3] ARM: socfpga: dts: Fix adxl34x formating
Date: Tue, 7 Jul 2015 09:00:02 -0500
Message-ID: <559BDB62.4060105@opensource.altera.com>
References: <1435285559-11053-1-git-send-email-walter@vanguardiasur.com.ar>
	<20150626071656.GC26041@pengutronix.de>
 <CABxpGwASLHuXtTp--q8iu3FDCsOXT-03VRCsgL51JfnTaZ80sQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CABxpGwASLHuXtTp--q8iu3FDCsOXT-03VRCsgL51JfnTaZ80sQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Walter Lozano <walter@vanguardiasur.com.ar>, Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org



On 6/26/15 5:36 AM, Walter Lozano wrote:
> Hi Steffen
> 
> On Fri, Jun 26, 2015 at 4:16 AM, Steffen Trumtrar
> <s.trumtrar@pengutronix.de> wrote:
>> Hi Walter!
>>
>> On Thu, Jun 25, 2015 at 11:25:57PM -0300, Walter Lozano wrote:
>>> This patch fixes the formating of DTS bindings for the adxl34x digital
>>> accelerometer.
>>>
>>> Signed-off-by: Walter Lozano <walter@vanguardiasur.com.ar>
>>> ---
>>>  arch/arm/boot/dts/socfpga_cyclone5_sockit.dts |    6 +++---
>>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/arch/arm/boot/dts/socfpga_cyclone5_sockit.dts b/arch/arm/boot/dts/socfpga_cyclone5_sockit.dts
>>> index 71468a7..5b60692 100644
>>> --- a/arch/arm/boot/dts/socfpga_cyclone5_sockit.dts
>>> +++ b/arch/arm/boot/dts/socfpga_cyclone5_sockit.dts
>>> @@ -73,14 +73,14 @@
>>>       status = "okay";
>>>  };
>>>
>>> -&i2c1{
>>> +&i2c1 {
>>>       status = "okay";
>>>
>>> -     accel1: accel1@53{
>>> +     accel1: accelerometer@53 {
>>>               compatible = "adxl34x";
>>>               reg = <0x53>;
>>>
>>> -             interrupt-parent = < &portc >;
>>> +             interrupt-parent = <&portc>;
>>>               interrupts = <3 2>;
>>>       };
>>>  };
>>
>> I would personally squash 3/3 into this one, but otherwise:
>>
>> Whole series
>>
>>         Acked-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
>>
> 
> Thanks for your comments. I have no problem at all. Dinh?

I've applied and squashed 1/3 and 3/3 together.

Thanks,
Dinh
