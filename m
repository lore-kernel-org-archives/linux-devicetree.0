From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: [PATCH v8 12/28] PCI: mvebu: Check valid base address before port
 setup
Date: Tue, 23 Jul 2013 10:31:16 -0300
Message-ID: <1374586292-4941-13-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1374586292-4941-1-git-send-email-ezequiel.garcia@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1374586292-4941-1-git-send-email-ezequiel.garcia@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, Arnd Bergmann <arnd@arndb.de>, valentin.longchamp@keymile.com, Grant Likely <grant.likely@secretlab.ca>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Maen Suleiman <maen@marvell.com>, Lior Amsalem <alior@marvell.com>, gerlando.falauto@keymile.com, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Gregory Clement <gregory.clement@free-electrons.com>, Bjorn Helgaas <bhelgaas@google.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

This driver does not fail to probe when it cannot obtain
a port base address. Therefore, add a check for NULL base address
before setting up the port, which prevents a kernel panic in such
cases.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 drivers/pci/host/pci-mvebu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pci/host/pci-mvebu.c b/drivers/pci/host/pci-mvebu.c
index 424a7b8..338691b 100644
--- a/drivers/pci/host/pci-mvebu.c
+++ b/drivers/pci/host/pci-mvebu.c
@@ -662,6 +662,8 @@ static int __init mvebu_pcie_setup(int nr, struct pci_sys_data *sys)
 
 	for (i = 0; i < pcie->nports; i++) {
 		struct mvebu_pcie_port *port = &pcie->ports[i];
+		if (!port->base)
+			continue;
 		mvebu_pcie_setup_hw(port);
 	}
 
-- 
1.8.1.5
