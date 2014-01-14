From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: Re: [PATCH v5 2/2] ehci-platform: Add support for
 clks and phy passed through devicetree
Date: Tue, 14 Jan 2014 09:44:47 +0100
Message-ID: <52D4F8FF.1050105@redhat.com>
References: <1389653115-11028-1-git-send-email-hdegoede@redhat.com> <1389653115-11028-3-git-send-email-hdegoede@redhat.com> <52D4B933.9080505@prisktech.co.nz>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Return-path: <linux-sunxi+bncBDL4X2GMZUKRBCHS2OLAKGQEAHEB6FA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <52D4B933.9080505-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-usb <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 01/14/2014 05:12 AM, Tony Prisk wrote:
> On 14/01/14 11:45, Hans de Goede wrote:
>> Currently ehci-platform is only used in combination with devicetree when used
>> with some Via socs. By extending it to (optionally) get clks and a phy from
>> devicetree, and enabling / disabling those on power_on / off, it can be used
>> more generically. Specifically after this commit it can be used for the
>> ehci controller on Allwinner sunxi SoCs.
>>
>> Since ehci-platform is intended to handle any generic enough non pci ehci
>> device, add a "usb-ehci" compatibility string.
>>
>> There already is a usb-ehci device-tree bindings document, update this
>> with clks and phy bindings info.
>>
>> Although actually quite generic so far the via,vt8500 compatibilty string
>> had its own bindings document. Somehow we even ended up with 2 of them. Since
>> these provide no extra information over the generic usb-ehci documentation,
>> this patch removes them.
>>
>> The ehci-ppc-of.c driver also claims the usb-ehci compatibility string,
>> even though it mostly is ibm,usb-ehci-440epx specific. ehci-platform.c is
>> not needed on ppc platforms, so add a !PPC_OF dependency to it to avoid
>> 2 drivers claiming the same compatibility string getting build on ppc.
>>
>> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>> ---
>>   Documentation/devicetree/bindings/usb/usb-ehci.txt |  25 +++-
>>   .../devicetree/bindings/usb/via,vt8500-ehci.txt    |  15 ---
>>   .../devicetree/bindings/usb/vt8500-ehci.txt        |  12 --
>>   drivers/usb/host/Kconfig                           |   1 +
>>   drivers/usb/host/ehci-platform.c                   | 149 +++++++++++++++++----
>>   5 files changed, 142 insertions(+), 60 deletions(-)
>>   delete mode 100644 Documentation/devicetree/bindings/usb/via,vt8500-ehci.txt
>>   delete mode 100644 Documentation/devicetree/bindings/usb/vt8500-ehci.txt
>>
>> diff --git a/Documentation/devicetree/bindings/usb/usb-ehci.txt b/Documentation/devicetree/bindings/usb/usb-ehci.txt
>> index fa18612..fad10f3 100644
>> --- a/Documentation/devicetree/bindings/usb/usb-ehci.txt
>> +++ b/Documentation/devicetree/bindings/usb/usb-ehci.txt
>> @@ -7,13 +7,14 @@ Required properties:
>>       (debug-port or other) can be also specified here, but only after
>>       definition of standard EHCI registers.
>>     - interrupts : one EHCI interrupt should be described here.
>> -If device registers are implemented in big endian mode, the device
>> -node should have "big-endian-regs" property.
>> -If controller implementation operates with big endian descriptors,
>> -"big-endian-desc" property should be specified.
>> -If both big endian registers and descriptors are used by the controller
>> -implementation, "big-endian" property can be specified instead of having
>> -both "big-endian-regs" and "big-endian-desc".
>> +
>> +Optional properties:
>> + - big-endian-regs : boolean, set this for hcds with big-endian registers
>> + - big-endian-desc : boolean, set this for hcds with big-endian descriptors
>> + - big-endian : boolean, for hcds with big-endian-regs + big-endian-desc
>> + - clocks : a list of phandle + clock specifier pairs
>> + - phys : phandle + phy specifier pair
>> + - phy-names : "usb"
>>   Example (Sequoia 440EPx):
>>       ehci@e0000300 {
>> @@ -23,3 +24,13 @@ Example (Sequoia 440EPx):
>>          reg = <0 e0000300 90 0 e0000390 70>;
>>          big-endian;
>>      };
>> +
>> +Example (Allwinner sun4i A10 SoC):
>> +   ehci0: ehci@0x01c14000 {
>> +       compatible = "allwinner,sun4i-a10-ehci", "usb-ehci";
>> +       reg = <0x01c14000 0x100>;
>> +       interrupts = <39>;
>> +       clocks = <&ahb_gates 1>;
>> +       phys = <&usbphy 1>;
>> +       phy-names = "usb";
>> +   };

<snip>

> You have removed the documentation for the via,vt8500-ehci and wm,prizm-ehci bindings (which in itself isn't really an issue), and left them in the driver (again, not an issue)

Correct.

> - except now we have two bindings without any binding documentation?!?

My reasoning behind is that the driver is really a generic usb-ehci driver, and the only reason
the 2 compatibility strings are left in there is for backwards compatibility. I don't think
compatibility strings only kept in the driver for backwards compatibility should be documented,
because documented suggests people can rely on them and then they may end up getting used for new things.

> I'm not sure where the 'wm,prizm-ehci' string came from (presumably me some time ago), but it isn't used and could be dropped.
> All WonderMedia SoCs use the 'via,vt8500-ehci' - Doing a quick grep of arch/arm/boot/dts shows no usage of 'wm,prizm-ehci'.
>
> Arguably, the dtsi files for the WonderMedia SoCs could be updated to include 'usb-ehci' as a second compatible string

Right, I think this would be a good thing to do regardless, also see all the existing dts files for other
boards already doing this (which is why we ended up using usb-ehci in the first place).

> and the 'via,vt8500-ehci' could be dropped from the driver - but it does mean that old dts files won't work with the current kernel (and I think that's a no-no).

Right, which is exactly why I did not remove them from the driver. But since as you indicate yourself
if we were to do things from scratch we would likely not put them in the driver it seems best to
leave them undocumented. Alternatively, if you see this as a problem I can add a note to usb-ehci.txt listing
these 2 compatibility strings as legacy compatiblity strings, which should not be used for new dts files.

Regards,

Hans
