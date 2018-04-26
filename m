From: Rob Herring <robh@kernel.org>
Subject: [PATCH 4/4] dt-bindings: exynos: move ADC binding to iio/adc/ directory
Date: Thu, 26 Apr 2018 16:27:44 -0500
Message-ID: <20180426212744.28688-4-robh@kernel.org>
References: <20180426212744.28688-1-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180426212744.28688-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Bindings are supposed to be organized by device class/function. Move the
binding for Exynos ADC to the iio/adc/ binding directory.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../{arm/samsung/exynos-adc.txt => iio/adc/samsung,exynos-adc.txt}        | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename Documentation/devicetree/bindings/{arm/samsung/exynos-adc.txt => iio/adc/samsung,exynos-adc.txt} (100%)

diff --git a/Documentation/devicetree/bindings/arm/samsung/exynos-adc.txt b/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.txt
similarity index 100%
rename from Documentation/devicetree/bindings/arm/samsung/exynos-adc.txt
rename to Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.txt
-- 
2.14.1
