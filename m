From: Dan Carpenter <error27-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [patch] ehci-ppc-of: problems in unwind
Date: Sat, 14 Aug 2010 11:06:19 +0200
Message-ID: <20100814090619.GY645@bicker>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Brownell <dbrownell-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-l3A5Bk7waGM@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Sean MacLennan <smaclennan-Qtffpm9i2AVWk0Htik3J/w@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Vitaly Bordug <vitb-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The iounmap(ehci->ohci_hcctrl_reg); should be the first thing we do
because the ioremap() was the last thing we did.  Also if we hit any of
the goto statements in the original code then it would have led to a
NULL dereference of "ehci".  This bug was introduced in: 796bcae7361c
"USB: powerpc: Workaround for the PPC440EPX USBH_23 errata [take 3]"

I modified the few lines in front a little so that my code didn't
obscure the return success code path.

Signed-off-by: Dan Carpenter <error27-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
I don't have a cross compile environment set up so I haven't compiled
this code.  Sorry for that.

diff --git a/drivers/usb/host/ehci-ppc-of.c b/drivers/usb/host/ehci-ppc-of.c
index 335ee69..ba52be4 100644
--- a/drivers/usb/host/ehci-ppc-of.c
+++ b/drivers/usb/host/ehci-ppc-of.c
@@ -192,17 +192,19 @@ ehci_hcd_ppc_of_probe(struct platform_device *op, const struct of_device_id *mat
 	}
 
 	rv = usb_add_hcd(hcd, irq, 0);
-	if (rv == 0)
-		return 0;
+	if (rv)
+		goto err_ehci;
+
+	return 0;
 
+err_ehci:
+	if (ehci->has_amcc_usb23)
+		iounmap(ehci->ohci_hcctrl_reg);
 	iounmap(hcd->regs);
 err_ioremap:
 	irq_dispose_mapping(irq);
 err_irq:
 	release_mem_region(hcd->rsrc_start, hcd->rsrc_len);
