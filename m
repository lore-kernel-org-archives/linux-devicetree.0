From: Icenowy Zheng <icenowy@aosc.xyz>
Subject: [PATCH 1/3] dt-bindings: add vendor prefix for Lichee Pi
Date: Thu, 22 Dec 2016 04:02:33 +0800
Message-ID: <20161221200235.11617-1-icenowy@aosc.xyz>
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
To: Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, Zepan <715805855@qq.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Icenowy Zheng <icenowy@aosc.xyz>
List-Id: devicetree@vger.kernel.org

Lichee Pi is a new "Pi"-named development board series.

Currently available device, Lichee Pi One, is by only one person as
night job, so the device series name is chosen to be the vendor prefix.

Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 16d3b5e7f5d1..4ec84b7a3c56 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -161,6 +161,7 @@ lacie	LaCie
 lantiq	Lantiq Semiconductor
 lenovo	Lenovo Group Ltd.
 lg	LG Corporation
+licheepi	Lichee Pi
 linux	Linux-specific binding
 lltc	Linear Technology Corporation
 lsi	LSI Corp. (LSI Logic)
-- 
2.11.0
