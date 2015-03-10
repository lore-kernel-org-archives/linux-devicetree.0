From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 09/15] ARM: dts: sun4i: Add USB Dual Role Controller
Date: Tue, 10 Mar 2015 10:10:24 +0100
Message-ID: <54FEB500.8050409@redhat.com>
References: <1425933628-9672-1-git-send-email-hdegoede@redhat.com> <1425933628-9672-10-git-send-email-hdegoede@redhat.com> <CAGRGNgVsf05rtLC2+yOPrbrPV-ceQzPC=ZX1zX+hfNxdC7OX-A@mail.gmail.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Return-path: <linux-sunxi+bncBDRZXY4CYYORBDPK7KTQKGQED7E6VTY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <CAGRGNgVsf05rtLC2+yOPrbrPV-ceQzPC=ZX1zX+hfNxdC7OX-A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Julian Calaby <julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Roman Byshko <rbyshko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Mailing List, Arm" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 10-03-15 00:31, Julian Calaby wrote:
> Hi Hans,
>
> On Tue, Mar 10, 2015 at 7:40 AM, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
>> Add a node for the otg/drc usb controller to sun4i-a10.dtsi.
>>
>> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>> ---
>>   arch/arm/boot/dts/sun4i-a10.dtsi | 12 ++++++++++++
>>   drivers/usb/musb/Kconfig         |  1 +
>>   2 files changed, 13 insertions(+)
>>
>> diff --git a/drivers/usb/musb/Kconfig b/drivers/usb/musb/Kconfig
>> index 8180a3a..fab8e9a 100644
>> --- a/drivers/usb/musb/Kconfig
>> +++ b/drivers/usb/musb/Kconfig
>> @@ -65,6 +65,7 @@ comment "Platform Glue Layer"
>>   config USB_MUSB_SUNXI
>>          tristate "Allwinner (sunxi)"
>>          depends on ARCH_SUNXI
>> +       depends on NOP_USB_XCEIV
>
> Shouldn't this be in a different patch?

Yes, this was a later fixup commit which got squashed into the wrong patch,
thanks for catching this.

This has been fixed in my personal tree, and will be in v2 of this set:
https://github.com/jwrdegoede/linux-sunxi/commits/sunxi-wip

Regards,

Hans
