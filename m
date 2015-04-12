From: Anand Moon <linux.amoon@gmail.com>
Subject: v4 Exynos5422 odroidxu3 pwm-fan control using thermal sensors
Date: Mon, 13 Apr 2015 04:14:05 +0930
Message-ID: <1428864251-31780-1-git-send-email-linux.amoon@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Lukasz Majewski <l.majewski@samsung.com>, Guenter Roeck <linux@roeck-us.net>, Eduardo Valentin <edubezval@gmail.com>, Sjoerd Simons <sjoerd.simons@collabora.co.uk>, Markus Reichl <m.reichl@fivetechno.de>, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Changes from v1
        fixed the registration of thermal sensor to tmu_cpu0
Dropped patches.
        0005-pwm-samsung-Fix-output-race-on-disabling.patch
        0006-hwmon-pwm-fan-Update-the-duty-cycle-inorder-to-contr.patch
changes from v2
Added patch
	0006-hwmon-pwm-fan-Update-the-duty-cycle-inorder-to-contr.patch
changes from v3
	Simpilfy the commment in the patch.

-Anand Moon
