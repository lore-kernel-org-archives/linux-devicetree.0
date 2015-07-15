From: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 0/2] USB OTG PHY driver for NXP LPC18xx family
Date: Wed, 15 Jul 2015 13:53:48 +0200
Message-ID: <CAGhQ9Vz+sgVra=fpRa5tNL_kz8oJm+eOY7FETz=pY2-Esv0wAg@mail.gmail.com>
References: <1436474906-2669-1-git-send-email-manabian@gmail.com>
	<55A63AE1.50701@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55A63AE1.50701-l0cyMroinI0@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 15 July 2015 at 12:50, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org> wrote:
>
>
> On Friday 10 July 2015 02:18 AM, Joachim Eastwood wrote:
>> This patch set adds support for the internal USB OTG PHY found
>> on NXP LPC18xx and LPC43xx devices. Driver takes care of
>> enabling the PHY and setting the clock rate which is need for
>> USB0 support on this platform.
>>
>> This version address moves the dt node under the creg syscon
>> and rebases the patch set on 4.2-rc1.
>
> merged this to linux-phy tree.

Thanks, Kishon.

regards,
Joachim Eastwood
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
