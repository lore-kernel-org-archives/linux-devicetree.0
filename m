From: Nandor Han <nandor.han@ge.com>
Subject: [PATCH v2 1/4] dt-bindings: gpio - add exar to vendor prefixes list
Date: Thu, 13 Apr 2017 13:27:48 +0300
Message-ID: <f02af49f4d72326c455c9137ffb2714e7236cbab.1492077070.git.nandor.han@ge.com>
References: <cover.1492077070.git.nandor.han@ge.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <cover.1492077070.git.nandor.han@ge.com>
In-Reply-To: <cover.1492077070.git.nandor.han@ge.com>
References: <cover.1492077070.git.nandor.han@ge.com>
Sender: linux-gpio-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, davem@davemloft.net, geert@linux-m68k.org, mchehab@kernel.org, daniel.vetter@ffwll.ch, linus.walleij@linaro.org, gnurou@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Nandor Han <nandor.han@ge.com>
List-Id: devicetree@vger.kernel.org

Add Exar Corporation to vendors list.

Signed-off-by: Nandor Han <nandor.han@ge.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index c7d1b72..ba9058c 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -104,6 +104,7 @@ ettus	NI Ettus Research
 eukrea  Eukréa Electromatique
 everest	Everest Semiconductor Co. Ltd.
 everspin	Everspin Technologies, Inc.
+exar	Exar Corporation
 excito	Excito
 ezchip	EZchip Semiconductor
 faraday	Faraday Technology Corporation
-- 
2.10.1

