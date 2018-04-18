Return-Path: <>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH/RFC 01/11] Documentation: of: Add device-connection-id property
Date: Wed, 18 Apr 2018 17:09:55 +0900
Message-Id: <1524039005-30618-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1524039005-30618-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1524039005-30618-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
To: gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com, frowand.list@gmail.com
Cc: heikki.krogerus@linux.intel.com, hdegoede@redhat.com, andy.shevchenko@gmail.com, p.zabel@pengutronix.de, linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-ID: <devicetree@vger.kernel.org>

This patch adds a new property for device connection framework.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 Documentation/devicetree/bindings/graph.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/graph.txt b/Documentation/devicetree/bindings/graph.txt
index 0415e2c..fca0030 100644
--- a/Documentation/devicetree/bindings/graph.txt
+++ b/Documentation/devicetree/bindings/graph.txt
@@ -125,4 +125,4 @@ Optional endpoint properties
 ----------------------------
 
 - remote-endpoint: phandle to an 'endpoint' subnode of a remote device node.
-
+- device-connection-id: string for device connection.
-- 
1.9.1
