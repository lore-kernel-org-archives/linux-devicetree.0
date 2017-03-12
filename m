From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: [PATCH v2 16/23] MAINTAINERS: Add file patterns for powerpc device tree bindings
Date: Sun, 12 Mar 2017 14:17:00 +0100
Message-ID: <1489324627-19126-17-git-send-email-geert@linux-m68k.org>
References: <1489324627-19126-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1489324627-19126-1-git-send-email-geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Submitters of device tree binding documentation may forget to CC
the subsystem maintainer if this is missing.

Signed-off-by: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>
Cc: Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
Cc: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
---
Please apply this patch directly if you want to be involved in device
tree binding documentation for your subsystem.

v2:
  - Rebased on top of commit a42715830d552d7c ("MAINTAINERS: Remove
    powerpc's "opal" pattern match), which just added "powerpc/opal",
    while obviously the whole "powerpc" hierarchy is of interest.

Impact on next-20170310:

-Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS,commit_signer:11/11=100%)
+Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org> (supporter:LINUX FOR POWERPC (32-BIT AND 64-BIT))
+Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org> (supporter:LINUX FOR POWERPC (32-BIT AND 64-BIT))
+Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org> (supporter:LINUX FOR POWERPC (32-BIT AND 64-BIT))
+Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
 Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
-Scott Wood <oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org> (commit_signer:5/11=45%)
-Zhao Qiang <qiang.zhao-3arQi8VN3Tc@public.gmane.org> (commit_signer:4/11=36%,authored:4/11=36%)
-Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org> (commit_signer:3/11=27%)
-Christian Lamparter <chunkeey-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> (commit_signer:1/11=9%)
-yangbo lu <yangbo.lu-3arQi8VN3Tc@public.gmane.org> (authored:1/11=9%)
-"Otto Kekäläinen" <otto-Gh1NM5ZPXYb1KXRcyAk9cg@public.gmane.org> (authored:1/11=9%)
-Chris Packham <chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org> (authored:1/11=9%)
-York Sun <york.sun-3arQi8VN3Tc@public.gmane.org> (authored:1/11=9%)
+linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org (open list:LINUX FOR POWERPC (32-BIT AND 64-BIT))
 devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
 linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org (open list)
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 896d7238f3f3f4e5..551ab8e4b771bcc2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7494,7 +7494,7 @@ Q:	http://patchwork.ozlabs.org/project/linuxppc-dev/list/
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git
 S:	Supported
 F:	Documentation/ABI/stable/sysfs-firmware-opal-*
-F:	Documentation/devicetree/bindings/powerpc/opal/
+F:	Documentation/devicetree/bindings/powerpc/
 F:	Documentation/devicetree/bindings/rtc/rtc-opal.txt
 F:	Documentation/devicetree/bindings/i2c/i2c-opal.txt
 F:	Documentation/powerpc/
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
