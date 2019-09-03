From: Jianxin Pan <jianxin.pan@amlogic.com>
Subject: [PATCH 3/4] dt-bindings: arm: amlogic: add Amlogic AD401 bindings
Date: Tue, 3 Sep 2019 02:51:14 -0400
Message-ID: <1567493475-75451-4-git-send-email-jianxin.pan@amlogic.com>
References: <1567493475-75451-1-git-send-email-jianxin.pan@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1567493475-75451-1-git-send-email-jianxin.pan@amlogic.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org
Cc: devicetree@vger.kernel.org, Hanjie Lin <hanjie.lin@amlogic.com>, Victor Wan <victor.wan@amlogic.com>, Jianxin Pan <jianxin.pan@amlogic.com>, Neil Armstrong <narmstrong@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-kernel@vger.kernel.org, Qiufang Dai <qiufang.dai@amlogic.com>, Rob Herring <robh+dt@kernel.org>, Jian Hu <jian.hu@amlogic.com>, Xingyu Chen <xingyu.chen@amlogic.com>, Carlo Caione <carlo@caione.org>, Tao Zeng <tao.zeng@amlogic.com>, linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
List-Id: devicetree@vger.kernel.org

Add the compatible for the Amlogic A1 Based AD401 board.

Signed-off-by: Jianxin Pan <jianxin.pan@amlogic.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index aa07b76..dc4abce 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -158,5 +158,7 @@ properties:
 
       - description: Boards with the Amlogic Meson A1 A113L SoC
         items:
+          - enum:
+              - amlogic,ad401
           - const: amlogic,a1
 ...
-- 
2.7.4
