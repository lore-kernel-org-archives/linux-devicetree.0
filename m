From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [linux-sunxi] [PATCH 2/2] ARM: dts: sun8i: Enable ir receiver on
 orangepi pc
Date: Wed, 24 Feb 2016 14:26:37 +0100
Message-ID: <56CDAF8D.70501@redhat.com>
References: <1456268597-13692-1-git-send-email-hdegoede@redhat.com>
 <1456268597-13692-3-git-send-email-hdegoede@redhat.com>
 <20160224121640.GA25658@box2.japko.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160224121640.GA25658-xLeyfSbClftGit24Ens98Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Adamski <k@japko.eu>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jelle van der Waa <jelle-oJJ1AqDjjO4@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 24-02-16 13:16, Krzysztof Adamski wrote:
> On Wed, Feb 24, 2016 at 12:03:17AM +0100, Hans de Goede wrote:
>> Enable the ir receiver found on the orangepi pc board.
>>
>> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>> ---
>> arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts | 6 ++++++
>> 1 file changed, 6 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts b/arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts
>
> I don't think this file is avaiable in mainline. Wouldn't it be better to use patch against existing orangepi-plus dts file?
>
> Otherwise I tested this patch and it works fine on my Orangepi PC (some data is splitted out when reading /dev/input/event0).

Ah yes, that is my bad, I've been waiting with upstreaming an orangepi-pc dts until all the
usb bits are upstream as my dts has usb host support enabled, I should probably split
out the usb-host support and upstream the rest already.

Regards,

Hans
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
