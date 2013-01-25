From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH] ARM: davinci: da850: add RTC driver DT entries
Date: Fri, 25 Jan 2013 16:52:18 +0530
Message-ID: <51026AEA.5050503@ti.com>
References: <1359094430-14724-1-git-send-email-mrugesh.mk@ti.com> <51025FAE.3060503@ti.com> <4232EB8829679242B82E712C3DB3149D4233E9@DBDE01.ent.ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <4232EB8829679242B82E712C3DB3149D4233E9@DBDE01.ent.ti.com>
Sender: linux-doc-owner@vger.kernel.org
To: "Katepallewar, Mrugesh" <mrugesh.mk@ti.com>
Cc: "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "davinci-linux-open-source@linux.davincidsp.com" <davinci-linux-open-source@linux.davincidsp.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "grant.likely@secretlab.ca" <grant.likely@secretlab.ca>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "rob@landley.net" <rob@landley.net>, "hs@denx.de" <hs@denx.de>
List-Id: devicetree@vger.kernel.org

On 1/25/2013 4:34 PM, Katepallewar, Mrugesh wrote:
> On Fri, Jan 25, 2013 at 16:04:22, Nori, Sekhar wrote:
>> On 1/25/2013 11:43 AM, Mrugesh Katepallewar wrote:
>>> Add RTC DT entries in da850 dts file.
>>>
>>> Signed-off-by: Mrugesh Katepallewar <mrugesh.mk@ti.com>
>>> ---
>>> Applies on top of v3.8-rc4 of linus tree.
>>>
>>> Tested on da850-evm device.
>>>
>>> Test Procedure:
>>> date [YYYY.]MM.DD-hh:mm[:ss]
>>> hwclock -w
>>> reset board and check system time.
>>>
>>> :100644 100644 37dc5a3... b16efd4... M	arch/arm/boot/dts/da850-evm.dts
>>> :100644 100644 640ab75... a8eb1b1... M	arch/arm/boot/dts/da850.dtsi
>>>  arch/arm/boot/dts/da850-evm.dts |    3 +++
>>>  arch/arm/boot/dts/da850.dtsi    |    8 ++++++++
>>>  2 files changed, 11 insertions(+)
>>>
>>> diff --git a/arch/arm/boot/dts/da850-evm.dts 
>>> b/arch/arm/boot/dts/da850-evm.dts index 37dc5a3..b16efd4 100644
>>> --- a/arch/arm/boot/dts/da850-evm.dts
>>> +++ b/arch/arm/boot/dts/da850-evm.dts
>>> @@ -24,5 +24,8 @@
>>>  		serial2: serial@1d0d000 {
>>>  			status = "okay";
>>>  		};
>>> +		rtc@1c23000 {

I did not mention this last time, but this should be:

		rtc0: rtc@1c23000 {

to be consistent with rest of the file.

>>> +			status = "okay";
>>> +		};
>>>  	};
>>>  };
>>> diff --git a/arch/arm/boot/dts/da850.dtsi 
>>> b/arch/arm/boot/dts/da850.dtsi index 640ab75..a8eb1b1 100644
>>> --- a/arch/arm/boot/dts/da850.dtsi
>>> +++ b/arch/arm/boot/dts/da850.dtsi
>>> @@ -56,5 +56,13 @@
>>>  			interrupt-parent = <&intc>;
>>>  			status = "disabled";
>>>  		};
>>> +		rtc@1c23000 {

Here too.

>>> +			compatible = "ti,da830-rtc";
>>> +			reg = <0x23000 0x1000>;
>>> +			interrupts = <19
>>> +				      19>;
>>
>> Why two interrupts of the same number? If there is only one interrupt line then only one should be specified, no?
> We are using common OMAP RTC driver for da850 and other ti SoC's (e.g.am33xx). I have seen in am33xx.dtsi rtc timer
> and alarm interrupts are different. So, two interrupt numbers are expected from RTC DT node.

Okay. Looking at the OMAP-L138 TRM, I see that the IP on that SoC
supports both alarm and timer events and both arrive on the same
interrupt number (as opposed to am335x where they supposedly arrive on
different interrupt lines). What you have looks fine to me considering
this.

Also, the interrupt-parent setting needs to be removed. See the patch
Prabhakar just submitted.

Thanks,
Sekhar
