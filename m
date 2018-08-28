From: Urja Rannikko <urjaman@gmail.com>
Subject: [PATCH 4/7] dt-bindings: display/rockchip: dw_hdmi: Add property for
 HDMI frequency list
Date: Tue, 28 Aug 2018 18:55:10 +0000
Message-ID: <20180828185513.13216-5-urjaman@gmail.com>
References: <20180828185513.13216-1-urjaman@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180828185513.13216-1-urjaman@gmail.com>
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
Cc: Urja Rannikko <urjaman@gmail.com>, devicetree@vger.kernel.org, heiko@sntech.de
List-Id: devicetree@vger.kernel.org

Signed-off-by: Urja Rannikko <urjaman@gmail.com>
---
 .../devicetree/bindings/display/rockchip/dw_hdmi-rockchip.txt    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/rockchip/dw_hdmi-rockchip.txt b/Documentation/devicetree/bindings/display/rockchip/dw_hdmi-rockchip.txt
index adc94fc3c9f8..edeacbbc4f26 100644
--- a/Documentation/devicetree/bindings/display/rockchip/dw_hdmi-rockchip.txt
+++ b/Documentation/devicetree/bindings/display/rockchip/dw_hdmi-rockchip.txt
@@ -34,6 +34,7 @@ Optional properties
 - clock-names: May contain "cec" as defined in dw_hdmi.txt.
 - clock-names: May contain "grf", power for grf io.
 - clock-names: May contain "vpll", external clock for some hdmi phy.
+- rockchip,hdmi-rates-hz: List of allowed HDMI frequencies in Hz.
 
 Example:
 
-- 
2.18.0
