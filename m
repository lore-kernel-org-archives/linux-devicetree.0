From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/4] ARM: dts: sun8i: Extend Orange Pi PC dt to also
 handle the PC Plus
Date: Thu, 28 Jul 2016 22:36:01 +0200
Message-ID: <f71f9d2b-00d4-27b8-1535-1ddc58f04ca3@redhat.com>
References: <1468095718-18515-1-git-send-email-hdegoede@redhat.com>
 <20160713084505.GE4761@lukather>
 <bce2b340-a930-8771-4560-dc61bf5828d5@redhat.com>
 <20160725064033.GA7419@lukather>
 <74d3b5eb-601a-cc1d-a44e-fea2895fd8b2@redhat.com>
 <20160728181757.GD6682@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160728181757.GD6682@lukather>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 28-07-16 20:17, Maxime Ripard wrote:
> Hi Hans,
>
> On Tue, Jul 26, 2016 at 11:07:23PM +0200, Hans de Goede wrote:
>>>>> Nothing prevents you from including the orange pi pc dts, from the
>>>>> orange pi plus dts.
>>>>>
>>>>> It prevents the duplication you were trying to avoid, and it doesn't
>>>>> create all those spurious errors and devices.
>>>>
>>>> That would solve the copy paste problem on the kernel side, but that
>>>> would still mean adding a new u-boot defconfig for this, which means that
>>>> all the distro's which ship with prebuild u-boot binaries need to build
>>>> for yet another board, something which I would like to avoid.
>>>
>>> Still, registering devices that are not present on the board is not an
>>> option.
>>
>> Ok, new version send.
>>
>> What about the other 3 patches in this series ?
>
> I guess the same comment applies for patch 2.

The difference is that there really is no harm at all from
enabling the extra usb controllers used on the plus 2e
on the plus and plus 2 as well, no errors, no nothing, they
just sit their as usb controllers without an usb device plugged
in. But if you insist I can do a separate dts + u-boot defconfig
for the plus 2e as well (but I would rather not).

Regards,

Hans
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
