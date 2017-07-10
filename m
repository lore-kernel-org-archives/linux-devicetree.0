From: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [v4,3/3] mwifiex: Enable WoWLAN for both sdio and pcie
Date: Mon, 10 Jul 2017 15:31:40 -0700
Message-ID: <20170710223138.GA145502@google.com>
References: <1479216964-3328-3-git-send-email-akarwar@marvell.com>
 <595A207D.3000804@rock-chips.com>
 <20170707005302.GA17921@google.com>
 <595EFA40.1080405@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <595EFA40.1080405-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jeffy <jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: Amitkumar Karwar <akarwar-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Cathy Luo <cluo-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Nishant Sarmukadam <nishants-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, rajatja-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

+ linux-pci
- linux-wireless

On Fri, Jul 07, 2017 at 11:04:32AM +0800, Jeffy Chen wrote:
> On 07/07/2017 08:53 AM, Brian Norris wrote:
> >It kind of seems like we inadvertently conflicted with the PCI OF
> >interrupt spec [1]. There, the "interrupts" property for a device (if
> >present) is supposed to represent INT{A...D} with values of {1...4}.
> >IIUC, there should only be a single entry in this property.
> >
> >If we were to extend this properly, I guess that would mean we'd need a
> >second "interrupts" entry, with a different parent. I think we can use
> >"interrupts-extended" for that.
> >
> >So we'd need to document an optional "interrupt-names" for Marvell, and
> >have the driver try that first. The rough outline would be something
> >like this.
> >
> >For the device tree (e.g., rk3399-gru):
> >
> >-			interrupt-parent = <&gpio0>;
> >-			interrupts = <8 IRQ_TYPE_LEVEL_LOW>;
> >+			interrupts-extended = <&pcie0 1>, <&gpio0 8 IRQ_TYPE_LEVEL_LOW>;
> >+			interrupt-names = "int-A", "wake";
> This is a great idea.
> 
> And how about also add a property to tell of_pci_irq to ignore of
> irq and force using PCI_INTERRUPT_PIN? Since there might be devices
> don't use pci irq, but using other irq(wowlan for example).

Even if they don't use the PCI IRQ, is there a way to provide an empty /
un-mapped entry?

I'm a little wary on trying to "extend" (which can sometimes be read
"break") the device tree spec here too much more. But perhaps DT or PCI
folks have a better recommendation (if they can hold their noses long
enough).

> Then we can specify this property and add a name("wake") to the wifi
> wake irq here. And interrupts-extended would still be an available
> option.

Brian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
