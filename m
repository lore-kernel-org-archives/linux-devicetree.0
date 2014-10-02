From: Kalle Valo <kvalo-A+ZNKFmMK5xy9aJCnZT0Uw@public.gmane.org>
Subject: Re: ath10k: calibration data through Device Tree?
Date: Thu, 2 Oct 2014 16:47:48 +0300
Message-ID: <87lhoymvln.fsf@kamboji.qca.qualcomm.com>
References: <87tx3mmx4s.fsf@kamboji.qca.qualcomm.com>
	<3548219.ad4Qe1WtGp@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3548219.ad4Qe1WtGp@wuerfel> (Arnd Bergmann's message of "Thu, 2
	Oct 2014 15:27:53 +0200")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ath10k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> writes:

> On Thursday 02 October 2014 16:14:43 Kalle Valo wrote:
>> Hi Device Tree gurus,
>> 
>> ath10k is a wireless driver for Qualcomm Atheros 802.11ac hardware and
>> located in drivers/net/wireless/ath/ath10k/. Currently it only supports
>> PCI devices.
>> 
>> Some of the devices store the calibration data to the host flash and the
>> bootloader reads the data from the flash. And now we need a method to
>> deliver the calibration data from bootloader to ath10k. Basically our
>> requirements are:
>> 
>> * ath10k must support any number of radios (one radio per PCI device).
>> 
>> * The calibration data is now 2116 bytes, in the future it might be
>>   longer. The data is unique for each radio and is created at the
>>   factory.
>> 
>> * ath10k must be able to reliably map the PCI device (=radio) to the
>>   correct calibration data. Maybe with using PCI bus and slot numbers?
>> 
>> We have been trying to find similar cases from other drivers but no
>> luck. Basically my question is how to do this properly with Device Tree?
>> Especially how to map the calibration data to correct PCI device? Are
>> there any examples which would help us to implement this?
>
> When you know the PCI bus/device/function ID of the device, you can put
> a device node in the dts file that corresponds to the PCI dev, and you
> can find the of_node pointer from pci_dev->dev.of_node. 

For me that's easier said than done as I'm a total newbie with Device
Tree :) Can you give any pointers or examples how to do that in
practise, please? Especially "node in the dts file that corresponds to
the PCI dev" part is puzzling me.

> 2116 is probably ok to put into a DT property of that device directly.

Ok, that's good.

-- 
Kalle Valo
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
