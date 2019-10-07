From: marek.bykowski@gmail.com
Subject: [PATCH 2/2] Documentation: Add documentation for CCN-512 DTS binding
Date: Mon,  7 Oct 2019 15:21:15 +0200
Message-ID: <1570454475-2848-2-git-send-email-marek.bykowski@gmail.com>
References: <1570454475-2848-1-git-send-email-marek.bykowski@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1570454475-2848-1-git-send-email-marek.bykowski@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: robh+dt@kernel.org, mark.rutland@arm.com, will@kernel.org, pawel.moll@arm.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Marek Bykowski <marek.bykowski@gmail.com>
List-Id: devicetree@vger.kernel.org

From: Marek Bykowski <marek.bykowski@gmail.com>

Indicate the arm-ccn perf back-end supports now ccn-512.

Signed-off-by: Marek Bykowski <marek.bykowski@gmail.com>
---
 Documentation/devicetree/bindings/perf/arm-ccn.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/perf/arm-ccn.txt b/Documentation/devicetree/bindings/perf/arm-ccn.txt
index 43b5a71a5a9d..1c53b5aa3317 100644
--- a/Documentation/devicetree/bindings/perf/arm-ccn.txt
+++ b/Documentation/devicetree/bindings/perf/arm-ccn.txt
@@ -6,6 +6,7 @@ Required properties:
 	"arm,ccn-502"
 	"arm,ccn-504"
 	"arm,ccn-508"
+	"arm,ccn-512"
 
 - reg: (standard registers property) physical address and size
 	(16MB) of the configuration registers block
-- 
2.21.0.896.g6a6c0f1
