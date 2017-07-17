From: Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v2 RESEND] dt-bindings: chosen: document kaslr-seed property
Date: Mon, 17 Jul 2017 15:05:11 -0700
Message-ID: <20170717220511.GA140556@beast>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, AKASHI Takahiro <takahiro.akashi-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>, James Morse <james.morse-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Document the /chosen/kaslr-seed property (and its interaction with the
EFI_RNG_PROTOCOL API). Thanks to Ard for clarifications.

Signed-off-by: Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Acked-by: Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Acked-by: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Acked-by: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
---
v2:
- improved the language a bit based on Ard's notes
- added Acks.
- (resent to include lists)
---
 Documentation/devicetree/bindings/chosen.txt | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/chosen.txt b/Documentation/devicetree/bindings/chosen.txt
index dee3f5d9df26..e3b13ea7d2ae 100644
--- a/Documentation/devicetree/bindings/chosen.txt
+++ b/Documentation/devicetree/bindings/chosen.txt
@@ -5,9 +5,31 @@ The chosen node does not represent a real device, but serves as a place
 for passing data between firmware and the operating system, like boot
 arguments. Data in the chosen node does not represent the hardware.
 
+The following properties are recognized:
 
-stdout-path property
---------------------
+
+kaslr-seed
+-----------
+
+This property is used when booting with CONFIG_RANDOMIZE_BASE as the
+entropy used to randomize the kernel image base address location. Since
+it is used directly, this value is intended only for KASLR, and should
+not be used for other purposes (as it may leak information about KASLR
+offsets). It is parsed as a u64 value, e.g.
+
+/ {
+	chosen {
+		kaslr-seed = <0xfeedbeef 0xc0def00d>;
+	};
+};
+
+Note that if this property is set from UEFI (or a bootloader in EFI
+mode) when EFI_RNG_PROTOCOL is supported, it will be overwritten by
+the Linux EFI stub (which will populate the property itself, using
+EFI_RNG_PROTOCOL).
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
