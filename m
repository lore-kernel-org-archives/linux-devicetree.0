From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/2] ohci-platform: Add support for
 devicetree instantiation
Date: Tue, 07 Jan 2014 22:01:58 +0100
Message-ID: <52CC6B46.8060708@redhat.com>
References: <1388963080-12544-1-git-send-email-hdegoede@redhat.com> <20140106154555.GC24664@e106331-lin.cambridge.arm.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Return-path: <linux-sunxi+bncBDL4X2GMZUKRBVOWWGLAKGQEMQWK3GA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20140106154555.GC24664-NuALmloUBlrZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Tony Prisk <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 01/06/2014 04:45 PM, Mark Rutland wrote:
> On Sun, Jan 05, 2014 at 11:04:39PM +0000, Hans de Goede wrote:
>> Add support for ohci-platform instantiation from devicetree, including
>> optionally getting clks and a phy from devicetree, and enabling / disabling
>> those on power_on / off.
>>
>> This should allow using ohci-platform from devicetree in various cases.
>> Specifically after this commit it can be used for the ohci controller found
>> on Allwinner sunxi SoCs.
>>
>> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>> ---
>>   .../devicetree/bindings/usb/platform-ohci.txt      |  25 ++++
>>   drivers/usb/host/ohci-platform.c                   | 146 ++++++++++++++++++---
>>   2 files changed, 151 insertions(+), 20 deletions(-)
>>   create mode 100644 Documentation/devicetree/bindings/usb/platform-ohci.txt
>>
>> diff --git a/Documentation/devicetree/bindings/usb/platform-ohci.txt b/Documentation/devicetree/bindings/usb/platform-ohci.txt
>> new file mode 100644
>> index 0000000..6846f1c
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/usb/platform-ohci.txt
>> @@ -0,0 +1,25 @@
>> +Generic Platform OHCI controller
>> +
>> +Required properties:
>> + - compatible: Should be "platform-ohci"
>
> To me, "platform-ohci" seems rather Linux-specific. Platform devices are
> a Linux abstraction that don't correspond to any particular bus type in
> reality.
>
> We have some "*-generic" bindings. A name of that form might be more
> appropriate. Or we could choose an arbitrary OHCI implementation's
> vendor,ochi string and everything else can declare compatibility with
> that.

With the ehci patch I'll go for your suggestion to simply keep
via,vt8500-ehci as compat string for it, without adding a new generic
name. So for ohci I'll also go with the first platform to use it and
thus "allwinner,sun4i-ohci"


>
>> + - reg: Address range of the ohci registers.
>> + - interrupts: Should contain the ohci interrupt.
>> +
>> +Optional properties:
>> + - clocks: array of clocks
>> + - clock-names: clock names "ahb" and/or "ohci"
>
> A description of what the clocks are might be helpful.
>
> How about something like:
>
> - clocks: a list of phandle + clock specifier pairs, one for each entry
>    in clock-names.
>
> - clock-names: Should contain:
>     * "ahb" - some description here.
>     * "ohci" - some description here.

As Alan pointed out by asking "what is ahb" these
names are too platform specific (arm platform in this case),
for a generic driver. So I'm going to call them clk1, clk2 and
instead. It may seem a bit silly to use names at all in this
case, but having names makes things a lot easier
implementation wise.

Regards,

Hans
