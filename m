From: matthias.bgg@kernel.org
Subject: [PATCH v1 1/3] dt-bindings: net: bcmgenet add property for max DMA burst size
Date: Fri, 11 Oct 2019 20:48:19 +0200
Message-ID: <20191011184822.866-2-matthias.bgg@kernel.org>
References: <20191011184822.866-1-matthias.bgg@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191011184822.866-1-matthias.bgg@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>, "David S . Miller" <davem@davemloft.net>
Cc: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>, Matthias Brugger <matthias.bgg@kernel.org>, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Stefan Wahren <wahrenst@gmx.net>, Matthias Brugger <mbrugger@suse.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Matthias Brugger <mbrugger@suse.com>

The maximal usable DMA burst size can vary in different SoCs.
Add a optional property to configure the DMA channels properly.

Signed-off-by: Matthias Brugger <mbrugger@suse.com>
---

 Documentation/devicetree/bindings/net/brcm,bcmgenet.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/brcm,bcmgenet.txt b/Documentation/devicetree/bindings/net/brcm,bcmgenet.txt
index 3956af1d30f3..10a7169ec902 100644
--- a/Documentation/devicetree/bindings/net/brcm,bcmgenet.txt
+++ b/Documentation/devicetree/bindings/net/brcm,bcmgenet.txt
@@ -30,6 +30,8 @@ Optional properties:
   See Documentation/devicetree/bindings/net/fixed-link.txt for information on
   the property specifics
 
+- dma-burst-sz: Maximal length of a burst.
+
 Required child nodes:
 
 - mdio bus node: this node should always be present regardless of the PHY
-- 
2.23.0
