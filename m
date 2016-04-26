From: Jeppe Ledet-Pedersen <jlp-jTq9jD7AHYRWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 1/3] mfd: add Cypress FM33256B Processor Companion driver
Date: Tue, 26 Apr 2016 16:31:46 +0200
Message-ID: <571F7BD2.60201@gomspace.com>
References: <1461150471-23163-1-git-send-email-jlp@gomspace.com>
 <1461150471-23163-2-git-send-email-jlp@gomspace.com>
 <20160422193232.GA9737@rob-hp-laptop> <20160422201153.GB17051@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160422201153.GB17051-m++hUPXGwpdeoWH0uzbU5w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 22/04/16 22:11, Alexandre Belloni wrote:
> On 22/04/2016 at 14:32:32 -0500, Rob Herring wrote :
>> On Wed, Apr 20, 2016 at 01:07:49PM +0200, Jeppe Ledet-Pedersen wrote:
>>> This patch adds support for the Cypress Semiconductor FM33256B processor
>>> companion. The device contains a 256 kbit FRAM, an RTC, a supply voltage
>>> monitor, and a watchdog timer.
>>>
>>> Signed-off-by: Jeppe Ledet-Pedersen <jlp-jTq9jD7AHYRWk0Htik3J/w@public.gmane.org>
>>> ---
>>>  Documentation/devicetree/bindings/mfd/fm33256b.txt |  30 ++
>>>  MAINTAINERS                                        |   6 +
>>>  drivers/mfd/Kconfig                                |  16 +
>>>  drivers/mfd/Makefile                               |   1 +
>>>  drivers/mfd/fm33256b.c                             | 488 +++++++++++++++++++++
>>>  include/linux/mfd/fm33256b.h                       |  76 ++++
>>>  6 files changed, 617 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/mfd/fm33256b.txt
>>>  create mode 100644 drivers/mfd/fm33256b.c
>>>  create mode 100644 include/linux/mfd/fm33256b.h
>>>
>>> diff --git a/Documentation/devicetree/bindings/mfd/fm33256b.txt b/Documentation/devicetree/bindings/mfd/fm33256b.txt
>>> new file mode 100644
>>> index 0000000..6591c94
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/mfd/fm33256b.txt
>>> @@ -0,0 +1,30 @@
>>> +Device-tree bindings for Cypress Semiconductor FM33256B Processor Companion
>>> +---------------------------------------------------------------------------
>>> +
>>> +Required properties:
>>> +- compatible: must be "cypress,fm33256b".
>>> +- reg: SPI chip select
>>> +- spi-max-frequency: Max SPI frequency to use (< 16000000)
>>> +
>>> +Optional properties:
>>> +- cypress,charge-enabled: enable trickle charger
>>
>> What does the driver do if charging is disabled? Would using 'status = 
>> "disabled"' be any different?
>>  
> 
> Good catch, I didn't look at this patch but it includes a lot of code
> that should be going to the RTC driver.
> If trickle charging is not enabled, I guess the RTC will not charge its
> backup battery.

Thank you for the comments.

Alexandre is correct. If the "cypress,charge-enabled" property is
present, the internal 80 uA trickle charger is enabled to charge a
backup capacitor on the VBAK pin.

Do you want more code than the trickle charger setup moved to the RTC
driver?

>>> +- cypress,charge-fast: enable fast (1 mA) charging
>>
>> What does fast mean?
>>

Fast charging means charging with 1 mA instead of 80 uA. The wording is
from the datasheet, but I agree it should be renamed to something that
better explains what the difference is.

>> I think it is time for a common binding here. There's all sorts of 
>> variations on setting the charge current in bindings. Add something like 
>> "charge-current-microamp" in power_supply.txt and use it here. Then 
>> 1000uA implies "fast charge".
> 
> Well, this is not a power supply, it is an RTC.
> 
> I think both properties should got to the RTC subdevice and be parsed in
> the RTC driver.

The backup capacitor is primarily used to supply current to the RTC, but
a couple of other registers are also battery-backed (watchdog reset
cause, event counter), so I put the charger setup in the main MFD file.

If you prefer, I can move them both to the RTC driver?

> Note that for trickle charging, we currently have the following
> properties:
>  - trickle-resistor-ohms
>  - trickle-diode-disable
>  - abracon,tc-diode
>  - abracon,tc-resistor
> 
> abracon,tc-resistor can be replaced by trickle-resistor-ohms, I'll make
> a patch but abracon,tc-diode allows to select a diode type (and in
> particular a voltage drop).
> 
> I think we could add a trickle-current-microamp like you suggested and
> trickle-diode-disable can be reused.

So replace "cypress,charge-enabled/charge-fast" with
"trickle-current-microamp" and a check for 0/80/1000 uA?

Thanks,

-Jeppe
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
