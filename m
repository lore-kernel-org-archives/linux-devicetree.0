From: Hans Ulli Kroll <ulli.kroll@googlemail.com>
Subject: [PATCH 3/3] DT: add Faraday Tec. as vendor
Date: Wed,  8 Feb 2017 21:00:10 +0100
Message-ID: <20170208200010.21522-4-ulli.kroll@googlemail.com>
References: <20170208200010.21522-1-ulli.kroll@googlemail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170208200010.21522-1-ulli.kroll@googlemail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-usb@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Hans Ulli Kroll <ulli.kroll@googlemail.com>
List-Id: devicetree@vger.kernel.org

add Faraday Technology Corporation as vendor faraday for DT

Signed-off-by: Hans Ulli Kroll <ulli.kroll@googlemail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 16d3b5e7f5d1..489c336e8f80 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -102,6 +102,7 @@ everest	Everest Semiconductor Co. Ltd.
 everspin	Everspin Technologies, Inc.
 excito	Excito
 ezchip	EZchip Semiconductor
+faraday	Faraday Technology Corporation
 fcs	Fairchild Semiconductor
 firefly	Firefly
 focaltech	FocalTech Systems Co.,Ltd
-- 
2.11.0
