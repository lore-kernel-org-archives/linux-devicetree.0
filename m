From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 1/2] extcon: palmas: rename device tree binding matching with file name
Date: Fri, 5 Jul 2013 19:29:51 +0530
Message-ID: <1373032792-29001-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: cw00.choi@samsung.com, myungjoo.ham@samsung.com, gregkh@linuxfoundation.org
Cc: kishon@ti.com, gg@slimlogic.co.uk, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, grant.likely@linaro.org, rob.herring@calxeda.com, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: devicetree@vger.kernel.org

The driver name is extcon/extcon-palmas.c and hence renaming the
device tree binding document to extcon-palmas.txt.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
---
 .../extcon/{extcon-twl.txt => extcon-palmas.txt}   |    0
 1 files changed, 0 insertions(+), 0 deletions(-)
 rename Documentation/devicetree/bindings/extcon/{extcon-twl.txt => extcon-palmas.txt} (100%)

diff --git a/Documentation/devicetree/bindings/extcon/extcon-twl.txt b/Documentation/devicetree/bindings/extcon/extcon-palmas.txt
similarity index 100%
rename from Documentation/devicetree/bindings/extcon/extcon-twl.txt
rename to Documentation/devicetree/bindings/extcon/extcon-palmas.txt
-- 
1.7.1.1

