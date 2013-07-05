From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 2/2] extcon: palmas: devicetree: remove non-require property details
Date: Fri, 5 Jul 2013 19:29:52 +0530
Message-ID: <1373032792-29001-2-git-send-email-ldewangan@nvidia.com>
References: <1373032792-29001-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1373032792-29001-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-doc-owner@vger.kernel.org
To: cw00.choi@samsung.com, myungjoo.ham@samsung.com, gregkh@linuxfoundation.org
Cc: kishon@ti.com, gg@slimlogic.co.uk, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, grant.likely@linaro.org, rob.herring@calxeda.com, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: devicetree@vger.kernel.org

Extcon for palma driver does not need vbus supply and hence
removing this from devicetree document/bindings.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
---
 .../devicetree/bindings/extcon/extcon-palmas.txt   |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/extcon/extcon-palmas.txt b/Documentation/devicetree/bindings/extcon/extcon-palmas.txt
index 58f531a..f110e75 100644
--- a/Documentation/devicetree/bindings/extcon/extcon-palmas.txt
+++ b/Documentation/devicetree/bindings/extcon/extcon-palmas.txt
@@ -1,15 +1,13 @@
-EXTCON FOR TWL CHIPS
+EXTCON FOR PALMAS/TWL CHIPS
 
 PALMAS USB COMPARATOR
 Required Properties:
  - compatible : Should be "ti,palmas-usb" or "ti,twl6035-usb"
- - vbus-supply : phandle to the regulator device tree node.
 
 Optional Properties:
  - ti,wakeup : To enable the wakeup comparator in probe
 
 palmas-usb {
        compatible = "ti,twl6035-usb", "ti,palmas-usb";
-       vbus-supply = <&smps10_reg>;
        ti,wakeup;
 };
-- 
1.7.1.1

