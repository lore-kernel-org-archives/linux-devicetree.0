From: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCHv9 4/4] dt: mailbox: add generic bindings
Date: Wed, 23 Jul 2014 00:27:36 +0530
Message-ID: <1406055456-29384-1-git-send-email-jaswinder.singh@linaro.org>
References: <1406055250-29159-1-git-send-email-jaswinder.singh@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1406055250-29159-1-git-send-email-jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: ks.giri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, courtney.cavin-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org, mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, slapdau-/E1597aS9LT0CCvOHzKKcA@public.gmane.org, lftan.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, loic.pallardy-qxv4g6HH51o@public.gmane.org, s-anna-l0cyMroinI0@public.gmane.org, ashwin.chaugule-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, bjorn-UYDU3/A3LUY@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, t.takinishi-+CUm20s59erQFUHtdCDX3A@public.gmane.org, broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mollie.wu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, andy.green-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Define generic bindings for the framework clients to
request mailbox channels.

Signed-off-by: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 .../devicetree/bindings/mailbox/mailbox.txt        | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/mailbox.txt

diff --git a/Documentation/devicetree/bindings/mailbox/mailbox.txt b/Documentation/devicetree/bindings/mailbox/mailbox.txt
new file mode 100644
index 0000000..bb79678
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/mailbox.txt
@@ -0,0 +1,36 @@
+* Generic Mailbox Controller and client driver bindings
+
+Generic binding to provide a way for Mailbox controller drivers to
+assign appropriate mailbox channel to client drivers.
+
+* Mailbox Controller
+
+Required property:
+- #mbox-cells: Must be at least 1. Number of cells in a mailbox
+		specifier.
+
+Example:
+	mailbox: mailbox {
+		...
+		#mbox-cells = <1>;
+	};
+
+
+* Mailbox Client
+
+Required property:
+- mboxes: List of phandle and mailbox channel specifiers.
+
+Optional property:
+- mbox-names: List of identifier strings for each mailbox channel
+		required by the client. The use of this property
+		is discouraged in favor of using index in list of
+		'mboxes' while requesting a mailbox.
+
+Example:
+	pwr_cntrl: power {
+		...
+		mbox-names = "pwr-ctrl", "rpc";
+		mboxes = <&mailbox 0
+			&mailbox 1>;
+	};
-- 
1.8.1.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
