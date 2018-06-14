From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Subject: [PATCH v3 17/27] bindings: nvmem/zii: Fix location of nvmem.txt
Date: Thu, 14 Jun 2018 13:09:02 -0300
Message-ID: <fcfc83951a2997c527126af1fdd6fb1e0acbe27d.1528990947.git.mchehab+samsung@kernel.org>
References: <cover.1528990947.git.mchehab+samsung@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1528990947.git.mchehab+samsung@kernel.org>
In-Reply-To: <cover.1528990947.git.mchehab+samsung@kernel.org>
References: <cover.1528990947.git.mchehab+samsung@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Mauro Carvalho Chehab <mchehab@infradead.org>, linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The location pointed there is missing "bindings/" on its path.

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
