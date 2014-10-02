From: Kalle Valo <kvalo-A+ZNKFmMK5xy9aJCnZT0Uw@public.gmane.org>
Subject: Re: ath10k: calibration data through Device Tree?
Date: Thu, 2 Oct 2014 17:55:57 +0300
Message-ID: <87d2aamsg2.fsf@kamboji.qca.qualcomm.com>
References: <87tx3mmx4s.fsf@kamboji.qca.qualcomm.com>
	<3548219.ad4Qe1WtGp@wuerfel> <87lhoymvln.fsf@kamboji.qca.qualcomm.com>
	<2397903.vznsjdQh6x@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2397903.vznsjdQh6x@wuerfel> (Arnd Bergmann's message of "Thu, 2
	Oct 2014 16:19:28 +0200")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ath10k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> writes:

> On Thursday 02 October 2014 16:47:48 Kalle Valo wrote:
>> >
>> > When you know the PCI bus/device/function ID of the device, you can put
>> > a device node in the dts file that corresponds to the PCI dev, and you
>> > can find the of_node pointer from pci_dev->dev.of_node. 
>> 
>> For me that's easier said than done as I'm a total newbie with Device
>> Tree  Can you give any pointers or examples how to do that in
>> practise, please? Especially "node in the dts file that corresponds to
>> the PCI dev" part is puzzling me.
>
> See the recent patch "[PATCH v4] ARM: shmobile: r8a7791: link PCI USB
> devices to USB PHY" where someone does the same thing to supply additional
> data to a PCI device node in shmobile.
>
> Basically you just need to add a node under your PCI host controller node
> with "reg = <0x800 0 0 0 0>" (or whatever the address is and put the
> properties in there. See www.openfirmware.org/1275/bindings/pci/pci2_1.pdf
> for the description of how to construct the addresses.

Excellent, thanks. I'll study these and try to learn more.

> I notice that there are no Qualcomm or Atheros PCI host controller drivers
> in Linux though, so you first have to write a driver that allows probing
> the PCI bus, and get the binding reviewed for that before you can add
> it to the dts files. Is this for ipq8064 or something else?

But now I'm lost again :) I want ath10k and this feature to work with
all possible PCI controllers, not just with Qualcomm controllers. So why
do I need to wait for Qualcomm PCI host controller driver?

-- 
Kalle Valo
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
