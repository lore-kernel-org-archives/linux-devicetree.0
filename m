From: Kalle Valo <kvalo-A+ZNKFmMK5xy9aJCnZT0Uw@public.gmane.org>
Subject: Re: [PATCH v4 1/2] dt: bindings: add ath10k wireless device
Date: Fri, 28 Nov 2014 11:54:39 +0200
Message-ID: <87fvd3sl9c.fsf@kamboji.qca.qualcomm.com>
References: <20141127120727.17546.61202.stgit@potku.adurom.net>
	<20141127120856.17546.32014.stgit@potku.adurom.net>
	<3202372.2AaH3c4qv1@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3202372.2AaH3c4qv1@wuerfel> (Arnd Bergmann's message of "Thu, 27
	Nov 2014 13:28:45 +0100")
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: ath10k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, toshik-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> writes:

> On Thursday 27 November 2014 14:08:56 Kalle Valo wrote:
>> diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
>> new file mode 100644
>> index 000000000000..edefc26c6204
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
>> @@ -0,0 +1,30 @@
>> +* Qualcomm Atheros ath10k wireless devices
>> +
>> +For ath10k devices the calibration data can be provided through Device
>> +Tree. The node is a child node of the PCI controller.
>> +
>> +Required properties:
>> +-compatible : Should be "qcom,ath10k"
>> +
>> +Optional properties:
>> +- qcom,ath10k-calibration-data : calibration data as an array, the
>> +                                length can vary between hw versions
>> +
>
> Does the device always have a valid mac address in hardware? If not,
> how about listing that as well using the mac-address property?

Right now ath10k does not support that, but in the future we might want
to add mac address as well. We need to do some testing with the firmware
to make sure that we can safely change the "main" address from ath10k.

And because of Virtual AP (mBSSID) feature we actually would need to
provide multiple addresses, not just one. Maybe with addr_mask like
struct wiphy has?

 * @perm_addr: permanent MAC address of this device
 * @addr_mask: If the device supports multiple MAC addresses by masking,
 *	set this to a mask with variable bits set to 1, e.g. if the last
 *	four bits are variable then set it to 00-00-00-00-00-0f. The actual
 *	variable bits shall be determined by the interfaces added, with
 *	interfaces not matching the mask being rejected to be brought up.

	/* permanent MAC address(es) */
	u8 perm_addr[ETH_ALEN];
	u8 addr_mask[ETH_ALEN];

-- 
Kalle Valo
--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
