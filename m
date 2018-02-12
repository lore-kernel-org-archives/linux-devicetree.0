From: Joel Stanley <joel@jms.id.au>
Subject: [PATCH 09/10] dt-bindings: fsi: Add optional property no-scan-on-init
Date: Mon, 12 Feb 2018 15:45:48 +1030
Message-ID: <20180212051549.8575-10-joel@jms.id.au>
References: <20180212051549.8575-1-joel@jms.id.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180212051549.8575-1-joel@jms.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>, Jeremy Kerr <jk@ozlabs.org>, Brad Bishop <bradleyb@fuzziesquirrel.com>, Edward James <eajames@us.ibm.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Christopher Bostic <cbostic@linux.vnet.ibm.com>

Add an optional FSI master property 'no-scan-on-init.  This
can be specified to indicate that a master should not be
automatically scanned at init time.  This is required in cases
where a scan could interfere with another FSI master on the same
bus.

Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Acked-by: Jeremy Kerr <jk@ozlabs.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 Documentation/devicetree/bindings/fsi/fsi.txt | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/fsi/fsi.txt b/Documentation/devicetree/bindings/fsi/fsi.txt
index 4eaf488d4015..ab516c673a4b 100644
--- a/Documentation/devicetree/bindings/fsi/fsi.txt
+++ b/Documentation/devicetree/bindings/fsi/fsi.txt
@@ -56,6 +56,13 @@ addresses (link index and slave ID), and no size:
     #address-cells = <2>;
     #size-cells = <0>;
 
+An optional boolean property can be added to indicate that a particular master
+should not scan for connected devices at initialization time.  This is
+necessary in cases where a scan could cause arbitration issues with other
+masters that may be present on the bus.
+
+    no-scan-on-init;
+
 FSI slaves
 ----------
 
-- 
2.15.1
