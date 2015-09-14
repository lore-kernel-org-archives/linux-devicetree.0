From: Matt Ranostay <mranostay@gmail.com>
Subject: [PATCH v5 3/4] devicetree: add SGX Sensortech vendor id
Date: Sun, 13 Sep 2015 20:26:13 -0700
Message-ID: <1442201174-10975-4-git-send-email-mranostay@gmail.com>
References: <1442201174-10975-1-git-send-email-mranostay@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1442201174-10975-1-git-send-email-mranostay@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: jic23@kernel.org, lars@metafoo.de, pmeerw@pmeerw.net
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Matt Ranostay <mranostay@gmail.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Matt Ranostay <mranostay@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index ac5f0c3..281e8f0 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -191,6 +191,7 @@ sbs	Smart Battery System
 schindler	Schindler
 seagate	Seagate Technology PLC
 semtech	Semtech Corporation
+sgx	SGX Sensortech
 sharp	Sharp Corporation
 sil	Silicon Image
 silabs	Silicon Laboratories
-- 
1.9.1
