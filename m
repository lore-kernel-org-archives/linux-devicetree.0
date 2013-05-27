From: Wei Yongjun <weiyj.lk@gmail.com>
Subject: [PATCH -next] pci: mvebu: fix return value check in mvebu_pcie_probe()
Date: Mon, 27 May 2013 11:38:41 +0800
Message-ID: <CAPgLHd_B-RBGTcQPeeWeJb9QVkf-RjO1WtBC0JK2KOEoBaus_Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-pci-owner@vger.kernel.org>
Sender: linux-pci-owner@vger.kernel.org
To: bhelgaas@google.com, grant.likely@linaro.org, rob.herring@calxeda.com, jason@lakedaemon.net, thomas.petazzoni@free-electrons.com
Cc: yongjun_wei@trendmicro.com.cn, linux-pci@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

In case of error, function of_clk_get_by_name() returns
ERR_PTR() never returns NULL. The NULL test in the return
value check should be replaced with IS_ERR().

Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
---
 drivers/pci/host/pci-mvebu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/host/pci-mvebu.c b/drivers/pci/host/pci-mvebu.c
index 91106df..c8397c4 100644
--- a/drivers/pci/host/pci-mvebu.c
+++ b/drivers/pci/host/pci-mvebu.c
@@ -828,7 +828,7 @@ static int __init mvebu_pcie_probe(struct platform_device *pdev)
 		}
 
 		port->clk = of_clk_get_by_name(child, NULL);
-		if (!port->clk) {
+		if (IS_ERR(port->clk)) {
 			dev_err(&pdev->dev, "PCIe%d.%d: cannot get clock\n",
 			       port->port, port->lane);
 			iounmap(port->base);
