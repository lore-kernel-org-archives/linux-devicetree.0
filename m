From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [linux-sunxi] Re: [PATCH 2/4] ARM: dts: sun7i-a20-cubietruck: Set
 brcm,nvram_file_name
Date: Wed, 29 Jun 2016 20:01:02 +0200
Message-ID: <e0355531-d727-ea7f-0930-22b47c568a5a@redhat.com>
References: <1467209074-15634-1-git-send-email-hdegoede@redhat.com>
 <1467209074-15634-2-git-send-email-hdegoede@redhat.com>
 <87wpl8c4km.fsf@purkki.adurom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87wpl8c4km.fsf-5ukZ45wKbUHoml4zekdYB16hYfS7NtTn@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: "John W . Linville" <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>, Arend van Spriel <arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

HI,

On 29-06-16 19:01, Kalle Valo wrote:
> Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> writes:
>
>> The cubietruck uses an ap6210 sdio wifi module, set brcm,nvram_file_name
>> to brcmfmac43362-ap6210.txt so that we can ship the ap6210 specific
>> nvram file in linunx-firmware to get the wifi to work out of the box
>> without users needing to download and install the nvram file themselves.
>>
>> Note a downside of this patch is that users who have already manually
>> installed the nvram file will need to rename it.
>>
>> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/sun7i-a20-cubietruck.dts | 1 +
>>  1 file changed, 1 insertion(+)
>
> I can't apply .dts changes so better to send them in a separate
> patchset.

Maxime Ripard who is in the Cc maintains the dts files
in question, I've send these as one set because I find
that sending out actual dts usage examples helps.

Regards,

Hans

--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
