From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v9 2/4] ehci-platform: Add support for clks
 and phy passed through devicetree
Date: Tue, 11 Feb 2014 11:13:07 +0100
Message-ID: <52F9F7B3.6080802@redhat.com>
References: <1391787403-20961-1-git-send-email-hdegoede@redhat.com> <1391787403-20961-3-git-send-email-hdegoede@redhat.com> <52F9E98B.90407@ti.com> <52F9EE06.3070003@redhat.com> <52F9F4C6.6080201@ti.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-sunxi+bncBDL4X2GMZUKRBP7P46LQKGQEB5X6V4Y-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <52F9F4C6.6080201-l0cyMroinI0@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Tony Prisk <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>, linux-usb <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Menon, Nishanth" <nm-l0cyMroinI0@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 02/11/2014 11:00 AM, Roger Quadros wrote:
> On 02/11/2014 11:31 AM, Hans de Goede wrote:
>> Hi,
>>
>> On 02/11/2014 10:12 AM, Roger Quadros wrote:
>>> Hi Hans,
>>>
>>> On 02/07/2014 05:36 PM, Hans de Goede wrote:
>>>> Currently ehci-platform is only used in combination with devicetree when used
>>>> with some Via socs. By extending it to (optionally) get clks and a phy from
>>>> devicetree, and enabling / disabling those on power_on / off, it can be used
>>>> more generically. Specifically after this commit it can be used for the
>>>> ehci controller on Allwinner sunxi SoCs.
>>>>
>>>> Since ehci-platform is intended to handle any generic enough non pci ehci
>>>> device, add a "usb-ehci" compatibility string.
>>>>
>>>> There already is a usb-ehci device-tree bindings document, update this
>>>> with clks and phy bindings info.
>>>>
>>>> Although actually quite generic so far the via,vt8500 compatibilty string
>>>> had its own bindings document. Somehow we even ended up with 2 of them. Since
>>>> these provide no extra information over the generic usb-ehci documentation,
>>>> this patch removes them.
>>>>
>>>> The ehci-ppc-of.c driver also claims the usb-ehci compatibility string,
>>>> even though it mostly is ibm,usb-ehci-440epx specific. ehci-platform.c is
>>>> not needed on ppc platforms, so add a !PPC_OF dependency to it to avoid
>>>> 2 drivers claiming the same compatibility string getting build on ppc.
>>>>
>>>
>>> This breaks all OMAP platforms on linux-next for the exact same reason. see [1].
>>>
>>> ./arch/arm/boot/dts/omap4.dtsi:				compatible = "ti,ehci-omap", "usb-ehci";
>>> ./arch/arm/boot/dts/omap3.dtsi:				compatible = "ti,ehci-omap", "usb-ehci";
>>> ./arch/arm/boot/dts/omap5.dtsi:				compatible = "ti,ehci-omap", "usb-ehci";
>>
>> That should not be the case, the driver core should try to find a driver matching
>> the compatibility string from left to right, or in other words from most specific
>> to least specific. This is part of the whole devicetree design.
>>
>> So as long as the driver claiming "ti,ehci-omap" is available at probe time that
>> one should get used and things should work fine. Now if ehci-platform is built-in
>> and ehci-omap is a module, then I guess one could see the described breakage.
>>
>> If the driver is built-in and things are not working, then we will need to do some
>> debugging as to why the left to right matching is not working as expected.
> 
> Both ehci_platform and ehci_omap were built-in and still the ehci_platform driver got
> probe preference. So it looks like the left to right compatible list priority probing
> feature doesn't work.

Oops, I guess nothing relies on it sofar. Well we could go and debug and fix this but...

> 
>>
>> I must admit I'm not sure what happens if both are a module, the kernel direct
>> module load will likely fail due to lack of a rootfs at that point, and then
>> the module will later get loaded by udev I assume, at which point there are no
>> loading ordering guarantees.
>>
>> The easiest solution to ensure that "ti,ehci-omap" is available at probe time
>> (if enabled) seems to be to change USB_EHCI_HCD_OMAP to a boolean.
> 
> That is a limitation I don't like to have for USB_EHCI_HCD_OMAP.

I completely understand, thinking more about this I'm simply going to change the
compatibility string for ohci- and ehci-platform to be "ohci-platform" resp.
"ehci-platform". I know there are some people who don't like the -platform
suffix, but though luck, as the above clearly shows using the generic "usb-ohci" /
"usb-ehci" they were advocating for leads to a ton of issues, and we already
have a precedent for ?hci-platform in the form of "xhci-platform".

Regards,

Hans
