From: Li Jun <jun.li@nxp.com>
Subject: [PATCH 2/4] doc: usb: ci-hdrc-usb2: add property over-current-polarity
Date: Mon, 18 Jul 2016 19:15:45 +0800
Message-ID: <1468840547-17899-2-git-send-email-jun.li@nxp.com>
References: <1468840547-17899-1-git-send-email-jun.li@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1468840547-17899-1-git-send-email-jun.li@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: peter.chen@nxp.com, robh+dt@kernel.org, shawnguo@kernel.org
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Li Jun <jun.li@nxp.com>
List-Id: devicetree@vger.kernel.org

Adding over-current-polarity to indicate the over current flag
is low active or high active.

Signed-off-by: Li Jun <jun.li@nxp.com>
---
 Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
index 341dc67..c5d35f4 100644
--- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
+++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
@@ -81,6 +81,8 @@ i.mx specific properties
 - fsl,usbmisc: phandler of non-core register device, with one
   argument that indicate usb controller index
 - disable-over-current: disable over current detect
+- over-current-polarity: 0 if the over current signal polarity is low active,
+  1 if the over current signal polarity is high active.
 - external-vbus-divider: enables off-chip resistor divider for Vbus
 
 Example:
-- 
1.9.1
