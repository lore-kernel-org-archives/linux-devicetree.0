From: Arnd Bergmann <arnd@arndb.de>
Subject: mfd: sec-core requires regulators
Date: Tue, 24 Jun 2014 20:09:07 +0200
Message-ID: <6906564.1ehoeq1QjB@wuerfel>
References: <CA+r1ZhhFYip3Jp2c3d8tNpD-vK8Pkf7DzrKTtk6Gy8uOOO3Ucw@mail.gmail.com> <29237234.T7oGEGKuvp@wuerfel> <20140624154833.GR13803@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-next-owner@vger.kernel.org>
In-Reply-To: <20140624154833.GR13803@lee--X1>
Sender: linux-next-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Jim Davis <jim.epost@gmail.com>, sfr@canb.auug.org.au, linux-next <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, sbkim73@samsung.com, sameo@linux.intel.com, grant.likely@linaro.org, robh+dt@kernel.org, devicetree <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

The newly added sec-core mfd module calls the regulator_suspend_prepare()
function, which is only available if the regulator API is provided. This
matches the usage of the driver, so we can just add a Kconfig dependency.

Reported-by: Jim Davis <jim.epost@gmail.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 207c433..1caa3c5 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -582,7 +582,7 @@ config MFD_RC5T583
 
 config MFD_SEC_CORE
        bool "SAMSUNG Electronics PMIC Series Support"
-       depends on I2C=y
+       depends on I2C=y && REGULATOR
        select MFD_CORE
        select REGMAP_I2C
        select REGMAP_IRQ
