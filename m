From: Johan Hovold <johan@kernel.org>
Subject: [PATCH v2 8/9] NFC: nfcmrvl_uart: fix OF child-node lookup
Date: Mon, 27 Aug 2018 10:21:52 +0200
Message-ID: <20180827082153.22537-9-johan@kernel.org>
References: <20180827082153.22537-1-johan@kernel.org>
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20180827082153.22537-1-johan@kernel.org>
Sender: stable-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, stable <stable@vger.kernel.org>, Vincent Cuissard <cuissard@marvell.com>, Samuel Ortiz <sameo@linux.intel.com>
List-Id: devicetree@vger.kernel.org

Use the new of_get_compatible_child() helper to lookup the nfc child
node instead of using of_find_compatible_node(), which searches the
entire tree from a given start node and thus can return an unrelated
(i.e. non-child) node.

This also addresses a potential use-after-free (e.g. after probe
deferral) as the tree-wide helper drops a reference to its first
argument (i.e. the parent node).

Fixes: e097dc624f78 ("NFC: nfcmrvl: add UART driver")
Fixes: d8e018c0b321 ("NFC: nfcmrvl: update device tree bindings for Marvell NFC")
Cc: stable <stable@vger.kernel.org>     # 4.2
Cc: Vincent Cuissard <cuissard@marvell.com>
Cc: Samuel Ortiz <sameo@linux.intel.com>
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/nfc/nfcmrvl/uart.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/nfc/nfcmrvl/uart.c b/drivers/nfc/nfcmrvl/uart.c
index 91162f8e0366..9a22056e8d9e 100644
--- a/drivers/nfc/nfcmrvl/uart.c
+++ b/drivers/nfc/nfcmrvl/uart.c
@@ -73,10 +73,9 @@ static int nfcmrvl_uart_parse_dt(struct device_node *node,
 	struct device_node *matched_node;
 	int ret;
 
-	matched_node = of_find_compatible_node(node, NULL, "marvell,nfc-uart");
+	matched_node = of_get_compatible_child(node, "marvell,nfc-uart");
 	if (!matched_node) {
-		matched_node = of_find_compatible_node(node, NULL,
-						       "mrvl,nfc-uart");
+		matched_node = of_get_compatible_child(node, "mrvl,nfc-uart");
 		if (!matched_node)
 			return -ENODEV;
 	}
-- 
2.18.0
