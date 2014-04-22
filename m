From: Markus Niebel <list-09_linux_arm@tqsc.de>
Subject: [PATCH] DT: Vendor: add prefix for TQ Systems
Date: Tue, 22 Apr 2014 11:01:41 +0200
Message-ID: <1398157301-4179-1-git-send-email-list-09_linux_arm@tqsc.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, Markus Niebel <Markus.Niebel@tq-group.com>
List-Id: devicetree@vger.kernel.org

From: Markus Niebel <Markus.Niebel@tq-group.com>

Add prefix for TQ Systems GmbH and for TQ Components.
Both are needed since the existing PPC device trees use
tqc but the TQMa53 ARM module uses tq. The tq prefix is better
since TQ Components was renamed some time ago.

Signed-off-by: Markus Niebel <Markus.Niebel@tq-group.com>
---
 .../devicetree/bindings/vendor-prefixes.txt        |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 2855004..eb8a863 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -126,6 +126,8 @@ tlm	Trusted Logic Mobility
 toradex	Toradex AG
 toshiba	Toshiba Corporation
 toumaz	Toumaz
+tq	TQ Systems GmbH
+tqc	TQ Components (deprecated, use tq)
 usi	Universal Scientifc Industrial Co., Ltd.
 v3	V3 Semiconductor
 via	VIA Technologies, Inc.
-- 
1.7.9.5
