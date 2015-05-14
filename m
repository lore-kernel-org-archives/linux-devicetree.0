From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 5/5] usb: add pxa1928 ehci support
Date: Thu, 14 May 2015 11:36:35 -0500
Message-ID: <CAL_JsqLq0x47O4gSs_vnfNkaUsE9bp9M9W5SV0c7vJ6X6b5cdA@mail.gmail.com>
References: <1431557340-5421-6-git-send-email-robh@kernel.org> <Pine.LNX.4.44L0.1505141025280.1582-100000@iolanthe.rowland.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <Pine.LNX.4.44L0.1505141025280.1582-100000-IYeN2dnnYyZXsRXLowluHWD2FQJk+8+b@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux USB List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, May 14, 2015 at 9:56 AM, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org> wrote:
> On Wed, 13 May 2015, Rob Herring wrote:
>
>> Add platform driver for Marvell PXA1928 SOC. This is different from the
>> mv-ehci driver in that it uses the generic phy framework, uses DT, does
>> not use platform_data, is host only, and has a specific HSIC PHY and
>> controller initialization handshake.
>
> Are those differences sufficient to make a separate source file
> necessary?  There are plenty of other drivers that work for both DT and
> non-DT, for example.

IMO, yes. If it were only DT support, then no it would not make sense.
I don't disagree there are too many ehci drivers mostly varying in phy
control.

Actually, ehci-platform is a closer match to this driver. I could use
it perhaps and either add my custom power_on function and a match
table entry to it or export ehci-platform functions (probe,
power_{on,off}, and use them here. Opinion on which direction you
prefer?

There's also a resume issue I have to figure out how support too. This
is what the vendor driver does:

@@ -469,6 +470,40 @@ static int ehci_bus_resume (struct usb_hcd *hcd)
                        set_bit(i, &resume_needed);
                }
                ehci_writel(ehci, temp, &ehci->regs->port_status [i]);
+
+               /* for HSIC phy, we have already disable SE0 state when
+                * resume back. we need do following step to pull USB
+                * controller back. */
+#ifdef CONFIG_USB_EHCI_MV_U2H_HSIC
+#define PHY_TEST_GRP_0 0x10
+
+#define S2H_TEST_UTMI_SEL (0x1 << 7)
+#define S2H_TEST_SUSPENDM (0x1 << 14)
+#define S2H_TEST_TX_BITSTUFF_EN (0x1 << 29)
+
+               if (hcd->usb_phy->is_hsic) {
+                       void __iomem *phy_base = hcd->usb_phy->io_priv;
+                       unsigned int count;
+                       mdelay(10);
+
+                       temp = readl(phy_base + PHY_TEST_GRP_0);
+                       writel(temp | (S2H_TEST_UTMI_SEL
+                                       | S2H_TEST_SUSPENDM
+                                       | S2H_TEST_TX_BITSTUFF_EN),
+                                       phy_base + PHY_TEST_GRP_0);
+
+                       count = 1000;
+                       while (--count && (ehci_readl(ehci,
+                               &ehci->regs->port_status[i]) & PORT_RESUME))
+                               udelay(50);
+                       if (count <= 0)
+                               ehci_dbg(ehci, "resume time out\n");
+                       writel(readl(phy_base + PHY_TEST_GRP_0)
+                               & ~S2H_TEST_UTMI_SEL,
+                               phy_base + PHY_TEST_GRP_0);
+               }
+#endif
+
        }

        /*


>> +config USB_EHCI_MV_OF
>> +     bool "EHCI OF support for Marvell PXA/MMP USB controller"
>> +     depends on (ARCH_PXA || ARCH_MMP)
>> +     select USB_EHCI_ROOT_HUB_TT
>> +     ---help---
>> +       Enables support for Marvell (including PXA and MMP series) on-chip
>> +       USB SPH and OTG controller. SPH is a single port host, and it can
>> +       only be EHCI host. OTG is controller that can switch to host mode.
>> +       Note that this driver will not work on Marvell's other EHCI
>> +       controller used by the EBU-type SoCs including Orion, Kirkwood,
>> +       Dova, Armada 370 and Armada XP. See "Support for Marvell EBU
>> +       on-chip EHCI USB controller" for those.
>
> This is identical to the help text for USB_EHCI_MV.  How is a user
> supposed to know which option to enable?

The OTG part needs to go. Perhaps I need to make it PXA1928 specific.
All I know about Marvell IP is it is scattered all over the place, so
determining which SOCs are the same IP is difficult. The PHYs for sure
seem to be different on every chip as I did not find any existing
Marvell phy drivers that match.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
