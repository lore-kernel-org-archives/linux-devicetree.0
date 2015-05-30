From: Alban Bedel <albeu-GANU6spQydw@public.gmane.org>
Subject: [PATCH v4 01/12] devicetree: Add bindings for the SoC of the ATH79 family
Date: Sun, 31 May 2015 01:52:24 +0200
Message-ID: <1433029955-7346-2-git-send-email-albeu@free.fr>
References: <1433029955-7346-1-git-send-email-albeu@free.fr>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1433029955-7346-1-git-send-email-albeu-GANU6spQydw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Alban Bedel <albeu-GANU6spQydw@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Qais Yousef <qais.yousef-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Gabor Juhos <juhosg-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Alban Bedel <albeu-GANU6spQydw@public.gmane.org>
---
 .../devicetree/bindings/mips/ath79-soc.txt          | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mips/ath79-soc.txt

diff --git a/Documentation/devicetree/bindings/mips/ath79-soc.txt b/Documentation/devicetree/bindings/mips/ath79-soc.txt
new file mode 100644
index 0000000..88a12a4
--- /dev/null
+++ b/Documentation/devicetree/bindings/mips/ath79-soc.txt
@@ -0,0 +1,21 @@
+Binding for Qualcomm Atheros AR7xxx/AR9XXX SoC
+
+Each device tree must specify a compatible value for the AR SoC
+it uses in the compatible property of the root node. The compatible
+value must be one of the following values:
+
+- qca,ar7130
+- qca,ar7141
+- qca,ar7161
+- qca,ar7240
+- qca,ar7241
+- qca,ar7242
+- qca,ar9130
+- qca,ar9132
+- qca,ar9330
+- qca,ar9331
+- qca,ar9341
+- qca,ar9342
+- qca,ar9344
+- qca,qca9556
+- qca,qca9558
-- 
2.0.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
