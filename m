From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 1/2] PCI: histb: fix error path of histb_pcie_host_enable()
Date: Tue, 23 Jan 2018 23:45:36 +0800
Message-ID: <1516722337-1533-2-git-send-email-shawn.guo@linaro.org>
References: <1516722337-1533-1-git-send-email-shawn.guo@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1516722337-1533-1-git-send-email-shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jianguo Sun <sunjianguo1-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, project-aspen-dev-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

If clk_prepare_enable() call fails on a particular clock, we should not
call clk_disable_unprepare() on this clock, but on the clocks that
succeed from clk_prepare_enable() previously.

Signed-off-by: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/pci/dwc/pcie-histb.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/dwc/pcie-histb.c b/drivers/pci/dwc/pcie-histb.c
index 33b01b734d7d..6395394be5b4 100644
--- a/drivers/pci/dwc/pcie-histb.c
+++ b/drivers/pci/dwc/pcie-histb.c
@@ -279,13 +279,12 @@ static int histb_pcie_host_enable(struct pcie_port *pp)
 	return 0;
 
 err_aux_clk:
-	clk_disable_unprepare(hipcie->aux_clk);
-err_pipe_clk:
 	clk_disable_unprepare(hipcie->pipe_clk);
-err_sys_clk:
+err_pipe_clk:
 	clk_disable_unprepare(hipcie->sys_clk);
-err_bus_clk:
+err_sys_clk:
 	clk_disable_unprepare(hipcie->bus_clk);
+err_bus_clk:
 
 	return ret;
 }
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
