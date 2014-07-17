From: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Subject: [PATCH 2/4 v2] Documentation: dt-bindings: move exynos-adc.txt to more
 iio/adc/
Date: Thu, 17 Jul 2014 16:49:51 +0530
Message-ID: <1405595993-16661-3-git-send-email-ch.naveen@samsung.com>
References: <1405595993-16661-1-git-send-email-ch.naveen@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-reply-to: <1405595993-16661-1-git-send-email-ch.naveen@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: linux-iio@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, cw00.choi@samsung.com, gregkh@linuxfoundation.org, naveenkrishna.ch@gmail.com, lars@metafoo.de, cpgs@samsung.com, grundler@chromium.org, jic23@kernel.org
List-Id: devicetree@vger.kernel.org

The DT bindings in exynos-adc.txt applies to the ADC
driver (exynos-adc.c) developed based on IIO framework.

The bindings are more appropriate to be under
Documentation/devicetree/bindings/iio/adc/

Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
To: devicetree@vger.kernel.org
---
Changes since v1:
Use git format-patch -M to reduce the patch size

 .../{arm/samsung => iio/adc}/exynos-adc.txt        |    0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename Documentation/devicetree/bindings/{arm/samsung => iio/adc}/exynos-adc.txt (100%)

diff --git a/Documentation/devicetree/bindings/arm/samsung/exynos-adc.txt b/Documentation/devicetree/bindings/iio/adc/exynos-adc.txt
similarity index 100%
rename from Documentation/devicetree/bindings/arm/samsung/exynos-adc.txt
rename to Documentation/devicetree/bindings/iio/adc/exynos-adc.txt
-- 
1.7.9.5
