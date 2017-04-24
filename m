From: Franklin S Cooper Jr <fcooper-l0cyMroinI0@public.gmane.org>
Subject: [PATCH v2 3/4] ARM: keystone: Create new binding for K2G ICE evm
Date: Mon, 24 Apr 2017 15:22:03 -0500
Message-ID: <20170424202204.24170-4-fcooper@ti.com>
References: <20170424202204.24170-1-fcooper@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170424202204.24170-1-fcooper-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Franklin S Cooper Jr <fcooper-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add a new binding for the new K2G Industrial Communication Engine evm.

Signed-off-by: Franklin S Cooper Jr <fcooper-l0cyMroinI0@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 Documentation/devicetree/bindings/arm/keystone/keystone.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/keystone/keystone.txt b/Documentation/devicetree/bindings/arm/keystone/keystone.txt
index 48f6703..f310bad 100644
--- a/Documentation/devicetree/bindings/arm/keystone/keystone.txt
+++ b/Documentation/devicetree/bindings/arm/keystone/keystone.txt
@@ -37,3 +37,6 @@ Boards:
 
 -  K2G EVM
    compatible = "ti,k2g-evm", "ti,k2g", "ti-keystone"
+
+-  K2G Industrial Communication Engine EVM
+   compatible = "ti,k2g-ice", "ti,k2g", "ti-keystone"
-- 
2.10.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
