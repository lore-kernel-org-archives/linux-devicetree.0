From: Wei Yongjun <weiyj.lk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] usb: host: tegra: fix potential NULL pointer dereference
Date: Thu, 1 Nov 2012 14:57:38 +0800
Message-ID: <CAPgLHd9551qZuTY7uKGYT7OXYeGE7LL+fo7ynwDv9msHKRYkKw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org
Cc: yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Wei Yongjun <yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org>

The dereference should be moved below the NULL test.

dpatch engine is used to auto generate this patch.
(https://github.com/weiyj/dpatch)

Signed-off-by: Wei Yongjun <yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org>
---
 drivers/usb/host/ehci-tegra.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/ehci-tegra.c b/drivers/usb/host/ehci-tegra.c
index 6223d17..e40fcb0 100644
--- a/drivers/usb/host/ehci-tegra.c
+++ b/drivers/usb/host/ehci-tegra.c
@@ -776,9 +776,13 @@ fail_clk:
 static int tegra_ehci_remove(struct platform_device *pdev)
 {
 	struct tegra_ehci_hcd *tegra = platform_get_drvdata(pdev);
-	struct usb_hcd *hcd = ehci_to_hcd(tegra->ehci);
+	struct usb_hcd *hcd;
+
+	if (tegra == NULL)
+		return -EINVAL;
 
-	if (tegra == NULL || hcd == NULL)
+	hcd = ehci_to_hcd(tegra->ehci);
+	if (hcd == NULL)
 		return -EINVAL;
 
 	pm_runtime_get_sync(&pdev->dev);

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
