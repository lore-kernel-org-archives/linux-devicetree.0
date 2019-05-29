Return-Path: <SRS0=L0hH=T5=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-pf1-f195.google.com ([209.85.210.195]:34869 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725914AbfE2Jv4 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 29 May 2019 05:51:56 -0400
Received: by mail-pf1-f195.google.com with SMTP id d126so1297966pfd.2
        for <devicetree@vger.kernel.org>; Wed, 29 May 2019 02:51:56 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
Subject: [PATCH] schemas: add rng-seed node schema
Date: Wed, 29 May 2019 17:50:52 +0800
Message-Id: <20190529095052.182257-1-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: robh+dt@kernel.org
List-ID: <devicetree@vger.kernel.org>

This is based on kernel patch "fdt: add support for rng-seed".

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 schemas/chosen.yaml | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/schemas/chosen.yaml b/schemas/chosen.yaml
index a768215..a35fea8 100644
--- a/schemas/chosen.yaml
+++ b/schemas/chosen.yaml
@@ -51,6 +51,21 @@ properties:
       the Linux EFI stub (which will populate the property itself, using
       EFI_RNG_PROTOCOL).

+  rng-seed:
+    allOf:
+      - $ref: types.yaml#definitions/uint8-array
+    description:
+      This property served as an entropy to add device randomness. It is parsed
+      as a byte array, e.g.
+
+      /{
+             chosen {
+                     rng-seed = <0x31 0x95 0x1b 0x3c 0xc9 0xfa 0xb3 ...>;
+             };
+      };
+
+      This random value should be provided by bootloader.
+
   linux,booted-from-kexec:
     type: boolean
     description:
-- 
2.22.0.rc1.257.g3120a18244-goog
