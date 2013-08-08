Return-Path: <devicetree-owner@vger.kernel.org>
Received: from nbd.name ([46.4.11.11]:41937 "EHLO nbd.name"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757829Ab3HHNCt (ORCPT <rfc822;devicetree@vger.kernel.org>);
	Thu, 8 Aug 2013 09:02:49 -0400
Message-ID: <52039551.9090006@openwrt.org>
Date: Thu, 08 Aug 2013 14:55:45 +0200
From: John Crispin <blogic@openwrt.org>
MIME-Version: 1.0
Subject: Re: [PATCH V2 1/2] DT: Add documentation for ralink-wdt
References: <1375954919-30737-1-git-send-email-blogic@openwrt.org> <5203923B.7030304@roeck-us.net>
In-Reply-To: <5203923B.7030304@roeck-us.net>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: Wim Van Sebroeck <wim@iguana.be>, linux-watchdog@vger.kernel.org, linux-mips@linux-mips.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 08/08/13 14:42, Guenter Roeck wrote:
> On 08/08/2013 02:41 AM, John Crispin wrote:
>> Describe ralink-wdt binding.
>>
>> Signed-off-by: John Crispin <blogic@openwrt.org>
>> Cc: linux-watchdog@vger.kernel.org
>> Cc: linux-mips@linux-mips.org
>> Cc: devicetree@vger.kernel.org
>> ---
>> V1 used the old devicetree list as Cc.
>>
>>   .../devicetree/bindings/watchdog/ralink-wdt.txt     |   19 
>> +++++++++++++++++++
>>   1 file changed, 19 insertions(+)
>>   create mode 100644 
>> Documentation/devicetree/bindings/watchdog/ralink-wdt.txt
>>
>> diff --git 
>> a/Documentation/devicetree/bindings/watchdog/ralink-wdt.txt 
>> b/Documentation/devicetree/bindings/watchdog/ralink-wdt.txt
>> new file mode 100644
>> index 0000000..a70f0e8
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/watchdog/ralink-wdt.txt
>> @@ -0,0 +1,19 @@
>> +Ralink Watchdog Timers
>> +
>> +Required properties :
>> +- compatible: must be "ralink,rt2880-wdt"
>> +- reg: physical base address of the controller and length of the 
>> register range
>> +
>> +Optional properties :
>> +- interrupt-parent: phandle to the INTC device node
>> +- interrupts : Specify the INTC interrupt number
>> +
>> +Example:
>> +
>> +    watchdog@120 {
>> +        compatible = "ralink,mt7620a-wdt", "ralink,rt2880-wdt";
>
> Just wondering ... what is the "ralink,mt7620a-wdt" supposed to be 
> used for ?

Hi

i copied the example from the dtsi file of the mt7620a SoC. i can remove 
it if you like.

     John
