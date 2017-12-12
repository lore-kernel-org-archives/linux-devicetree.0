From: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Subject: [PATCH v3 2/3] dt-bindings: Add optional nvmem BD address bindings to ti,wlink-st
Date: Tue, 12 Dec 2017 15:59:17 -0600
Message-ID: <1513115958-23761-3-git-send-email-david@lechnology.com>
References: <1513115958-23761-1-git-send-email-david@lechnology.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1513115958-23761-1-git-send-email-david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-bluetooth-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Marcel Holtmann <marcel-kz+m5ild9QBg9hUCZPvPmw@public.gmane.org>, Gustavo Padovan <gustavo-THi1TnShQwVAfugRpC6u6w@public.gmane.org>, Johan Hedberg <johan.hedberg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This adds optional nvmem consumer properties to the ti,wlink-st device tree
bindings to allow specifying the BD address.

Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Signed-off-by: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
---
 Documentation/devicetree/bindings/net/ti,wilink-st.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/ti,wilink-st.txt b/Documentation/devicetree/bindings/net/ti,wilink-st.txt
index 1649c1f..a45a508 100644
--- a/Documentation/devicetree/bindings/net/ti,wilink-st.txt
+++ b/Documentation/devicetree/bindings/net/ti,wilink-st.txt
@@ -32,6 +32,9 @@ Optional properties:
    See ../clocks/clock-bindings.txt for details.
  - clock-names : Must include the following entry:
    "ext_clock" (External clock provided to the TI combo chip).
+ - nvmem-cells: phandle to nvmem data cell that contains a 6 byte BD address
+   with the most significant byte first (big-endian).
+ - nvmem-cell-names: "bd-address" (required when nvmem-cells is specified)
 
 Example:
 
@@ -43,5 +46,7 @@ Example:
 		enable-gpios = <&gpio1 7 GPIO_ACTIVE_HIGH>;
 		clocks = <&clk32k_wl18xx>;
 		clock-names = "ext_clock";
+		nvmem-cells = <&bd_address>;
+		nvmem-cell-names = "bd-address";
 	};
 };
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
