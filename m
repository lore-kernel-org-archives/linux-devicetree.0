From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v3 01/15] PCI: aardvark: Enlarge PIO timeout
Date: Tue,  8 Jan 2019 17:24:26 +0100
Message-ID: <20190108162441.5278-2-miquel.raynal@bootlin.com>
References: <20190108162441.5278-1-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190108162441.5278-1-miquel.raynal@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Gregory Clement <gregory.clement@bootlin.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Bjorn Helgaas <bhelgaas@google.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Antoine Tenart <antoine.tenart@bootlin.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Rob Herring <robh+dt@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This delay has been proven to work until now, however, there is a
reproducible way to fail the driver probe because of it.

Adding the support for the PCIe gated peripheral clock that feeds the
Aardvark IP defers the Aardvark driver probe at boot time. The probe
functions calls pci_host_probe() at its end. This is where the timeout
(sometimes) resides, leading to a kernel panic the next time a
register is accessed. Here is the function call sequence:

    advk_pcie_probe()
    pci_host_probe()
    pci_scan_root_bus_bridge()
    pci_scan_child_bus_extend()
    pci_scan_bridge_extend()
    pci_scan_child_bus_extend()
    pci_scan_slot()
    pcie_aspm_init_link_state()
    pcie_aspm_cap_init()

pcie_aspm_cap_init() is in charge of doing the initial ASPM state
setup (PCIe Active-State Power Management). The logic at the top of
the function is:

    1/ Read upstream and downstream components' register state.
    2/ Configure the common clock before checking latencies.
    3/ Read again upstream and downstream component's register state.
    4/ ...

Experimentation shows that while 1/ always work, 3/ sometimes timeouts
when reading the downstream components' register state. Each read
operation is handled by the following sequence:

    pcie_capability_read_dword()
    pci_bus_read_config_dword()
    advk_pcie_rd_conf()

advk_pcie_rd_conf() just configures a few registers and polls on the
ISR bit before reading the value that has been retrieved through the
interconnect. The polling timeout of the ISR bit is set to 1ms. While
this value seems to fit most of the situations, in our case it is
sometimes crossed when reading PCI_EXP_LNKCAP (PCI link capacities)
from the downstream component. It has been measured that most of the
time that the read lasts longer than 1ms, it rises ~24ms. In my tests,
using twice this delay always works. The root cause and the reason why
the timeout only appearing when the probe is delayed is unknown
though.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/pci/controller/pci-aardvark.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pci-aardvark.c b/drivers/pci/controller/pci-aardvark.c
index 750081c1cb48..18120e312ae1 100644
--- a/drivers/pci/controller/pci-aardvark.c
+++ b/drivers/pci/controller/pci-aardvark.c
@@ -175,7 +175,7 @@
 	(PCIE_CONF_BUS(bus) | PCIE_CONF_DEV(PCI_SLOT(devfn))	| \
 	 PCIE_CONF_FUNC(PCI_FUNC(devfn)) | PCIE_CONF_REG(where))
 
-#define PIO_TIMEOUT_MS			1
+#define PIO_TIMEOUT_MS			50
 
 #define LINK_WAIT_MAX_RETRIES		10
 #define LINK_WAIT_USLEEP_MIN		90000
-- 
2.19.1
