From: Amelie Delaunay <amelie.delaunay@st.com>
Subject: [PATCH v4 1/2] dt-bindings: usb: ehci: add optional external vbus
 supply property
Date: Thu, 1 Mar 2018 10:51:38 +0100
Message-ID: <1519897899-8577-2-git-send-email-amelie.delaunay@st.com>
References: <1519897899-8577-1-git-send-email-amelie.delaunay@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1519897899-8577-1-git-send-email-amelie.delaunay@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Tony Prisk <linux@prisktech.co.nz>, Alan Stern <stern@rowland.harvard.edu>, Roger
 Quadros <rogerq@ti.com>, Felipe Balbi <felipe.balbi@linux.intel.com>, Robin Murphy <robin.murphy@arm.com>
Cc: devicetree@vger.kernel.org, Amelie Delaunay <amelie.delaunay@st.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On some boards, especially when vbus supply requires large current,
and the charge pump on the PHY isn't enough, an external vbus power switch
per port may be used.
Add portN_vbus-supply property to usb-ehci bindings. As the number of ports
depends on the ehci controller, and the port on which an external vbus
supply depends on the platform, <portN> is used to make it generic.

Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
---
 Documentation/devicetree/bindings/usb/usb-ehci.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/usb-ehci.txt b/Documentation/devicetree/bindings/usb/usb-ehci.txt
index 3efde12..cd576db 100644
--- a/Documentation/devicetree/bindings/usb/usb-ehci.txt
+++ b/Documentation/devicetree/bindings/usb/usb-ehci.txt
@@ -19,6 +19,7 @@ Optional properties:
  - phys : phandle + phy specifier pair
  - phy-names : "usb"
  - resets : phandle + reset specifier pair
+ - portN_vbus-supply : phandle of regulator supplying vbus for port N
 
 Example (Sequoia 440EPx):
     ehci@e0000300 {
-- 
2.7.4
