From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 3/3] dt-bindings: amlogic: Add WeTek boards
Date: Wed, 18 Jan 2017 11:50:42 +0100
Message-ID: <1484736642-5451-4-git-send-email-narmstrong@baylibre.com>
References: <1484736642-5451-1-git-send-email-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1484736642-5451-1-git-send-email-narmstrong@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: khilman@baylibre.com, carlo@caione.org
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 Documentation/devicetree/bindings/arm/amlogic.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.txt b/Documentation/devicetree/bindings/arm/amlogic.txt
index 9b2b41a..c246cd2 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.txt
+++ b/Documentation/devicetree/bindings/arm/amlogic.txt
@@ -40,6 +40,8 @@ Board compatible values:
   - "hardkernel,odroid-c2" (Meson gxbb)
   - "amlogic,p200" (Meson gxbb)
   - "amlogic,p201" (Meson gxbb)
+  - "wetek,hub" (Meson gxbb)
+  - "wetek,play2" (Meson gxbb)
   - "amlogic,p212" (Meson gxl s905x)
   - "amlogic,p230" (Meson gxl s905d)
   - "amlogic,p231" (Meson gxl s905d)
-- 
1.9.1
