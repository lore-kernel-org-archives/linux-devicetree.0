From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: Re: [PATCH v2 1/2] ARM: bcm2835: dt: Add the ethernet to the device
 trees
Date: Thu, 28 Apr 2016 18:26:12 +0200
Message-ID: <572239A4.3030100@i2se.com>
References: <1454571364-24708-1-git-send-email-lkundrak@v3.sk>
 <1454571364-24708-2-git-send-email-lkundrak@v3.sk>
 <56B572D8.9030701@wwwdotorg.org> <m3wpnhrj42.fsf@euphor.blino.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <m3wpnhrj42.fsf-sb2orAewljU5LtT840wCHw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olivier Blin <dev-RZzICDNEOQ/YtjvyW6yDsg@public.gmane.org>, Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>, eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Olivier

Am 28.04.2016 um 14:52 schrieb Olivier Blin:
> Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> writes:
>
>> On 02/04/2016 12:36 AM, Lubomir Rintel wrote:
>>> The hub and the ethernet in its port 1 are hardwired on the board.
>>>
>>> Compared to the adapters that can be plugged into the USB ports, this
>>> one has no serial EEPROM to store its MAC. Nevertheless, the Raspberry Pi
>>> has the MAC address for this adapter in its ROM, accessible from its
>>> firmware.
>>>
>>> U-Boot can read out the address and set the local-mac-address property of the
>>> node with "ethernet" alias. Let's add the node so that U-Boot can do its
>>> business.
>>>
>>> Model B rev2 and Model B+ entries were verified by me, the hierarchy and
>>> pid/vid pair for the Version 2 was provided by Olivier Blin. Original
>>> Model B is a blind short, though very likely correct.
>> The series,
>> Tested-by: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
>>
>> A few nits though...
> [...]
>
> Is this still being queued in some tree?
> Or does it need more fixes and a resubmit?

Yes, a V3 should address the comments from Peter and Stephen.

Regards
Stefan

>
> Without this, Raspberry Pi devices boot with a random MAC address.
>


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
