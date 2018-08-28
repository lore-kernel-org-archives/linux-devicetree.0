From: Rob Herring <robh@kernel.org>
Subject: [PATCH 4/4] vsprintf: print OF node name using full_name
Date: Tue, 28 Aug 2018 10:52:54 -0500
Message-ID: <20180828155254.10709-5-robh@kernel.org>
References: <20180828155254.10709-1-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180828155254.10709-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

In preparation to remove the node name pointer from struct device_node,
convert the node name print to get the node name from the full name.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 lib/vsprintf.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/lib/vsprintf.c b/lib/vsprintf.c
index d5b3a3f95c01..891c282092a0 100644
--- a/lib/vsprintf.c
+++ b/lib/vsprintf.c
@@ -1596,6 +1596,7 @@ char *device_node_string(char *buf, char *end, struct device_node *dn,
 		fmt = "f";
 
 	for (pass = false; strspn(fmt,"fnpPFcC"); fmt++, pass = true) {
+		int precision;
 		if (pass) {
 			if (buf < end)
 				*buf = ':';
@@ -1607,7 +1608,11 @@ char *device_node_string(char *buf, char *end, struct device_node *dn,
 			buf = device_node_gen_full_name(dn, buf, end);
 			break;
 		case 'n':	/* name */
-			buf = string(buf, end, dn->name, str_spec);
+			p = kbasename(of_node_full_name(dn));
+			precision = str_spec.precision;
+			str_spec.precision = strchrnul(p, '@') - p;
+			buf = string(buf, end, p, str_spec);
+			str_spec.precision = precision;
 			break;
 		case 'p':	/* phandle */
 			buf = number(buf, end, (unsigned int)dn->phandle, num_spec);
-- 
2.17.1
