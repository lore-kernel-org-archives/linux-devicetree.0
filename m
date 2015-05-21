From: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] phy: add lpc18xx usb otg phy driver
Date: Thu, 21 May 2015 16:05:33 +0200
Message-ID: <CAGhQ9VxB+Onrzr8MfE5Ocb1-5VoF7FLNwZ14_uUCJS2U9D_Lfg@mail.gmail.com>
References: <1431797277-4906-1-git-send-email-manabian@gmail.com>
	<1431797277-4906-2-git-send-email-manabian@gmail.com>
	<555DD5CB.4040805@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <555DD5CB.4040805-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Kishon,

On 21 May 2015 at 14:55, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org> wrote:
> Hi,
>
>
> On Saturday 16 May 2015 10:57 PM, Joachim Eastwood wrote:
>>
>> Add PHY driver for the internal USB OTG PHY found on NXP
>> LPC18xx and LPC43xx devices. This driver takes care of
>> enabling the PHY in CREG (syscon) and setting the required
>> clock frequency.
>>
>> Signed-off-by: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
<snip>
>> +/* USB OTG PHY register offset and bit in CREG */
>> +#define LPC18XX_CREG_CREG0             0x004
>> +# define LPC18XX_CREG_CREG0_USB0PHY    BIT(5)
>
>
> don't prefer a space between # and define. Not a strong feeling though.

Okey, I'll remove it.

>> +
>> +       phy_provider = devm_of_phy_provider_register(&pdev->dev,
>> +                                                    of_phy_simple_xlate);
>> +       if (IS_ERR(phy_provider))
>> +               return PTR_ERR(phy_provider);
>> +
>> +       return 0;
>
>
> replace it with return PTR_ERR_OR_ZERO(phy_provider);

Okey.


Thanks for the review, Kishon.

I'll send a updated version later today.


regards,
Joachim Eastwood
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
