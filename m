From: Laszlo Ersek <lersek-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v5 1/2] devicetree: document the "qemu" and "virtio" vendor prefixes
Date: Wed,  7 Jan 2015 18:42:53 +0100
Message-ID: <1420652574-5897-2-git-send-email-lersek@redhat.com>
References: <1420652574-5897-1-git-send-email-lersek@redhat.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1420652574-5897-1-git-send-email-lersek-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, peter.maydell-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, drjones-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, pbonzini-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, agraf-l3A5Bk7waGM@public.gmane.org, lersek-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The QEMU open source machine emulator and virtualizer presents firmware
and operating systems running in virtual machines ("guests") with purely
virtual hardware (ie. hardware that has never existed in physical form).
Since QEMU exposes some of these devices in a DTB, it makes sense to
define "qemu" and "virtio" as vendor prefixes.

The qemu definition is from [1], revision 4451 (22:24, 25 November 2014).

The virtio definition is composed from [2] and [3].

[1] http://wiki.qemu.org/Main_Page
[2] http://docs.oasis-open.org/virtio/virtio/v1.0/csprd01/virtio-v1.0-csprd01.html
[3] http://en.wikipedia.org/wiki/OASIS_%28organization%29

Suggested-by: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Suggested-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Signed-off-by: Laszlo Ersek <lersek-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
---

Notes:
    v5:
    - no changes
    
    v4:
    - no changes
    
    v3:
    - no changes
    
    v2:
    - new in v2 [Mark Rutland, Arnd Bergmann]

 Documentation/devicetree/bindings/vendor-prefixes.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index b1df0ad..4a7604f 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -127,6 +127,7 @@ pixcir  PIXCIR MICROELECTRONICS Co., Ltd
 powervr	PowerVR (deprecated, use img)
 qca	Qualcomm Atheros, Inc.
 qcom	Qualcomm Technologies, Inc
+qemu	QEMU, a generic and open source machine emulator and virtualizer
 qnap	QNAP Systems, Inc.
 radxa	Radxa
 raidsonic	RaidSonic Technology GmbH
@@ -168,6 +169,7 @@ usi	Universal Scientific Industrial Co., Ltd.
 v3	V3 Semiconductor
 variscite	Variscite Ltd.
 via	VIA Technologies, Inc.
+virtio	Virtual I/O Device Specification, developed by the OASIS consortium
 voipac	Voipac Technologies s.r.o.
 winbond Winbond Electronics corp.
 wlf	Wolfson Microelectronics
-- 
1.8.3.1


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
