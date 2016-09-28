From: Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [v2] rt2x00: add support for mac addr from device tree
Date: Wed, 28 Sep 2016 13:55:38 +0300
Message-ID: <87shskwaxh.fsf@kamboji.qca.qualcomm.com>
References: <1472195813-30471-1-git-send-email-dev@kresin.me>
        <20160927155057.A4182616F6@smtp.codeaurora.org>
        <CABwW5nn9gGpzBQq3ag1MhsA-bxGop93=C7mjZG9nmi26G4ar5A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CABwW5nn9gGpzBQq3ag1MhsA-bxGop93=C7mjZG9nmi26G4ar5A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
        (Mathias Kresin's message of "Wed, 28 Sep 2016 12:36:46 +0200")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mathias Kresin <dev-zg6vgJgm1sizQB+pC5nmwQ@public.gmane.org>
Cc: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Mathias Kresin <dev-zg6vgJgm1sizQB+pC5nmwQ@public.gmane.org> writes:

> 2016-09-27 17:50 GMT+02:00 Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>:
>> Mathias Kresin <dev-zg6vgJgm1sizQB+pC5nmwQ@public.gmane.org> wrote:
>>> On some devices the EEPROMs of Ralink Wi-Fi chips have a default Ralink
>>> MAC address set (RT3062F: 00:0C:43:30:62:00, RT3060F:
>>> 00:0C:43:30:60:00). Using multiple of these devices in the same network
>>> can cause nasty issues.
>>>
>>> Allow to override the MAC in the EEPROM with (a known good) one set in
>>> the device tree to bypass the issue.
>>>
>>> Signed-off-by: Mathias Kresin <dev-zg6vgJgm1sizQB+pC5nmwQ@public.gmane.org>
>>> Acked-by: Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>>
>> I think this needs to update the devicetree binding document. Also
>> remember to CC the devicetree mailing list.
>>
>> Patch set to Changes Requested.
>>
>> --
>> https://patchwork.kernel.org/patch/9300893/
>
> Hey Kalle,
>
> was it intentional not to CC the linux-wireless list?

No, that was a bug in my script. Thanks for noticing it! Please always
report back if my script does something strange.

I'm adding now linux-wireless back.

> I thought about _adding_ a devicetree binding document before sending
> the patch. But in the end it would be an empty file, since I neither
> add any bindings nor introduce a compatible string. I'm just add
> support for the generic of_get_mac_address() devicetree property,
> which is meant to be used via a devicetree pci childnode.
>
> I grepped though the 4.7 code and found a few driver using
> of_get_mac_address() without having a devicetree binding document:
>
> - drivers/net/usb/smsc95xx.c
> - drivers/net/usb/smsc75xx.c
> - drivers/net/ethernet/marvell/sky2.c
> - drivers/net/ethernet/cavium/thunder/thunder_bgx.c
> - drivers/net/ethernet/wiznet/w5100-spi.c
> - drivers/net/ethernet/arc/emac_main.c
>
> Just let me know if you are still the opinion that a devicetree
> binding document is required to get this patch accepted.

I'm not familiar enough device tree to really comment. Can someone from
the device tree list (CCed) help?

Full patch here:

https://patchwork.kernel.org/patch/9300893/


-- 
Kalle Valo
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
