From: Nishanth Menon <nm@ti.com>
Subject: Re: [PATCH v2 1/2] arm: dts: am4372: let boards enable RTC and Watchdog
Date: Wed, 18 Jun 2014 16:43:28 -0500
Message-ID: <53A20800.3070301@ti.com>
References: <1403106200-777-1-git-send-email-balbi@ti.com> <1403106200-777-2-git-send-email-balbi@ti.com> <53A1B677.9010909@ti.com> <20140618192553.GB4570@saruman.home>
Reply-To: nm@ti.com
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <20140618192553.GB4570@saruman.home>
Sender: linux-omap-owner@vger.kernel.org
To: balbi@ti.com
Cc: devicetree@vger.kernel.org, linux@arm.linux.org.uk, Tony Lindgren <tony@atomide.com>, Rajendra Nayak <rnayak@ti.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, r.sricharan@ti.com, robh+dt@kernel.org, Benoit Cousson <bcousson@baylibre.com>, galak@codeaurora.org, Linux OMAP Mailing List <linux-omap@vger.kernel.org>, Linux ARM Kernel Mailing List <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 06/18/2014 02:25 PM, Felipe Balbi wrote:
> Hi,
>
> On Wed, Jun 18, 2014 at 10:55:35AM -0500, Nishanth Menon wrote:
>> $subject - ARM: dts:
>>
>> On 06/18/2014 10:43 AM, Felipe Balbi wrote:
>>> by providing phandles to rtc and wdt nodes, we can
>>> let boards enable rtc and wdt as necessary.
>>>
>>> Signed-off-by: Felipe Balbi <balbi@ti.com>
>>> ---
>>>   arch/arm/boot/dts/am4372.dtsi | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/arch/arm/boot/dts/am4372.dtsi b/arch/arm/boot/dts/am4372.dtsi
>>> index 49fa596..e3830d4 100644
>>> --- a/arch/arm/boot/dts/am4372.dtsi
>>> +++ b/arch/arm/boot/dts/am4372.dtsi
>>> @@ -270,7 +270,7 @@
>>>   			ti,hwmods = "counter_32k";
>>>   		};
>>>
>>> -		rtc@44e3e000 {
>>> +		rtc: rtc@44e3e000 {
>>>   			compatible = "ti,am4372-rtc","ti,da830-rtc";
>>>   			reg = <0x44e3e000 0x1000>;
>>>   			interrupts = <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH
>>> @@ -279,7 +279,7 @@
>>>   			status = "disabled";
>>>   		};
>>>
>>> -		wdt@44e35000 {
>>> +		wdt: wdt@44e35000 {
>>>   			compatible = "ti,am4372-wdt","ti,omap3-wdt";
>>>   			reg = <0x44e35000 0x1000>;
>>>   			interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
>>>
>> we might want to fix up any other similar nodes in dtsi as well, no?
>>
>> examples:
>> cpu@0
>
> and why would you want boards to mess with the cpu node ?
>
cpu-supply = <&regulator>;

for cpufreq.

