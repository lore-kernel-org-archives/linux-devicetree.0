From: Mohit Kumar <mohit.kumar-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH V6 05/12] SPEAr: misc: Add binding information
Date: Tue, 11 Feb 2014 15:00:01 +0530
Message-ID: <bfddafffd103bef179fef717793bf94652742b85.1392109054.git.mohit.kumar@st.com>
References: <cover.1392109054.git.mohit.kumar@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1392109054.git.mohit.kumar-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arnd-r2nGTMty4D4@public.gmane.org
Cc: Pratyush Anand <pratyush.anand-qxv4g6HH51o@public.gmane.org>, Mohit Kumar <mohit.kumar-qxv4g6HH51o@public.gmane.org>, Viresh Kumar <viresh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, spear-devel-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Pratyush Anand <pratyush.anand-qxv4g6HH51o@public.gmane.org>

SPEAr SOCs have some miscellaneous registers which are used to configure
few properties of different peripheral controllers.

Signed-off-by: Pratyush Anand <pratyush.anand-qxv4g6HH51o@public.gmane.org>
Cc: Mohit Kumar <mohit.kumar-qxv4g6HH51o@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Viresh Kumar <viresh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: spear-devel-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
---
 .../devicetree/bindings/arm/spear-misc.txt         |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/spear-misc.txt

diff --git a/Documentation/devicetree/bindings/arm/spear-misc.txt b/Documentation/devicetree/bindings/arm/spear-misc.txt
new file mode 100644
index 0000000..ab324e1
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/spear-misc.txt
@@ -0,0 +1,9 @@
+SPEAr Misc configuration
+===========================
+SPEAr SOCs have some miscellaneous registers which are used to configure
+few properties of different peripheral controllers.
+
+misc node required properties:
+
+- compatible Should be	"st,spear1340-misc", "syscon".
+- reg: Address range of misc space
-- 
1.7.0.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
