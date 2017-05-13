From: Sascha Silbe <x-linux-XAdK+dDVA0n/cwiKa4OQEw@public.gmane.org>
Subject: [PATCH 0/2] FDT fixes for running on native Open Firmware
Date: Sat, 13 May 2017 12:22:27 +0200
Message-ID: <20170513102229.22579-1-x-linux@infra-silbe.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Two fixes for bugs in the FDT code I discovered while trying to get
the mainline kernel to run on OLPC XO-1.75. XOs are running Open
Firmware natively, not just passing down some blob.

Sascha Silbe (2):
  fdt: correctly handle uncompressed node names
  of: fdt: fix unflattening of FDTs containing uncompressed paths

 drivers/of/fdt.c            | 2 ++
 scripts/dtc/libfdt/fdt_ro.c | 3 +++
 2 files changed, 5 insertions(+)

-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
