From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: l2x0: make it possible to disable outer sync
 from DT
Date: Mon, 14 Dec 2015 14:23:30 +0100
Message-ID: <CACRpkdbi8ERHyB18QtEvzvEyZ=DLXO+Pb_ycMwatyTb7W6BsHw@mail.gmail.com>
References: <1449756855-19473-1-git-send-email-linus.walleij@linaro.org>
	<4566290.SfODMJgTLT@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4566290.SfODMJgTLT@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Dec 10, 2015 at 3:20 PM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Thursday 10 December 2015 15:14:15 Linus Walleij wrote:
>> Some RealView platforms have broken outer_sync, see:
>> http://marc.info/?l=linux-kernel&m=144846940516899&w=2
>>
>> We got rid of the custom barriers from the machine by disabling
>> outer sync, but that was just for the boardfile case. We have
>> to be able to do the same in the device tree case.
>>
>> Since __l2c_init() is cloning and copying the L2C vtable,
>> we pass an argument to this function to optionally numb
>> the outer sync operation if desired, before initializing
>> the cache.
>>
>> After this we can set up the cache correctly on the RealView
>> PB11MPCore, and it boots rock solid with the cache enabled.
>> Before this, spurious crashes would occur if we try to set
>> up the cache properly.
>>
>> Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
>> Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
>> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>
> This has the same effect as my "ARM: realview: remove private barrier
> implementation" patch and replaces part of that, correct?

Yes, but applied to a DT-only bootpath with a minimum of board
file code, kept in l2x0.c just this bool in the DT node.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
