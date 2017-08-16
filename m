From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [RFCv2 usb-next 2/3] usb: host: add a generic platform USB
 roothub driver
Date: Wed, 16 Aug 2017 23:43:44 +0200
Message-ID: <CAFBinCD=wjSRgseH17QDRz1HjAmGE_FeT2N7K+TErmGh2XbH7Q@mail.gmail.com>
References: <20170713105939.31566-1-martin.blumenstingl@googlemail.com>
 <20170713105939.31566-3-martin.blumenstingl@googlemail.com> <1500964843.25536.107.camel@mhfsdcap03>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1500964843.25536.107.camel@mhfsdcap03>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On Tue, Jul 25, 2017 at 8:40 AM, Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
> On Thu, 2017-07-13 at 12:59 +0200, Martin Blumenstingl wrote:
>> Many SoC platforms have separate devices for the USB PHY which are
>> registered through the generic PHY framework. These PHYs have to be
>> enabled to make the USB controller actually work. They also have to be
>> disabled again on shutdown/suspend.
>>
>> Currently (at least) the following HCI platform drivers are using custom
>> code to obtain all PHYs via devicetree for the roothub/controller and
>> disable/enable them when required:
>> - ehci-platform.c has ehci_platform_power_{on,off}
>> - xhci-mtk.c has xhci_mtk_phy_{init,exit,power_on,power_off}
>> - ohci-platform.c has ohci_platform_power_{on,off}
>>
>> These drivers are not using the generic devicetree USB device bindings
>> yet which were only introduced recently (documentation is available in
>> devicetree/bindings/usb/usb-device.txt).
>> With this new driver the usb2-phy and usb3-phy can be specified directly
>> in the child-node of the corresponding port of the roothub via
>> devicetree. This can be extended by not just parsing PHYs (some of the
>> other drivers listed above are for example also parsing a list of clocks
>> as well) when required.
>>
>> Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
>> ---
>>  drivers/usb/host/Kconfig            |   3 +
>>  drivers/usb/host/Makefile           |   2 +
>>  drivers/usb/host/platform-roothub.c | 146 ++++++++++++++++++++++++++++++++++++
>>  drivers/usb/host/platform-roothub.h |  14 ++++
>>  4 files changed, 165 insertions(+)
>>  create mode 100644 drivers/usb/host/platform-roothub.c
>>  create mode 100644 drivers/usb/host/platform-roothub.h
>>
>> diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
>> index fa5692dec832..b8b05c786b2a 100644
>> --- a/drivers/usb/host/Kconfig
>> +++ b/drivers/usb/host/Kconfig
>> @@ -805,6 +805,9 @@ config USB_HCD_SSB
>>
>>         If unsure, say N.
>>
>> +config USB_PLATFORM_ROOTHUB
>> +     bool
>> +
>>  config USB_HCD_TEST_MODE
>>       bool "HCD test mode support"
>>       ---help---
>> diff --git a/drivers/usb/host/Makefile b/drivers/usb/host/Makefile
>> index cf2691fffcc0..dc817f82d632 100644
>> --- a/drivers/usb/host/Makefile
>> +++ b/drivers/usb/host/Makefile
>> @@ -29,6 +29,8 @@ obj-$(CONFIG_USB_WHCI_HCD)  += whci/
>>
>>  obj-$(CONFIG_USB_PCI)        += pci-quirks.o
>>
>> +obj-$(CONFIG_USB_PLATFORM_ROOTHUB)   += platform-roothub.o
>> +
>>  obj-$(CONFIG_USB_EHCI_HCD)   += ehci-hcd.o
>>  obj-$(CONFIG_USB_EHCI_PCI)   += ehci-pci.o
>>  obj-$(CONFIG_USB_EHCI_HCD_PLATFORM)  += ehci-platform.o
>> diff --git a/drivers/usb/host/platform-roothub.c b/drivers/usb/host/platform-roothub.c
>> new file mode 100644
>> index 000000000000..84837e42b006
>> --- /dev/null
>> +++ b/drivers/usb/host/platform-roothub.c
>> @@ -0,0 +1,146 @@
>> +/*
>> + * platform roothub driver - a virtual PHY device which passes all phy_*
>> + * function calls to multiple (actual) PHY devices. This is comes handy when
>> + * initializing all PHYs on a root-hub (to keep them all in the same state).
>> + *
>> + * Copyright (C) 2017 Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License version 2 as
>> + * published by the Free Software Foundation.
>> + *
>> + * You should have received a copy of the GNU General Public License
>> + * along with this program. If not, see <http://www.gnu.org/licenses/>.
>> + */
>> +
>> +#include <linux/device.h>
>> +#include <linux/list.h>
>> +#include <linux/phy/phy.h>
>> +#include <linux/of.h>
>> +#include <linux/usb/of.h>
>> +
>> +#include "platform-roothub.h"
>> +
>> +#define ROOTHUB_PORTNUM              0
>> +
>> +struct platform_roothub {
>> +     struct phy              *phy;
>> +     struct list_head        list;
>> +};
>> +
>> +static struct platform_roothub *platform_roothub_alloc(struct device *dev)
>> +{
>> +     struct platform_roothub *roothub_entry;
>> +
>> +     roothub_entry = devm_kzalloc(dev, sizeof(*roothub_entry), GFP_KERNEL);
>> +     if (!roothub_entry)
>> +             return ERR_PTR(-ENOMEM);
>> +
>> +     INIT_LIST_HEAD(&roothub_entry->list);
>> +
>> +     return roothub_entry;
>> +}
>> +
>> +static int platform_roothub_add_phy(struct device *dev,
>> +                                 struct device_node *port_np,
>> +                                 const char *con_id, struct list_head *list)
>> +{
>> +     struct platform_roothub *roothub_entry;
>> +     struct phy *phy = devm_of_phy_get(dev, port_np, con_id);
>> +
>> +     if (IS_ERR_OR_NULL(phy)) {
>> +             if (!phy || PTR_ERR(phy) == -ENODEV)
>> +                     return 0;
>> +             else
>> +                     return PTR_ERR(phy);
>> +     }
>> +
>> +     roothub_entry = platform_roothub_alloc(dev);
>> +     if (IS_ERR(roothub_entry))
>> +             return PTR_ERR(roothub_entry);
>> +
>> +     roothub_entry->phy = phy;
>> +
>> +     list_add_tail(&roothub_entry->list, list);
>> +
>> +     return 0;
>> +}
>> +
>> +struct platform_roothub *platform_roothub_init(struct device *dev)
>> +{
>> +     struct device_node *roothub_np, *port_np;
>> +     struct platform_roothub *plat_roothub;
>> +     int err;
>> +
>> +     roothub_np = usb_of_get_child_node(dev->of_node, ROOTHUB_PORTNUM);
>> +     if (!of_device_is_available(roothub_np))
>> +             return NULL;
>> +
>> +     plat_roothub = platform_roothub_alloc(dev);
>> +     if (IS_ERR(plat_roothub))
>> +             return plat_roothub;
>> +
>> +     for_each_available_child_of_node(roothub_np, port_np) {
>> +             err = platform_roothub_add_phy(dev, port_np, "usb2-phy",
>> +                                            &plat_roothub->list);
>> +             if (err)
>> +                     return ERR_PTR(err);
>> +
>> +             err = platform_roothub_add_phy(dev, port_np, "usb3-phy",
>> +                                            &plat_roothub->list);
>> +             if (err)
>> +                     return ERR_PTR(err);
>> +     }
>> +
>> +     return plat_roothub;
>> +}
>> +EXPORT_SYMBOL_GPL(platform_roothub_init);
> Can we process the case without phy-names property?
> as following one, phy-names may be redundant, because the phy type is
> informed in phys property.
>
> port@2 {
>     reg = <2>;
>     phys = <&u2port1 PHY_TYPE_USB2>, <&u3port1 PHY_TYPE_USB3>;
>     phy-names = "usb2-phy", "usb3-phy";
> };
>
>
>> +
>> +int platform_roothub_power_on(struct platform_roothub *plat_roothub)
>> +{
>> +     struct platform_roothub *roothub_entry;
>> +     struct list_head *head;
>> +     int err;
>> +
>> +     if (!plat_roothub)
>> +             return 0;
>> +
>> +     head = &plat_roothub->list;
>> +
>> +     list_for_each_entry(roothub_entry, head, list) {
>> +             err = phy_init(roothub_entry->phy);
>> +             if (err)
>> +                     goto err_out;
>> +
>> +             err = phy_power_on(roothub_entry->phy);
>> +             if (err) {
>> +                     phy_exit(roothub_entry->phy);
>> +                     goto err_out;
>> +             }
>> +     }
>> +
>> +     return 0;
>> +
>> +err_out:
>> +     list_for_each_entry_continue_reverse(roothub_entry, head, list) {
>> +             phy_power_off(roothub_entry->phy);
>> +             phy_exit(roothub_entry->phy);
>> +     }
>> +
>> +     return err;
>> +}
>> +EXPORT_SYMBOL_GPL(platform_roothub_power_on);
>> +
>> +void platform_roothub_power_off(struct platform_roothub *plat_roothub)
>> +{
>> +     struct platform_roothub *roothub_entry;
>> +
>> +     if (!plat_roothub)
>> +             return;
>> +
>> +     list_for_each_entry_reverse(roothub_entry, &plat_roothub->list, list) {
>> +             phy_power_off(roothub_entry->phy);
>> +             phy_exit(roothub_entry->phy);
>> +     }
>> +}
>> +EXPORT_SYMBOL_GPL(platform_roothub_power_off);
> I test it, and works fine on mt8173.
> It will be flexible enough if some more APIs are provided, such as
> porwer_on/off all phys but not init/exit them.
> e.g. In order to keep link state on mt8173, we just power off all
> phys(not exit) when system enter suspend, then power on
> them again (needn't init, otherwise device will be disconnected) when
> system resume, this can avoid re-enumerating device.
RFCv3 contains a fix for this (which I can't properly test myself,
since the Amlogic platform currently does not have suspend support).
it would be great if you code give it another try (see [0]) - if it
works for you then a Tested-by, Reviewed-By or Acked-By would be
awesome!

>> diff --git a/drivers/usb/host/platform-roothub.h b/drivers/usb/host/platform-roothub.h
>> new file mode 100644
>> index 000000000000..bde0bf299e3b
>> --- /dev/null
>> +++ b/drivers/usb/host/platform-roothub.h
>> @@ -0,0 +1,14 @@
>> +#ifndef USB_HOST_PLATFORM_ROOTHUB_H
>> +#define USB_HOST_PLATFORM_ROOTHUB_H
>> +
>> +struct phy;
>> +struct device_node;
> These two declarations are not needed, when I remove them, and still
> compile pass.
>
>> +
>> +struct platform_roothub;
>> +
>> +struct platform_roothub *platform_roothub_init(struct device *dev);
>> +
>> +int platform_roothub_power_on(struct platform_roothub *plat_roothub);
>> +void platform_roothub_power_off(struct platform_roothub *plat_roothub);
>> +
>> +#endif /* USB_HOST_PLATFORM_ROOTHUB_H */
>
>


Regards,
Martin


[0] http://lists.infradead.org/pipermail/linux-amlogic/2017-August/004596.html
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
