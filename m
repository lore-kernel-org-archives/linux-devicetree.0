From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v3 4/4] musb: sunxi: Simplify dr_mode handling
Date: Wed, 8 Jun 2016 12:30:20 +0200
Message-ID: <08af737c-f1f1-0966-0eca-24d4daa7423b@redhat.com>
References: <1465138776-6003-1-git-send-email-hdegoede@redhat.com>
 <1465138776-6003-4-git-send-email-hdegoede@redhat.com>
 <20160608102325.GI14179@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160608102325.GI14179@lukather>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Bin Liu <b-liu-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 08-06-16 12:23, Maxime Ripard wrote:
> Hi,
>
> On Sun, Jun 05, 2016 at 04:59:36PM +0200, Hans de Goede wrote:
>> phy-sun4i-usb now has proper dr_mode handling, it always registers an
>> extcon, and sends a notify with the mode (even when in peripheral- /
>> host-only mode) at least once.
>>
>> So we can simply the sunxi musb glue by always registering its extcon
>> notifier and relying on sunxi_musb_work() to enable vbus when in
>> host-only mode.
>>
>> This also enables host- and peripheral-only mode with vbus monitoring.
>>
>> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>
> It's been a bit painful to track all the patches needed so that it
> applies properly, but I've finally been able to test it on a Sinlinx
> SinA33 with peripheral-only mUSB, and it works like a charm.
>
> You can add my Tested-by.

Great, thanks for testing.

This is the board which has an otg connector with vbus not connected,
right? Yet it does have a functional id-pin, right ?

In that case you should be able to put it in dual-role mode (only
specify the id-pin in the phy dts node, no vbus / vbus-monitoring)
and then it _should_ work in host mode if you use a powered hub.

I'm fine with putting in peripheral-only mode, but as said
dual-role might work with a powered hub.

Regards,

Hans
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
