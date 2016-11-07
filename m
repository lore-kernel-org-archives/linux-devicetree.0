From: Robin van der Gracht <robin-/Q/L1SwJa3aEVqv0pETR8A@public.gmane.org>
Subject: [PATCH v7 RESEND 1/3] of: add vendor prefix for Holtek Semiconductor
Date: Mon,  7 Nov 2016 10:56:34 +0100
Message-ID: <1478512596-19242-2-git-send-email-robin@protonic.nl>
References: <1478512596-19242-1-git-send-email-robin@protonic.nl>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1478512596-19242-1-git-send-email-robin-/Q/L1SwJa3aEVqv0pETR8A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Miguel Ojeda Sandonis <miguel.ojeda.sandonis-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Robin van der Gracht <robin-/Q/L1SwJa3aEVqv0pETR8A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch introduces a vendor prefix for Holtek Semiconductor Inc.

Signed-off-by: Robin van der Gracht <robin-/Q/L1SwJa3aEVqv0pETR8A@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index f0a48ea..a955828 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -126,6 +126,7 @@ hitex	Hitex Development Tools
 holt	Holt Integrated Circuits, Inc.
 honeywell	Honeywell
 hp	Hewlett Packard
+holtek	Holtek Semiconductor, Inc.
 i2se	I2SE GmbH
 ibm	International Business Machines (IBM)
 idt	Integrated Device Technologies, Inc.
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
