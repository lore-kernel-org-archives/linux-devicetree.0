From: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: re: of/fdt: move memreserve and dtb memory reservations into core
Date: Fri, 11 Mar 2016 11:48:43 +0300
Message-ID: <20160311084843.GA6181@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello Rob Herring,

The patch d1552ce449eb: "of/fdt: move memreserve and dtb memory
reservations into core" from Apr 1, 2014, leads to the following
static checker warning:

	drivers/of/fdt.c:594 early_init_fdt_scan_reserved_mem()
	error: potentially using uninitialized 'size'.

drivers/of/fdt.c
   583  void __init early_init_fdt_scan_reserved_mem(void)
   584  {
   585          int n;
   586          u64 base, size;
                          ^^^^
   587  
   588          if (!initial_boot_params)
   589                  return;
   590  
   591          /* Process header /memreserve/ fields */
   592          for (n = 0; ; n++) {
   593                  fdt_get_mem_rsv(initial_boot_params, n, &base, &size);
                                                                        ^^^^

   594                  if (!size)
                             ^^^^

Presumably we don't care about errors during boot because it's doomed
anyway, but we might want to silence the warning?

   595                          break;
   596                  early_init_dt_reserve_memory_arch(base, size, 0);
   597          }
   598  
   599          of_scan_flat_dt(__fdt_scan_reserved_mem, NULL);
   600          fdt_init_reserved_mem();
   601  }

regards,
dan carpenter
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
