From: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Subject: Re: [RFC][PATCH 2/2] phy: miphy365x: Convert to use phy.h instead
 of phy-miphy365x.h
Date: Thu, 26 Mar 2015 04:41:48 +0530
Message-ID: <551340B4.2010001@ti.com>
References: <1425520379.1637.7.camel@phoenix>	<1425520665.1637.10.camel@phoenix>	<54FD8795.6020409@ti.com> <CAFRkauBNEgMiQtHxVuz_rif7+AWBjXoLVydidzjxK-oMWYxCrA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAFRkauBNEgMiQtHxVuz_rif7+AWBjXoLVydidzjxK-oMWYxCrA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Axel Lin <axel.lin-8E1dMatC8ynQT0dZR+AlfA@public.gmane.org>
Cc: Gabriel FERNANDEZ <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, patrice CHOTARD <patrice.chotard-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

+Maxime, Srinivas, patrice

On Monday 09 March 2015 06:55 PM, Axel Lin wrote:
> 2015-03-09 19:44 GMT+08:00 Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>:
>> Hi,
>>
>>
>> On Thursday 05 March 2015 07:27 AM, Axel Lin wrote:
>>>
>>> The defines in phy-miphy365x.h are all covered in phy.h:
>>>
>>> MIPHY_TYPE_SATA == PHY_TYPE_STA
>>> MIPHY_TYPE_PCIE == PHY_TYPE_PCIE
>>> MIPPHY_TYPE_USB == PHY_TYPE_USB2
>>>
>>> So covert to use phy.h and then delete phy-miphy365x.h.
>>>
>>> Signed-off-by: Axel Lin <axel.lin-8E1dMatC8ynQT0dZR+AlfA@public.gmane.org>
>>> ---
>>>   Documentation/devicetree/bindings/ata/ahci-st.txt       |  2 +-
>>>   Documentation/devicetree/bindings/phy/phy-miphy365x.txt |  8 ++++----
>>>   arch/arm/boot/dts/stih416.dtsi                          |  4 ++--
>>>   drivers/phy/phy-miphy365x.c                             | 14
>>> +++++++-------
>>>   include/dt-bindings/phy/phy-miphy365x.h                 | 14
>>> --------------
>>>   5 files changed, 14 insertions(+), 28 deletions(-)
>>>   delete mode 100644 include/dt-bindings/phy/phy-miphy365x.h
>>>
>>> diff --git a/Documentation/devicetree/bindings/ata/ahci-st.txt
>>> b/Documentation/devicetree/bindings/ata/ahci-st.txt
>>> index 0574a77..070748b 100644
>>> --- a/Documentation/devicetree/bindings/ata/ahci-st.txt
>>> +++ b/Documentation/devicetree/bindings/ata/ahci-st.txt
>>> @@ -21,7 +21,7 @@ Example:
>>>                 reg             = <0xfe380000 0x1000>;
>>>                 interrupts      = <GIC_SPI 157 IRQ_TYPE_NONE>;
>>>                 interrupt-names = "hostc";
>>> -               phys            = <&miphy365x_phy MIPHY_PORT_0
>>> MIPHY_TYPE_SATA>;
>>> +               phys            = <&miphy365x_phy MIPHY_PORT_0
>>> PHY_TYPE_SATA>;
>>>                 phy-names       = "ahci_phy";
>>>                 resets          = <&powerdown STIH416_SATA0_POWERDOWN>,
>>>                                   <&softreset STIH416_SATA0_SOFTRESET>;
>>> diff --git a/Documentation/devicetree/bindings/phy/phy-miphy365x.txt
>>> b/Documentation/devicetree/bindings/phy/phy-miphy365x.txt
>>> index 9802d5d..087294d 100644
>>> --- a/Documentation/devicetree/bindings/phy/phy-miphy365x.txt
>>> +++ b/Documentation/devicetree/bindings/phy/phy-miphy365x.txt
>>> @@ -20,8 +20,8 @@ Required nodes        :  A sub-node is required for each
>>> channel the controller
>>>   Required properties (port (child) node):
>>>   - #phy-cells  : Should be 1 (See second example)
>>>                   Cell after port phandle is device type from:
>>> -                       - MIPHY_TYPE_SATA
>>> -                       - MIPHY_TYPE_PCI
>>> +                       - PHY_TYPE_SATA
>>> +                       - PHY_TYPE_PCIE
>>>   - reg         : Address and length of register sets for each device in
>>>                   "reg-names"
>>>   - reg-names     : The names of the register addresses corresponding to
>>> the
>>> @@ -68,10 +68,10 @@ property, containing a phandle to the phy port node
>>> and a device type.
>>>
>>>   Example:
>>>
>>> -#include <dt-bindings/phy/phy-miphy365x.h>
>>> +#include <dt-bindings/phy/phy.h>
>>>
>>>         sata0: sata@fe380000 {
>>>                 ...
>>> -               phys      = <&phy_port0 MIPHY_TYPE_SATA>;
>>> +               phys      = <&phy_port0 PHY_TYPE_SATA>;
>>>                 ...
>>>         };
>>> diff --git a/arch/arm/boot/dts/stih416.dtsi
>>> b/arch/arm/boot/dts/stih416.dtsi
>>> index ea28eba..eeb7afe 100644
>>> --- a/arch/arm/boot/dts/stih416.dtsi
>>> +++ b/arch/arm/boot/dts/stih416.dtsi
>>
>>
>> Can you split the patch so that I can queue the PHY part?
> 
> In my opinion, apply the patch as is should be fine and we don't have any
> build breakage. I think the change in each file is pretty trivial and won't
> cause problem. otherwise, I will have to send patches for the conversion
> in each file and then wait until all patches are merged. Then send another
> patch to delete include/dt-bindings/phy/phy-miphy365x.h.

Okay. I can queue after getting Ack from arch/arm/boot/dts/sti* maintainers.

Cheers
Kishon
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
