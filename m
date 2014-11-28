From: Kalle Valo <kvalo-A+ZNKFmMK5xy9aJCnZT0Uw@public.gmane.org>
Subject: Re: [PATCH v4 1/2] dt: bindings: add ath10k wireless device
Date: Fri, 28 Nov 2014 14:21:39 +0200
Message-ID: <874mtjsegc.fsf@kamboji.qca.qualcomm.com>
References: <20141127120727.17546.61202.stgit@potku.adurom.net>
	<3202372.2AaH3c4qv1@wuerfel> <87fvd3sl9c.fsf@kamboji.qca.qualcomm.com>
	<5247714.HacITJUipJ@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5247714.HacITJUipJ@wuerfel> (Arnd Bergmann's message of "Fri, 28
	Nov 2014 11:23:08 +0100")
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: ath10k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, toshik-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> writes:

> On Friday 28 November 2014 11:54:39 Kalle Valo wrote:
>> 
>> Right now ath10k does not support that, but in the future we might want
>> to add mac address as well. We need to do some testing with the firmware
>> to make sure that we can safely change the "main" address from ath10k.
>
> This is from Documentation/devicetree/bindings/net/ethernet.txt:
>
> - local-mac-address: array of 6 bytes, specifies the MAC address that was
>   assigned to the network device;
> - mac-address: array of 6 bytes, specifies the MAC address that was last used by
>   the boot program; should be used in cases where the MAC address assigned to
>   the device by the boot program is different from the "local-mac-address"
>   property;
>
> If the address is fixed, you might still be able to use the local-mac-address
> property to communicate the main address. Normally you only have to pass
> the mac address in DT if the device itself doesn't know the address. Do you
> know where the main address is stored?

The ath10k main address is stored in the calibration data and the
firmware delivers the address to ath10k.

> If it's always known to the card, we don't need to pass it, and if the
> card doesn't know it, I suspect it would be safe to change it.

I suspect we can change the address afterwards, but I need to check to
be sure.

>> And because of Virtual AP (mBSSID) feature we actually would need to
>> provide multiple addresses, not just one. Maybe with addr_mask like
>> struct wiphy has?
>> 
>>  * @perm_addr: permanent MAC address of this device
>>  * @addr_mask: If the device supports multiple MAC addresses by masking,
>>  *      set this to a mask with variable bits set to 1, e.g. if the last
>>  *      four bits are variable then set it to 00-00-00-00-00-0f. The actual
>>  *      variable bits shall be determined by the interfaces added, with
>>  *      interfaces not matching the mask being rejected to be brought up.
>> 
>>         /* permanent MAC address(es) */
>>         u8 perm_addr[ETH_ALEN];
>>         u8 addr_mask[ETH_ALEN];
>
> We don't have a common binding for this yet, I think drivers that do this
> at the moment just know how many addresses they are allowed to take.
>
> If the mask is generally considered useful, we could probably add that to
> the binding though.

Currently ath10k supports up to 8 Virtual APs but the manufacturer can
choose to allocate any number of MAC addresses (1-8). Something like
addr_mask would be good way to inform ath10k what address range it has
available.

-- 
Kalle Valo
--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
