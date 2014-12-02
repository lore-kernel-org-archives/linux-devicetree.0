From: Thor Thayer <tthayer@opensource.altera.com>
Subject: Re: [PATCHv5 5/5] arm: dts: Add Altera L2 Cache and OCRAM EDAC
Date: Tue, 2 Dec 2014 11:55:27 -0600
Message-ID: <547DFD0F.7000004@opensource.altera.com>
References: <1415751263-1830-1-git-send-email-tthayer@opensource.altera.com> <1415751263-1830-6-git-send-email-tthayer@opensource.altera.com> <20141202145735.GL23671@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20141202145735.GL23671@leverpostej>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: "bp@alien8.de" <bp@alien8.de>, "dougthompson@xmission.com" <dougthompson@xmission.com>, "m.chehab@samsung.com" <m.chehab@samsung.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Pawel Moll <Pawel.Moll@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "galak@codeaurora.org" <galak@codeaurora.org>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "dinguyen@opensource.altera.com" <dinguyen@opensource.altera.com>, "grant.likely@linaro.org" <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "tthayer.linux@gmail.com" <tthayer.linux@gmail.com>
List-Id: devicetree@vger.kernel.org


On 12/02/2014 08:57 AM, Mark Rutland wrote:
> On Wed, Nov 12, 2014 at 12:14:23AM +0000, tthayer@opensource.altera.com wrote:
>> From: Thor Thayer <tthayer@opensource.altera.com>
>>
>> Adding the device tree entries and bindings needed to support
>> the Altera L2 cache and On-Chip RAM EDAC. This patch relies upon
>> an earlier patch to declare and setup On-chip RAM properly.
>> http://www.spinics.net/lists/devicetree/msg51117.html
>>
>> Signed-off-by: Thor Thayer <tthayer@opensource.altera.com>

<snip>

>> +++ b/Documentation/devicetree/bindings/arm/altera/socfpga-l2-edac.txt
>> @@ -0,0 +1,15 @@
>> +Altera SoCFPGA L2 cache Error Detection and Correction [EDAC]
>> +
>> +Required Properties:
>> +- compatible : Should be "altr,l2-edac"
>> +- reg : Address and size for ECC error interrupt clear registers.
>> +- interrupts : Should be single bit error interrupt, then double bit error
>> +	interrupt. Note the rising edge type.
>> +
>> +Example:
>> +
>> +	l2edac@ffd08140 {
>> +		compatible = "altr,l2-edac";
>> +		reg = <0xffd08140 0x4>;
>> +		interrupts = <0 36 1>, <0 37 1>;
>> +	};
>
> Judging by the size of the reg entry, this is part of a larger block
> (the same one the OCRAM EDAC lives in). Why isn't that larger block
> described?
>
> EDAC is a Linux subsystem name, but typically not the HW block name.
> What HW block does this live in?
>

Yes, this register is part of the ECC block of registers. In order to 
get each probe function to run, the L2 EDAC and OCRAM EDAC had to be at 
the top level of the device tree. If they are children of a parent node, 
the probe functions aren't executed.
Is there a better way or example I should follow?

>> diff --git a/Documentation/devicetree/bindings/arm/altera/socfpga-ocram-edac.txt b/Documentation/devicetree/bindings/arm/altera/socfpga-ocram-edac.txt
>> new file mode 100644
>> index 0000000..31ab205
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/arm/altera/socfpga-ocram-edac.txt

<snip>

>> +
>>   		L2: l2-cache@fffef000 {
>> -			compatible = "arm,pl310-cache";
>> +			compatible = "arm,pl310-cache", "syscon";
>
> NAK.
>
> Why are you marking the PL310 as a syscon device? It is most definitely
> _NOT_ a shared set of registers lumped together.
>

Unfortunately, the register is locked for exclusive access by the L2 
cache driver. I read your comment on patch 4 and will find a better way.

> Thanks,
> Mark.
>
