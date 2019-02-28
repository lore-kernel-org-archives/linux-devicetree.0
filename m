From: Robert Yang <decatf@gmail.com>
Subject: [PATCH 1/3] dt-bindings: Add vendor prefix for Kionix, Inc.
Date: Thu, 28 Feb 2019 15:18:09 -0500
Message-ID: <20190228201811.7582-2-decatf@gmail.com>
References: <20190228201811.7582-1-decatf@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190228201811.7582-1-decatf@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Robert Yang <decatf@gmail.com>
List-Id: devicetree@vger.kernel.org

Kionix manufactured MEMs sensors. There are Kionix acceleromoter sensor
drivers which can be used with device tree.

Signed-off-by: Robert Yang <decatf@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 01732c887521..e28583ebe5e8 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -208,6 +208,7 @@ kiebackpeter    Kieback & Peter GmbH
 kinetic Kinetic Technologies
 kingdisplay	King & Display Technology Co., Ltd.
 kingnovel	Kingnovel Technology Co., Ltd.
+kionix	Kionix, Inc.
 koe	Kaohsiung Opto-Electronics Inc.
 kosagi	Sutajio Ko-Usagi PTE Ltd.
 kyo	Kyocera Corporation
-- 
2.17.1
