From: Aleksandar Markovic <aleksandar.markovic-FblTVreYubkAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 1/2] dt-bindings: Document mti,mips-cpc binding
Date: Wed, 27 Dec 2017 15:37:51 +0100
Message-ID: <1514385475-23921-2-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1514385475-23921-1-git-send-email-aleksandar.markovic@rt-rk.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1514385475-23921-1-git-send-email-aleksandar.markovic-FblTVreYubkAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
Cc: Paul Burton <paul.burton-8NJIiSa5LzA@public.gmane.org>, Aleksandar Markovic <aleksandar.markovic-8NJIiSa5LzA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Douglas Leung <douglas.leung-8NJIiSa5LzA@public.gmane.org>, Goran Ferenc <goran.ferenc-8NJIiSa5LzA@public.gmane.org>, James Hogan <james.hogan-8NJIiSa5LzA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Miodrag Dinic <miodrag.dinic-8NJIiSa5LzA@public.gmane.org>, Petar Jovanovic <petar.jovanovic-8NJIiSa5LzA@public.gmane.org>, Raghu Gandham <raghu.gandham-8NJIiSa5LzA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Paul Burton <paul.burton-8NJIiSa5LzA@public.gmane.org>

Document a binding for the MIPS Cluster Power Controller (CPC) that
allows the device tree to specify where the CPC registers are located.

Signed-off-by: Paul Burton <paul.burton-8NJIiSa5LzA@public.gmane.org>
Signed-off-by: Aleksandar Markovic <aleksandar.markovic-8NJIiSa5LzA@public.gmane.org>
---
 Documentation/devicetree/bindings/power/mti,mips-cpc.txt | 8 ++++++++
 1 file changed, 8 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/mti,mips-cpc.txt

diff --git a/Documentation/devicetree/bindings/power/mti,mips-cpc.txt b/Documentation/devicetree/bindings/power/mti,mips-cpc.txt
new file mode 100644
index 0000000..c6b8251
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/mti,mips-cpc.txt
@@ -0,0 +1,8 @@
+Binding for MIPS Cluster Power Controller (CPC).
+
+This binding allows a system to specify where the CPC registers are
+located.
+
+Required properties:
+compatible : Should be "mti,mips-cpc".
+regs: Should describe the address & size of the CPC register region.
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
