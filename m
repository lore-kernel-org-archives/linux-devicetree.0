From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [linux-sunxi] Re: [PATCH 1/3] ARM: dts: sunxi: Fix
 interrupt-cells for [r]pio on A23/A31/A33/A80
Date: Thu, 15 Oct 2015 16:55:47 +0200
Message-ID: <561FBE73.7070606@redhat.com>
References: <1444919327-23747-1-git-send-email-hdegoede@redhat.com>
 <5423411.WHZ4SNGvxb@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5423411.WHZ4SNGvxb@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Thomas Kaiser <Thomas.Kaiser-id7G5ibTm3AZ78jC37dNPg@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 15-10-15 16:38, Arnd Bergmann wrote:
> On Thursday 15 October 2015 16:28:45 Hans de Goede wrote:
>> When the gpio interrupt bindings where changed to add a bank to the
>> specifier list, the r_pio nodes of A23/A31/A33 where not updated to
>> match and neither was the pio node of the A80, this fixes this.
>>
>> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>>
>
> Is this safe to apply by itself? I don't see any interrupts references
> to these nodes, so I assume it's fine, but if there are any cross-dependencies
> we need more careful planning.

Should be safe to apply by itself, later patches in this series introduce
the first interrupt users of these nodes, which is what made me notice
the mistake in them.

Regards,

Hans
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
