From: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [v4,3/3] mwifiex: Enable WoWLAN for both sdio and pcie
Date: Thu, 6 Jul 2017 17:53:03 -0700
Message-ID: <20170707005302.GA17921@google.com>
References: <1479216964-3328-3-git-send-email-akarwar@marvell.com>
 <595A207D.3000804@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <595A207D.3000804-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jeffy <jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: Amitkumar Karwar <akarwar-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Cathy Luo <cluo-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Nishant Sarmukadam <nishants-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, rajatja-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jul 03, 2017 at 06:46:21PM +0800, Jeffy Chen wrote:
> Hi guys,
> 
> with this patch, the pci device's irq might be override by this
> wakeup irq when not using msi:

Hmm, good point. I believe I noticed this one at some point and then
didn't get to investigate further...

It kind of seems like we inadvertently conflicted with the PCI OF
interrupt spec [1]. There, the "interrupts" property for a device (if
present) is supposed to represent INT{A...D} with values of {1...4}.
IIUC, there should only be a single entry in this property.

If we were to extend this properly, I guess that would mean we'd need a
second "interrupts" entry, with a different parent. I think we can use
"interrupts-extended" for that.

So we'd need to document an optional "interrupt-names" for Marvell, and
have the driver try that first. The rough outline would be something
like this.

For the device tree (e.g., rk3399-gru):

-			interrupt-parent = <&gpio0>;
-			interrupts = <8 IRQ_TYPE_LEVEL_LOW>;
+			interrupts-extended = <&pcie0 1>, <&gpio0 8 IRQ_TYPE_LEVEL_LOW>;
+			interrupt-names = "int-A", "wake";

Then mwifiex would need to check "byname" before trying "by index":

	adapter->irq_wakeup = of_irq_get_byname(adapter->dt_node, "wake");
	if (!adapter->irq_wakeup) {
		adapter->irq_wakeup = irq_of_parse_and_map(adapter->dt_node, 0);
		if (!adapter->irq_wakeup) {
			dev_dbg(dev, "fail to parse irq_wakeup from device tree\n");
			goto err_exit;
		}
	}

Or if we want to suggest the original binding was wrong and that we
should just ignore existing device trees that tried to use it, we can
skip the by-index fallback.

Brian

[1] Documentation/devicetree/bindings/pci/pci.txt points to
http://www.firmware.org/1275/practice/imap/imap0_9d.pdf
except that link is also dead now. I found the same doc here:
https://www.openfirmware.info/data/docs/rec.intmap.d09.pdf
Might want to update the binding doc... I've sent a patch for that
separately.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
