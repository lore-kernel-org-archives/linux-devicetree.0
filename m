From: Rob Herring <robh@kernel.org>
Subject: [PATCH 3/4] dt-bindings: powerpc/4xx: move 4xx NDFC and EMAC bindings to subsystem directories
Date: Thu, 26 Apr 2018 16:27:43 -0500
Message-ID: <20180426212744.28688-3-robh@kernel.org>
References: <20180426212744.28688-1-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180426212744.28688-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, linuxppc-dev@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

Bindings are supposed to be organized by device class/function. Move a
couple of powerpc 4xx bindings to the correct binding directory.

Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/{powerpc/4xx/ndfc.txt => mtd/ibm,ndfc.txt}        | 0
 .../devicetree/bindings/{powerpc/4xx/emac.txt => net/ibm,emac.txt}        | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename Documentation/devicetree/bindings/{powerpc/4xx/ndfc.txt => mtd/ibm,ndfc.txt} (100%)
 rename Documentation/devicetree/bindings/{powerpc/4xx/emac.txt => net/ibm,emac.txt} (100%)

diff --git a/Documentation/devicetree/bindings/powerpc/4xx/ndfc.txt b/Documentation/devicetree/bindings/mtd/ibm,ndfc.txt
similarity index 100%
rename from Documentation/devicetree/bindings/powerpc/4xx/ndfc.txt
rename to Documentation/devicetree/bindings/mtd/ibm,ndfc.txt
diff --git a/Documentation/devicetree/bindings/powerpc/4xx/emac.txt b/Documentation/devicetree/bindings/net/ibm,emac.txt
similarity index 100%
rename from Documentation/devicetree/bindings/powerpc/4xx/emac.txt
rename to Documentation/devicetree/bindings/net/ibm,emac.txt
-- 
2.14.1
