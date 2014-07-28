From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v5] pcie: Add Xilinx PCIe Host Bridge IP driver
Date: Mon, 28 Jul 2014 15:02:52 +0200
Message-ID: <8258903.Rn4s07GKGV@wuerfel>
References: <1406131381-25577-1-git-send-email-sthokal@xilinx.com> <CA+mB=1JhDF=BBXcyTbgVB8S7qH=Mb1JH78HLL4pA9OBH19hQvA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CA+mB=1JhDF=BBXcyTbgVB8S7qH=Mb1JH78HLL4pA9OBH19hQvA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Srikanth Thokala <sthokal-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, svemula-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, anirudh-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Monday 28 July 2014 18:04:34 Srikanth Thokala wrote:
> Hi Arnd and Rob,
> 
> I discussed with Bjorn and we believe this patch is in good shape to
> apply.  And Bjorn requires ACKs to apply this patch.  So, could you
> guys please review this patch and provided your ACKs to this patch.

Looks great for the most part. I've looked through the whole driver
again, and I have two small issues remaining:

a) Please clarify in the changeset description why there is no support
   for PCI I/O space. 

b) I think you should use the 'msi-parent' property, and the
   of_pci_find_msi_chip_by_node() to find the msi_chip for the
   PCI controller. This will make it possible to forward MSIs
   to the main interrupt controller in the system, which is more
   efficient. See the pcie-mvebu driver for an example of this.

Other than these:

Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
