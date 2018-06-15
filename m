From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Subject: [PATCH v4 17/26] bindings: nvmem/zii: Fix location of nvmem.txt
Date: Fri, 15 Jun 2018 13:30:45 -0300
Message-ID: <29bf5ab9b101ebbaed580edc89d1501f0f8dd4bd.1529079120.git.mchehab+samsung@kernel.org>
References: <cover.1529079119.git.mchehab+samsung@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1529079119.git.mchehab+samsung@kernel.org>
In-Reply-To: <cover.1529079119.git.mchehab+samsung@kernel.org>
References: <cover.1529079119.git.mchehab+samsung@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Mauro Carvalho Chehab <mchehab@infradead.org>, linux-kernel@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The location pointed there is missing "bindings/" on its path.

Acked-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 Documentation/devicetree/bindings/nvmem/zii,rave-sp-eeprom.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/nvmem/zii,rave-sp-eeprom.txt b/Documentation/devicetree/bindings/nvmem/zii,rave-sp-eeprom.txt
index d5e22fc67d66..0df79d9e07ec 100644
--- a/Documentation/devicetree/bindings/nvmem/zii,rave-sp-eeprom.txt
+++ b/Documentation/devicetree/bindings/nvmem/zii,rave-sp-eeprom.txt
@@ -18,7 +18,7 @@ Optional properties:
 Data cells:
 
 Data cells are child nodes of eerpom node, bindings for which are
-documented in Documentation/bindings/nvmem/nvmem.txt
+documented in Documentation/devicetree/bindings/nvmem/nvmem.txt
 
 Example:
 
-- 
2.17.1
