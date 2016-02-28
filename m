From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH] of_mdio: fix kernel-doc for of_phy_connect()
Date: Sun, 28 Feb 2016 22:50:59 +0300
Message-ID: <5235224.0MKSCt7puR@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: grant.likely@linaro.org, robh+dt@kernel.org, devicetree@vger.kernel.org, f.fainelli@gmail.com, netdev@vger.kernel.org, frowand.list@gmail.com
List-Id: devicetree@vger.kernel.org

The 'flags' parameter of the of_phy_connect() function wasn't described
in  the kernel-doc comment...

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
The patch is against DaveM's 'net.git' repo.

 drivers/of/of_mdio.c |    1 +
 1 file changed, 1 insertion(+)

Index: net/drivers/of/of_mdio.c
===================================================================
--- net.orig/drivers/of/of_mdio.c
+++ net/drivers/of/of_mdio.c
@@ -305,6 +305,7 @@ EXPORT_SYMBOL(of_phy_find_device);
  * @dev: pointer to net_device claiming the phy
  * @phy_np: Pointer to device tree node for the PHY
  * @hndlr: Link state callback for the network device
+ * @flags: flags to pass to the PHY
  * @iface: PHY data interface type
  *
  * If successful, returns a pointer to the phy_device with the embedded
