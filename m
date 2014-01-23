From: Mohit Kumar <mohit.kumar-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH V2 1/8] SPEAr13xx: Set dt field entry <stmmac,phy-addr> for phy probe
Date: Thu, 23 Jan 2014 16:02:41 +0530
Message-ID: <12754927160d11063aad96c011c4807cb0aa1775.1390471111.git.mohit.kumar@st.com>
References: <cover.1390471111.git.mohit.kumar@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1390471111.git.mohit.kumar-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Mohit Kumar <mohit.kumar-qxv4g6HH51o@public.gmane.org>, Pratyush Anand <pratyush.anand-qxv4g6HH51o@public.gmane.org>, Viresh Kumar <viresh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, spear-devel-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

DT field name for the phy address changed since kernel 3.10. Set the
snps,phy-addr to 0xffffffff so that the driver probes for the phy.

Signed-off-by: Mohit Kumar <mohit.kumar-qxv4g6HH51o@public.gmane.org>
Cc: Pratyush Anand <pratyush.anand-qxv4g6HH51o@public.gmane.org>
Cc: Viresh Kumar <viresh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: spear-devel-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
---
 arch/arm/boot/dts/spear13xx.dtsi |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/spear13xx.dtsi b/arch/arm/boot/dts/spear13xx.dtsi
index 4382547..3518803 100644
--- a/arch/arm/boot/dts/spear13xx.dtsi
+++ b/arch/arm/boot/dts/spear13xx.dtsi
@@ -155,6 +155,7 @@
 
 		gmac0: eth@e2000000 {
 			compatible = "st,spear600-gmac";
+			snps,phy-addr = <0xffffffff>;
 			reg = <0xe2000000 0x8000>;
 			interrupts = <0 33 0x4
 				      0 34 0x4>;
-- 
1.7.0.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
