From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v6 1/4] phy-sun4i-usb: Add missing EXPORT_SYMBOL for
 sun4i_usb_phy_set_squelch_detect
Date: Sun, 19 Jul 2015 12:58:52 +0200
Message-ID: <55AB82EC.7050309@redhat.com>
References: <1436366500-12555-1-git-send-email-hdegoede@redhat.com>
 <1436366500-12555-2-git-send-email-hdegoede@redhat.com> <55A653AF.608@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55A653AF.608-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Cc: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Roman Byshko <rbyshko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 15-07-15 14:35, Kishon Vijay Abraham I wrote:
> Hi,
>
> On Wednesday 08 July 2015 08:11 PM, Hans de Goede wrote:
>> sun4i_usb_phy_set_squelch_detect is used by other code, which may be built
>> as a module, so it should be exported.
>>
>> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>> ---
>> Changes in v6:
>> -New patch in v6 of the sunxi musb support series
>> ---
>>   drivers/phy/phy-sun4i-usb.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/phy/phy-sun4i-usb.c b/drivers/phy/phy-sun4i-usb.c
>> index e17c539..b82aa26 100644
>> --- a/drivers/phy/phy-sun4i-usb.c
>> +++ b/drivers/phy/phy-sun4i-usb.c
>> @@ -212,6 +212,7 @@ void sun4i_usb_phy_set_squelch_detect(struct phy *_phy, bool enabled)
>>
>>   	sun4i_usb_phy_write(phy, PHY_SQUELCH_DETECT, enabled ? 0 : 2, 2);
>>   }
>> +EXPORT_SYMBOL(sun4i_usb_phy_set_squelch_detect);
>
> EXPORT_SYMBOL_GPL?

Both work for me, feel free to fix this up if you prefer _GPL.

Regards,

Hans
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
