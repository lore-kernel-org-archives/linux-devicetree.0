From: Reza Arbab <arbab@linux.vnet.ibm.com>
Subject: [PATCH 1/4] dt-bindings: add doc for ibm,hotplug-aperture
Date: Mon,  8 Aug 2016 13:27:20 -0500
Message-ID: <1470680843-28702-2-git-send-email-arbab@linux.vnet.ibm.com>
References: <1470680843-28702-1-git-send-email-arbab@linux.vnet.ibm.com>
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <1470680843-28702-1-git-send-email-arbab@linux.vnet.ibm.com>
Sender: owner-linux-mm@kvack.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, Jonathan Corbet <corbet@lwn.net>, Bharata B Rao <bharata@linux.vnet.ibm.com>, Nathan Fontenot <nfont@linux.vnet.ibm.com>, devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Reza Arbab <arbab@linux.vnet.ibm.com>
---
 .../bindings/powerpc/opal/hotplug-aperture.txt     | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/powerpc/opal/hotplug-aperture.txt

diff --git a/Documentation/devicetree/bindings/powerpc/opal/hotplug-aperture.txt b/Documentation/devicetree/bindings/powerpc/opal/hotplug-aperture.txt
new file mode 100644
index 0000000..b8dffaa
--- /dev/null
+++ b/Documentation/devicetree/bindings/powerpc/opal/hotplug-aperture.txt
@@ -0,0 +1,26 @@
+Designated hotplug memory
+-------------------------
+
+This binding describes a region of hotplug memory which is not present at boot,
+allowing its eventual NUMA associativity to be prespecified.
+
+Required properties:
+
+- compatible
+	"ibm,hotplug-aperture"
+
+- reg
+	base address and size of the region (standard definition)
+
+- ibm,associativity
+	NUMA associativity (standard definition)
+
+Example:
+
+A 2 GiB aperture at 0x100000000, to be part of nid 3 when hotplugged:
+
+	hotplug-memory@100000000 {
+		compatible = "ibm,hotplug-aperture";
+		reg = <0x0 0x100000000 0x0 0x80000000>;
+		ibm,associativity = <0x4 0x0 0x0 0x0 0x3>;
+	};
-- 
1.8.3.1

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
