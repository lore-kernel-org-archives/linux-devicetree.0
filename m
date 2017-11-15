From: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: [bug report] of/irq: Break out msi-map lookup (again)
Date: Wed, 15 Nov 2017 15:23:54 +0300
Message-ID: <20171115122354.f6axycussmmghtbp@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robin.murphy-5wv7dgnIgG8@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello Robin Murphy,

The patch 987068fcbdb7: "of/irq: Break out msi-map lookup (again)"
from Sep 12, 2016, leads to the following static checker warning:

	drivers/of/of_pci.c:375 of_pci_map_rid()
	error: we previously assumed 'id_out' could be null (see line 372)

drivers/of/of_pci.c
   371  
   372                  if (id_out)
                            ^^^^^^
Check for NULL

   373                          *id_out = masked_rid - rid_base + out_base;
   374  
   375                  pr_debug("%pOF: %s, using mask %08x, rid-base: %08x, out-base: %08x, length: %08x, rid: %08x -> %08x\n",
   376                          np, map_name, map_mask, rid_base, out_base,
   377                          rid_len, rid, *id_out);
                                               ^^^^^^
Unchecked dereference

   378                  return 0;

regards,
dan carpenter
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
