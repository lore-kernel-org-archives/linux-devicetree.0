From: Antony Pavlov <antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC v3 05/14] MIPS: dts: qca: ar9132_tl_wr1043nd_v1.dts: drop unused alias node
Date: Sat, 23 Jan 2016 23:17:22 +0300
Message-ID: <1453580251-2341-6-git-send-email-antonynpavlov@gmail.com>
References: <1453580251-2341-1-git-send-email-antonynpavlov@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1453580251-2341-1-git-send-email-antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
Cc: Antony Pavlov <antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alban Bedel <albeu-GANU6spQydw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The TP-LINK TL-WR1043ND board has only one serial port,
so replacing the default of 0 with 0 does nothing useful.

Moreover, the correct name for aliases node is "aliases" not "alias".

An overview of the "aliases" node usage can be found
on the device tree usage page at devicetree.org [1].

Also please see chapter 3.3 ("Aliases node") of the ePAPR 1.1 [2].

[1] http://devicetree.org/Device_Tree_Usage#aliases_Node
[2] https://www.power.org/documentation/epapr-version-1-1/

Signed-off-by: Antony Pavlov <antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alban Bedel <albeu-GANU6spQydw@public.gmane.org>
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
---
 arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dts | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dts b/arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dts
index 53057ca..9618105 100644
--- a/arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dts
+++ b/arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dts
@@ -9,10 +9,6 @@
 	compatible = "tplink,tl-wr1043nd-v1", "qca,ar9132";
 	model = "TP-Link TL-WR1043ND Version 1";
 
-	alias {
-		serial0 = "/ahb/apb/uart@18020000";
-	};
-
 	memory@0 {
 		device_type = "memory";
 		reg = <0x0 0x2000000>;
-- 
2.6.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
