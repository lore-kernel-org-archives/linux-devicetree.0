From: Jassi Brar <jaswinder.singh@linaro.org>
Subject: [PATCHv7 3/5] Mailbox: Generic: Specify mailbox api bindings
Date: Thu, 12 Jun 2014 22:31:54 +0530
Message-ID: <1402592514-7281-1-git-send-email-jaswinder.singh@linaro.org>
References: <1402592317-7043-1-git-send-email-jaswinder.singh@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1402592317-7043-1-git-send-email-jaswinder.singh@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org, mporter@linaro.org, patches@linaro.org, bjorn@kryo.se, ashwin.chaugule@linaro.org, gregkh@linuxfoundation.org, s-anna@ti.com, loic.pallardy@st.com, lftan.linux@gmail.com, slapdau@yahoo.com.au, courtney.cavin@sonymobile.com, pawel.moll@arm.com, robh+dt@kernel.org, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, arnd@arndb.de, joshc@codeaurora.org, linus.walleij@linaro.org, galak@codeaurora.org, ks.giri@samsung.com, Jassi Brar <jaswinder.singh@linaro.org>
List-Id: devicetree@vger.kernel.org

 Due to the platform specific nature of remote's firmware, we can't do much
to facilitate shareable client drivers. So the Mailbox api is more like a
bunch of useful functions put together. The only feature that can be
abstracted out is mailbox channel assignment to client drivers, which this
binding specifies.

Signed-off-by: Jassi Brar <jaswinder.singh@linaro.org>
---
 .../devicetree/bindings/mailbox/mailbox.txt        | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/mailbox.txt

diff --git a/Documentation/devicetree/bindings/mailbox/mailbox.txt b/Documentation/devicetree/bindings/mailbox/mailbox.txt
new file mode 100644
index 0000000..3f00955
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/mailbox.txt
@@ -0,0 +1,33 @@
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
+- mbox: List of phandle and mailbox channel specifier.
+
+- mbox-names: List of identifier strings for each mailbox channel
+		required by the client.
+
+Example:
+	pwr_cntrl: power {
+		...
+		mbox-names = "pwr-ctrl", "rpc";
+		mbox = <&mailbox 0
+			&mailbox 1>;
+	};
-- 
1.8.1.2
