From: Vitor Soares <Vitor.Soares@synopsys.com>
Subject: [PATCH v3 4/5] dt-bindings: i3c: add a note for no guarantee of 'assigned-address' use
Date: Thu,  5 Sep 2019 12:00:37 +0200
Message-ID: <f8a0cbc92605dbf5f41a28edd7691c3e90087554.1567608245.git.vitor.soares@synopsys.com>
References: <cover.1567608245.git.vitor.soares@synopsys.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1567608245.git.vitor.soares@synopsys.com>
In-Reply-To: <cover.1567608245.git.vitor.soares@synopsys.com>
References: <cover.1567608245.git.vitor.soares@synopsys.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-i3c@lists.infradead.org
Cc: bbrezillon@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, pgaj@cadence.com, Joao.Pinto@synopsys.com, Vitor Soares <Vitor.Soares@synopsys.com>
List-Id: devicetree@vger.kernel.org

By default, the framework will try to assign the 'assigned-address' to the
device but if the address is already in use the device dynamic address
will be different.

Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
Change in v3:
  - Add Rob rb-tag

 Documentation/devicetree/bindings/i3c/i3c.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i3c/i3c.txt b/Documentation/devicetree/bindings/i3c/i3c.txt
index c851e75..e777f09 100644
--- a/Documentation/devicetree/bindings/i3c/i3c.txt
+++ b/Documentation/devicetree/bindings/i3c/i3c.txt
@@ -98,7 +98,9 @@ Required properties
 
 Optional properties
 -------------------
-- assigned-address: dynamic address to be assigned to this device.
+- assigned-address: dynamic address to be assigned to this device. The framework
+		    will try to assign this dynamic address but if something
+		    fails the device dynamic address will be different.
 
 
 Example:
-- 
2.7.4
