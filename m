From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 3/6] pci, thunder: Add PCIe host controller devicetree bindings
Date: Thu, 25 Sep 2014 22:22:23 +0200
Message-ID: <201409252222.23825.arnd@arndb.de>
References: <1411573068-12952-1-git-send-email-rric@kernel.org> <201409252126.38945.arnd@arndb.de> <CAErSpo5rhL7pLha-yWt7sZUBmAnwA6FkacL+sWXBKkSzsuC7Sg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAErSpo5rhL7pLha-yWt7sZUBmAnwA6FkacL+sWXBKkSzsuC7Sg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: Sunil Kovvuri <sunil.kovvuri-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, LAKML <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Robert Richter <rric-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-pci <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Robert Richter <rrichter-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, Sunil Goutham <sgoutham-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thursday 25 September 2014, Bjorn Helgaas wrote:
> OK.  You said "a range that has the nonrelocatable flag set should be
> used for IORESOURCE_PCI_FIXED mappings."  I thought you meant that the
> range was a bridge window, and somehow PCI_FIXED BARs should be put in
> that window.
> 
> But maybe you meant that nonrelocatable ranges should have the
> IORESOURCE_PCI_FIXED bit set in their struct resources.  That would
> mean we couldn't move the window, but we could put relocatable BARs
> inside the window.
> 
> What needs to be implemented?  Just the code that would set
> IORESOURCE_PCI_FIXED for nonrelocatable ranges?

It might be more complex than I thought. Let's see what the original
hack does:

+/*
+ * All PCIe devices in Thunder have fixed resources, shouldn't be reassigned.
+ * Also claim the device's valid resources to set 'res->parent' hierarchy.
+ */
+static void pci_dev_resource_fixup(struct pci_dev *dev)
+{
+       struct resource *res;
+       int resno;
+
+       for (resno = 0; resno < PCI_NUM_RESOURCES; resno++)
+               dev->resource[resno].flags |= IORESOURCE_PCI_FIXED;
+
+       for (resno = 0; resno < PCI_BRIDGE_RESOURCES; resno++) {
+               res = &dev->resource[resno];
+               if (res->parent || !(res->flags & IORESOURCE_MEM))
+                       continue;
+               pci_claim_resource(dev, resno);
+       }
+}
+DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_CAVIUM, PCI_ANY_ID,
+                       pci_dev_resource_fixup);

This actually looks harmful, because it means that any kernel that contains
the thunder host controller driver will do the above for any device made
by Cavium, whether it's connected to this bridge or not.

What I think we want instead is to mark any resource whose parent
resource is IORESOURCE_PCI_FIXED to have the same flag, and mark
the PCI host controller resources IORESOURCE_PCI_FIXED when the
nonrelocatable flag is set, and that should all be done in core
code, not in a driver fixup.

The part that still looks weird is the pci_claim_resource() that
Sunil mentioned. This is currently done for resources that do not
have a parent, but AFAICT all PCI device resources should have a
parent that connects it to the upstream bridge.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
