From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] of: Use SPDX license tag for DT files
Date: Thu,  4 Jan 2018 17:05:40 -0600
Message-ID: <20180104230540.6791-1-robh@kernel.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Guennadi Liakhovetski <g.liakhovetski-Mmb7MZpHnFY@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Convert remaining DT files to use SPDX-License-Identifier tags.

Cc: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: Guennadi Liakhovetski <g.liakhovetski-Mmb7MZpHnFY@public.gmane.org>
Cc: Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 drivers/of/Kconfig                              |  1 +
 drivers/of/address.c                            |  2 +-
 drivers/of/base.c                               |  6 +-----
 drivers/of/device.c                             |  1 +
 drivers/of/dynamic.c                            |  1 +
 drivers/of/fdt.c                                |  5 +----
 drivers/of/fdt_address.c                        |  6 +-----
 drivers/of/irq.c                                |  6 +-----
 drivers/of/kobj.c                               |  2 +-
 drivers/of/of_numa.c                            | 13 +------------
 drivers/of/of_private.h                         |  6 +-----
 drivers/of/of_reserved_mem.c                    |  6 +-----
 drivers/of/overlay.c                            |  5 +----
 drivers/of/pdt.c                                |  6 +-----
 drivers/of/platform.c                           |  7 +------
 drivers/of/property.c                           |  6 +-----
 drivers/of/resolver.c                           |  5 +----
 drivers/of/unittest-data/overlay_bad_symbol.dts |  1 +
 include/linux/of.h                              |  6 +-----
 include/linux/of_dma.h                          |  5 +----
 include/linux/of_fdt.h                          |  5 +----
 include/linux/of_gpio.h                         |  6 +-----
 include/linux/of_graph.h                        |  5 +----
 include/linux/of_pdt.h                          |  6 +-----
 include/linux/of_platform.h                     |  7 +------
 25 files changed, 25 insertions(+), 100 deletions(-)

diff --git a/drivers/of/Kconfig b/drivers/of/Kconfig
index c2b6c11d29d1..572942c3cb15 100644
--- a/drivers/of/Kconfig
+++ b/drivers/of/Kconfig
@@ -1,3 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0
 config DTC
 	bool
 
diff --git a/drivers/of/address.c b/drivers/of/address.c
index 8591afbdfe99..b48b68c4a7a9 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -1,4 +1,4 @@
-
+// SPDX-License-Identifier: GPL-2.0
 #define pr_fmt(fmt)	"OF: " fmt
 
 #include <linux/device.h>
diff --git a/drivers/of/base.c b/drivers/of/base.c
index 26618ba8f92a..dd0b4201f1cc 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * Procedures for creating, accessing and interpreting the device tree.
  *
@@ -11,11 +12,6 @@
  *
  *  Reconsolidated from arch/x/kernel/prom.c by Stephen Rothwell and
  *  Grant Likely.
- *
- *      This program is free software; you can redistribute it and/or
- *      modify it under the terms of the GNU General Public License
- *      as published by the Free Software Foundation; either version
- *      2 of the License, or (at your option) any later version.
  */
 
 #define pr_fmt(fmt)	"OF: " fmt
diff --git a/drivers/of/device.c b/drivers/of/device.c
index 25bddf9c9fe1..064c818105bd 100644
--- a/drivers/of/device.c
+++ b/drivers/of/device.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 #include <linux/string.h>
 #include <linux/kernel.h>
 #include <linux/of.h>
diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
index ab988d88704d..7bb33d22b4e2 100644
--- a/drivers/of/dynamic.c
+++ b/drivers/of/dynamic.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Support for dynamic device trees.
  *
diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 4675e5ac4d11..7db5353a24c0 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -1,12 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Functions for working with the Flattened Device Tree data format
  *
  * Copyright 2009 Benjamin Herrenschmidt, IBM Corp
  * benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License
- * version 2 as published by the Free Software Foundation.
  */
 
 #define pr_fmt(fmt)	"OF: fdt: " fmt
diff --git a/drivers/of/fdt_address.c b/drivers/of/fdt_address.c
index 843a542dac7d..1dc15ab78b10 100644
--- a/drivers/of/fdt_address.c
+++ b/drivers/of/fdt_address.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * FDT Address translation based on u-boot fdt_support.c which in turn was
  * based on the kernel unflattened DT address translation code.
@@ -6,11 +7,6 @@
  * Gerald Van Baren, Custom IDEAS, vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org
  *
  * Copyright 2010-2011 Freescale Semiconductor, Inc.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2, or (at your option)
- * any later version.
  */
 
 #define pr_fmt(fmt)	"OF: fdt: " fmt
diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index 7dcea86e052c..02ad93a304a4 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  *  Derived from arch/i386/kernel/irq.c
  *    Copyright (C) 1992 Linus Torvalds
@@ -8,11 +9,6 @@
  *  Adapted for Power Macintosh by Paul Mackerras
  *    Copyright (C) 1996 Paul Mackerras (paulus-mVUT9YNL7HhWG/WdbR7gnQ@public.gmane.org)
  *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License
- * as published by the Free Software Foundation; either version
- * 2 of the License, or (at your option) any later version.
- *
  * This file contains the code used to make IRQ descriptions in the
  * device tree to actual irq numbers on an interrupt controller
  * driver.
diff --git a/drivers/of/kobj.c b/drivers/of/kobj.c
index 250fc7bb550f..7a0a18980b98 100644
--- a/drivers/of/kobj.c
+++ b/drivers/of/kobj.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 #include <linux/of.h>
 #include <linux/slab.h>
 
@@ -161,4 +162,3 @@ void __of_detach_node_sysfs(struct device_node *np)
 	/* finally remove the kobj_init ref */
 	of_node_put(np);
 }
-
diff --git a/drivers/of/of_numa.c b/drivers/of/of_numa.c
index 2db1f7a04baf..f9d5480a4ae5 100644
--- a/drivers/of/of_numa.c
+++ b/drivers/of/of_numa.c
@@ -1,19 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * OF NUMA Parsing support.
  *
  * Copyright (C) 2015 - 2016 Cavium Inc.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
 #define pr_fmt(fmt) "OF: NUMA: " fmt
diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
index 92a9a3687446..0c609e7d0334 100644
--- a/drivers/of/of_private.h
+++ b/drivers/of/of_private.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
 #ifndef _LINUX_OF_PRIVATE_H
 #define _LINUX_OF_PRIVATE_H
 /*
@@ -5,11 +6,6 @@
  *
  * Paul Mackerras	August 1996.
  * Copyright (C) 1996-2005 Paul Mackerras.
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License
- * as published by the Free Software Foundation; either version
- * 2 of the License, or (at your option) any later version.
  */
 
 /**
diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 22b75c82e377..9a4f4246231d 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * Device tree based initialization code for reserved memory.
  *
@@ -6,11 +7,6 @@
  *		http://www.samsung.com
  * Author: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
  * Author: Josh Cartwright <joshc-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License as
- * published by the Free Software Foundation; either version 2 of the
- * License or (at your optional) any later version of the license.
  */
 
 #define pr_fmt(fmt)	"OF: reserved mem: " fmt
diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
index 3981b7da4fa9..3397d7642958 100644
--- a/drivers/of/overlay.c
+++ b/drivers/of/overlay.c
@@ -1,12 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Functions for working with device tree overlays
  *
  * Copyright (C) 2012 Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
  * Copyright (C) 2012 Texas Instruments Inc.
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License
- * version 2 as published by the Free Software Foundation.
  */
 
 #define pr_fmt(fmt)	"OF: overlay: " fmt
diff --git a/drivers/of/pdt.c b/drivers/of/pdt.c
index d2acae825af9..013e65de074a 100644
--- a/drivers/of/pdt.c
+++ b/drivers/of/pdt.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /* pdt.c: OF PROM device tree support code.
  *
  * Paul Mackerras	August 1996.
@@ -8,11 +9,6 @@
  *
  *  Adapted for sparc by David S. Miller davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org
  *  Adapted for multiple architectures by Andres Salomon <dilinger-pFFUokh25LWsTnJN9+BGXg@public.gmane.org>
- *
- *      This program is free software; you can redistribute it and/or
- *      modify it under the terms of the GNU General Public License
- *      as published by the Free Software Foundation; either version
- *      2 of the License, or (at your option) any later version.
  */
 
 #include <linux/kernel.h>
diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index b7cf84b29737..d67dbdab40d1 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -1,15 +1,10 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  *    Copyright (C) 2006 Benjamin Herrenschmidt, IBM Corp.
  *			 <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
  *    and		 Arnd Bergmann, IBM Corp.
  *    Merged from powerpc/kernel/of_platform.c and
  *    sparc{,64}/kernel/of_device.c by Stephen Rothwell
- *
- *  This program is free software; you can redistribute it and/or
- *  modify it under the terms of the GNU General Public License
- *  as published by the Free Software Foundation; either version
- *  2 of the License, or (at your option) any later version.
- *
  */
 
 #define pr_fmt(fmt)	"OF: " fmt
diff --git a/drivers/of/property.c b/drivers/of/property.c
index 8ad33a44a7b8..2b22560b60c1 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * drivers/of/property.c - Procedures for accessing and interpreting
  *			   Devicetree properties and graphs.
@@ -16,11 +17,6 @@
  *
  *  Reconsolidated from arch/x/kernel/prom.c by Stephen Rothwell and
  *  Grant Likely.
- *
- *      This program is free software; you can redistribute it and/or
- *      modify it under the terms of the GNU General Public License
- *      as published by the Free Software Foundation; either version
- *      2 of the License, or (at your option) any later version.
  */
 
 #define pr_fmt(fmt)	"OF: " fmt
diff --git a/drivers/of/resolver.c b/drivers/of/resolver.c
index cfaeef5f6cb1..740d19bde601 100644
--- a/drivers/of/resolver.c
+++ b/drivers/of/resolver.c
@@ -1,12 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Functions for dealing with DT resolution
  *
  * Copyright (C) 2012 Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
  * Copyright (C) 2012 Texas Instruments Inc.
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License
- * version 2 as published by the Free Software Foundation.
  */
 
 #define pr_fmt(fmt)	"OF: resolver: " fmt
diff --git a/drivers/of/unittest-data/overlay_bad_symbol.dts b/drivers/of/unittest-data/overlay_bad_symbol.dts
index 09261cb9a67e..135052ee1517 100644
--- a/drivers/of/unittest-data/overlay_bad_symbol.dts
+++ b/drivers/of/unittest-data/overlay_bad_symbol.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /dts-v1/;
 /plugin/;
 
diff --git a/include/linux/of.h b/include/linux/of.h
index d3dea1d1e3a9..d4abee0e8fc4 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
 #ifndef _LINUX_OF_H
 #define _LINUX_OF_H
 /*
@@ -9,11 +10,6 @@
  * Updates for PPC64 by Peter Bergner & David Engebretsen, IBM Corp.
  * Updates for SPARC64 by David S. Miller
  * Derived from PowerPC and Sparc prom.h files by Stephen Rothwell, IBM Corp.
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License
- * as published by the Free Software Foundation; either version
- * 2 of the License, or (at your option) any later version.
  */
 #include <linux/types.h>
 #include <linux/bitops.h>
diff --git a/include/linux/of_dma.h b/include/linux/of_dma.h
index b90d8ec57c1f..fd706cdf255c 100644
--- a/include/linux/of_dma.h
+++ b/include/linux/of_dma.h
@@ -1,13 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * OF helpers for DMA request / controller
  *
  * Based on of_gpio.h
  *
  * Copyright (C) 2012 Texas Instruments Incorporated - http://www.ti.com/
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
  */
 
 #ifndef __LINUX_OF_DMA_H
diff --git a/include/linux/of_fdt.h b/include/linux/of_fdt.h
index 013c5418aeec..1799b0945a6b 100644
--- a/include/linux/of_fdt.h
+++ b/include/linux/of_fdt.h
@@ -1,12 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * Definitions for working with the Flattened Device Tree data format
  *
  * Copyright 2009 Benjamin Herrenschmidt, IBM Corp
  * benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License
- * version 2 as published by the Free Software Foundation.
  */
 
 #ifndef _LINUX_OF_FDT_H
diff --git a/include/linux/of_gpio.h b/include/linux/of_gpio.h
index 1fe205582111..f6af4276fd51 100644
--- a/include/linux/of_gpio.h
+++ b/include/linux/of_gpio.h
@@ -1,14 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
 /*
  * OF helpers for the GPIO API
  *
  * Copyright (c) 2007-2008  MontaVista Software, Inc.
  *
  * Author: Anton Vorontsov <avorontsov-hkdhdckH98+B+jHODAdFcQ@public.gmane.org>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
  */
 
 #ifndef __LINUX_OF_GPIO_H
diff --git a/include/linux/of_graph.h b/include/linux/of_graph.h
index 3e058f05ab04..01038a6aade0 100644
--- a/include/linux/of_graph.h
+++ b/include/linux/of_graph.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * OF graph binding parsing helpers
  *
@@ -6,10 +7,6 @@
  *
  * Copyright (C) 2012 Renesas Electronics Corp.
  * Author: Guennadi Liakhovetski <g.liakhovetski-Mmb7MZpHnFY@public.gmane.org>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of version 2 of the GNU General Public License as
- * published by the Free Software Foundation.
  */
 #ifndef __LINUX_OF_GRAPH_H
 #define __LINUX_OF_GRAPH_H
diff --git a/include/linux/of_pdt.h b/include/linux/of_pdt.h
index 7e09244bb679..d0b183ab65c6 100644
--- a/include/linux/of_pdt.h
+++ b/include/linux/of_pdt.h
@@ -1,13 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
 /*
  * Definitions for building a device tree by calling into the
  * Open Firmware PROM.
  *
  * Copyright (C) 2010  Andres Salomon <dilinger-pFFUokh25LWsTnJN9+BGXg@public.gmane.org>
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License
- * as published by the Free Software Foundation; either version
- * 2 of the License, or (at your option) any later version.
  */
 
 #ifndef _LINUX_OF_PDT_H
diff --git a/include/linux/of_platform.h b/include/linux/of_platform.h
index fb908e598348..84a966623e78 100644
--- a/include/linux/of_platform.h
+++ b/include/linux/of_platform.h
@@ -1,14 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
 #ifndef _LINUX_OF_PLATFORM_H
 #define _LINUX_OF_PLATFORM_H
 /*
  *    Copyright (C) 2006 Benjamin Herrenschmidt, IBM Corp.
  *			 <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
- *
- *  This program is free software; you can redistribute it and/or
- *  modify it under the terms of the GNU General Public License
- *  as published by the Free Software Foundation; either version
- *  2 of the License, or (at your option) any later version.
- *
  */
 
 #include <linux/device.h>
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
