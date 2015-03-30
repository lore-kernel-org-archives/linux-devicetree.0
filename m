From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH 0/2] ARM: EXYNOS: Minor S3C RTC cleanups
Date: Mon, 30 Mar 2015 17:19:31 +0200
Message-ID: <1427728773-29065-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Alessandro Zummo <a.zummo@towertech.it>, Chanwoo Choi <cw00.choi@samsung.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, rtc-linux@googlegroups.com, Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>
List-Id: devicetree@vger.kernel.org

Hi,

Now the s3c6410-rtc is exactly the same as exynos3250-rtc. Mark the
second one as deprecated and switch to one binding.

Patches are independent.

Best regards,
Krzysztof

Krzysztof Kozlowski (3):
  drivers/rtc/rtc-s3c.c: Integrate Exynos3250 into S3C6410
  ARM: dts: s3c-rtc: Use s3c6410-rtc instead of exynos3250-rtc
  ARM: dts: Use define for s3c-rtc clock id

 Documentation/devicetree/bindings/rtc/s3c-rtc.txt |  3 ++-
 arch/arm/boot/dts/exynos3250-rinato.dts           |  3 ++-
 arch/arm/boot/dts/exynos3250.dtsi                 |  2 +-
 arch/arm/boot/dts/exynos4415.dtsi                 |  2 +-
 drivers/rtc/rtc-s3c.c                             | 14 +-------------
 5 files changed, 7 insertions(+), 17 deletions(-)

-- 
1.9.1
