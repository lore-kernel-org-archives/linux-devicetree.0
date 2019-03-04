From: Bruno Thomsen <bruno.thomsen@gmail.com>
Subject: [PATCH 1/6] dt-bindings: add vendor prefix for TQ Systems GmbH
Date: Mon,  4 Mar 2019 17:56:25 +0100
Message-ID: <20190304165630.18225-2-bruno.thomsen@gmail.com>
References: <20190304165630.18225-1-bruno.thomsen@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190304165630.18225-1-bruno.thomsen@gmail.com>
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
Cc: devicetree@vger.kernel.org, bruno.thomsen@gmail.com, robh+dt@kernel.org, linux-imx@nxp.com, shawnguo@kernel.org, markus.niebel@tq-group.com
List-Id: devicetree@vger.kernel.org

TQ is a German embedded System-on-Module manufacture.

Signed-off-by: Bruno Thomsen <bruno.thomsen@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 389508584f48..bf6f9c80c627 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -403,6 +403,7 @@ toumaz	Toumaz
 tpk	TPK U.S.A. LLC
 tplink	TP-LINK Technologies Co., Ltd.
 tpo	TPO
+tq	TQ Systems GmbH
 tronfy	Tronfy
 tronsmart	Tronsmart
 truly	Truly Semiconductors Limited
-- 
2.20.1
