From: Florian Vaussard <florian.vaussard-p8DiymsW2f8@public.gmane.org>
Subject: [PATCH] of: add missing major vendors
Date: Fri,  7 Mar 2014 13:38:37 +0100
Message-ID: <1394195917-25166-1-git-send-email-florian.vaussard@epfl.ch>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Looking at the current vendor strings used in the kernel's .dts/.dtsi
files, some vendors are used a high number of times without
being documented. Document the ones that are used more than 10 times.

Note: a few inconsistencies were found, and thus not documented.
Here is the list:
- mrvl: duplicates "marvell"
- st-ericsson: duplicates "ste" _and_ "stericsson"
- pci8086: seems to be a unfortunate alias for "intel"
- pnpPNP: used on PowerPC?

Signed-off-by: Florian Vaussard <florian.vaussard-p8DiymsW2f8@public.gmane.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 40ce2df..b5e7485 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -3,6 +3,7 @@ Device tree binding vendor prefix registry.  Keep list in alphabetical order.
 This isn't an exhaustive list, but you should add new prefixes to it before
 using them to avoid name-space collisions.
 
+abilis	Abilis Systems
 active-semi	Active-Semi International Inc
 ad	Avionic Design GmbH
 adi	Analog Devices, Inc.
@@ -11,14 +12,17 @@ ak	Asahi Kasei Corp.
 allwinner	Allwinner Technology Co., Ltd.
 altr	Altera Corp.
 amcc	Applied Micro Circuits Corporation (APM, formally AMCC)
+amd	Advanced Micro Devices (AMD), Inc.
 amstaos	AMS-Taos Inc.
 apm	Applied Micro Circuits Corporation (APM)
 arm	ARM Ltd.
+armadeus	ARMadeus Systems SARL
 atmel	Atmel Corporation
 auo	AU Optronics Corporation
 avago	Avago Technologies
 bosch	Bosch Sensortec GmbH
 brcm	Broadcom Corporation
+calxeda	Calxeda
 capella	Capella Microsystems, Inc
 cavium	Cavium, Inc.
 cdns	Cadence Design Systems Inc.
@@ -26,8 +30,10 @@ chrp	Common Hardware Reference Platform
 chunghwa	Chunghwa Picture Tubes Ltd.
 cirrus	Cirrus Logic, Inc.
 cortina	Cortina Systems, Inc.
+crystalfontz	Crystalfontz America, Inc.
 dallas	Maxim Integrated Products (formerly Dallas Semiconductor)
 davicom	DAVICOM Semiconductor, Inc.
+dlink	D-Link Systems, Inc.
 denx	Denx Software Engineering
 edt	Emerging Display Technologies
 emmicro	EM Microelectronic
@@ -37,7 +43,9 @@ est	ESTeem Wireless Modems
 fsl	Freescale Semiconductor
 GEFanuc	GE Fanuc Intelligent Platforms Embedded Systems, Inc.
 gef	GE Fanuc Intelligent Platforms Embedded Systems, Inc.
+globalscale	Globalscale Technologies, Inc.
 gmt	Global Mixed-mode Technology, Inc.
+google	Google, Inc.
 gumstix	Gumstix, Inc.
 haoyu	Haoyu Microelectronic Co. Ltd.
 hisilicon	Hisilicon Limited.
@@ -46,9 +54,12 @@ hp	Hewlett Packard
 ibm	International Business Machines (IBM)
 idt	Integrated Device Technologies, Inc.
 img	Imagination Technologies Ltd.
+intel	Intel Corporation
 intercontrol	Inter Control Group
 isl	Intersil
 karo	Ka-Ro electronics GmbH
+lacie	LaCie
+lantiq	Lantiq Semiconductor
 lg	LG Corporation
 linux	Linux-specific binding
 lsi	LSI Corp. (LSI Logic)
@@ -56,12 +67,16 @@ marvell	Marvell Technology Group Ltd.
 maxim	Maxim Integrated Products
 microchip	Microchip Technology Inc.
 mosaixtech	Mosaix Technologies, Inc.
+moxa	Moxa
 national	National Semiconductor
 neonode		Neonode Inc.
+netgear	NETGEAR
 nintendo	Nintendo
+nokia	Nokia
 nvidia	NVIDIA
 nxp	NXP Semiconductors
 onnn	ON Semiconductor Corp.
+opencores	OpenCores.org
 panasonic	Panasonic Corporation
 phytec	PHYTEC Messtechnik GmbH
 picochip	Picochip Ltd
@@ -94,4 +109,5 @@ via	VIA Technologies, Inc.
 winbond Winbond Electronics corp.
 wlf	Wolfson Microelectronics
 wm	Wondermedia Technologies, Inc.
+xes	Extreme Engineering Solutions (X-ES)
 xlnx	Xilinx
-- 
1.8.5.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
