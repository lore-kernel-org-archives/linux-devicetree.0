From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [linux-sunxi] Re: [PATCH] ARM: dts: sun6i: Add serial0 alias and
 stdout-path to a31s-primo81.dts
Date: Sat, 19 Mar 2016 10:13:47 +0100
Message-ID: <56ED184B.9000609@redhat.com>
References: <1458137962-27714-1-git-send-email-hdegoede@redhat.com>
 <CAGb2v67+V1JdaG2ypgj5sXyzxiwZhYC_z_1sye5HpnMvcE_QfA@mail.gmail.com>
 <20160318174839.GQ30977@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160318174839.GQ30977@lukather>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Karsten Merker <merker-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 18-03-16 18:48, Maxime Ripard wrote:
> On Thu, Mar 17, 2016 at 02:28:03PM +0800, Chen-Yu Tsai wrote:
>> On Wed, Mar 16, 2016 at 10:19 PM, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
>>> u-boot uses the kernel as the canonical source for its sunxi dts files
>>> and u-boot needs these.
>>>
>>> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>>
>> Acked-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
>
> Queued, thanks!

I just got an of-list mail from Karsten Merker that you nacked the addition
if this during the initial submission, because there are no accessible uart
test pads on this tablet.

In that case the proper fix would be to change the u-boot defconfig to have:

# CONFIG_REQUIRE_SERIAL_CONSOLE is not set

Which will stop u-boot from panicking (with nowhere to print the panic msg)
when it has no stdout-path.

Can you unqueue this one until we've figured out what the best fix is ?

Thanks & Regards,

Hans
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
