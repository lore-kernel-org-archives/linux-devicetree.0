From: Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH] Documentation: dt: chosen property for kaslr-seed
Date: Fri, 14 Jul 2017 17:38:36 -0700
Message-ID: <20170715003836.GA113132@beast>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Matt Redfearn <matt.redfearn-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Document then /chosen/kaslr-seed property (and its interaction with the
EFI_RNG_PROTOCOL API).

Signed-off-by: Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
 Documentation/devicetree/bindings/chosen.txt | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/chosen.txt b/Documentation/devicetree/bindings/chosen.txt
index dee3f5d9df26..0cdb43b268e5 100644
--- a/Documentation/devicetree/bindings/chosen.txt
+++ b/Documentation/devicetree/bindings/chosen.txt
@@ -5,9 +5,27 @@ The chosen node does not represent a real device, but serves as a place
 for passing data between firmware and the operating system, like boot
 arguments. Data in the chosen node does not represent the hardware.
 
+The following properties are recognized:
 
-stdout-path property
---------------------
+
+kaslr-seed
+-----------
+
+This property is used when booting with CONFIG_RANDOMIZE_BASE to seed
+the entropy used to randomize the kernel image base address location. It
+is parsed as a u64 value, e.g.
+
+/ {
+	chosen {
+		kaslr-seed = <0xfeedbeef 0xc0def00d>;
+	};
+};
+
+Note that when booting through EFI when EFI_RNG_PROTOCOL is supported,
+this value will be overwritten by the EFI stub.
+
+stdout-path
+-----------
 
 Device trees may specify the device to be used for boot console output
 with a stdout-path property under /chosen, as described in the Devicetree
-- 
2.7.4


-- 
Kees Cook
Pixel Security
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
