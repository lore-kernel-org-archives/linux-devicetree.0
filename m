From: Reza Arbab <arbab@linux.vnet.ibm.com>
Subject: [PATCH v7 5/5] dt: add documentation of "hotpluggable" memory property
Date: Mon, 14 Nov 2016 16:02:41 -0600
Message-ID: <1479160961-25840-6-git-send-email-arbab@linux.vnet.ibm.com>
References: <1479160961-25840-1-git-send-email-arbab@linux.vnet.ibm.com>
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <1479160961-25840-1-git-send-email-arbab@linux.vnet.ibm.com>
Sender: owner-linux-mm@kvack.org
To: Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Andrew Morton <akpm@linux-foundation.org>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-mm@kvack.org, devicetree@vger.kernel.org, Bharata B Rao <bharata@linux.vnet.ibm.com>, Nathan Fontenot <nfont@linux.vnet.ibm.com>, Stewart Smith <stewart@linux.vnet.ibm.com>, Alistair Popple <apopple@au1.ibm.com>, Balbir Singh <bsingharora@gmail.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Summarize the "hotpluggable" property of dt memory nodes.

Signed-off-by: Reza Arbab <arbab@linux.vnet.ibm.com>
---
 Documentation/devicetree/booting-without-of.txt | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/booting-without-of.txt b/Documentation/devicetree/booting-without-of.txt
index 3f1437f..280d283 100644
--- a/Documentation/devicetree/booting-without-of.txt
+++ b/Documentation/devicetree/booting-without-of.txt
@@ -974,6 +974,13 @@ compatibility.
       4Gb. Some vendors prefer splitting those ranges into smaller
       segments, but the kernel doesn't care.
 
+  Additional properties:
+
+    - hotpluggable : The presence of this property provides an explicit
+      hint to the operating system that this memory may potentially be
+      removed later. The kernel can take this into consideration when
+      doing nonmovable allocations and when laying out memory zones.
+
   e) The /chosen node
 
   This node is a bit "special". Normally, that's where Open Firmware
-- 
1.8.3.1

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
