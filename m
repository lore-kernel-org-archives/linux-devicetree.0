From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: randconfig build error with next-20140624, in drivers/mfd/sec-core.c
Date: Tue, 24 Jun 2014 16:57:59 +0200
Message-ID: <29237234.T7oGEGKuvp@wuerfel>
References: <CA+r1ZhhFYip3Jp2c3d8tNpD-vK8Pkf7DzrKTtk6Gy8uOOO3Ucw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-next-owner@vger.kernel.org>
In-Reply-To: <CA+r1ZhhFYip3Jp2c3d8tNpD-vK8Pkf7DzrKTtk6Gy8uOOO3Ucw@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
To: Jim Davis <jim.epost@gmail.com>
Cc: sfr@canb.auug.org.au, linux-next <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, sbkim73@samsung.com, sameo@linux.intel.com, lee.jones@linaro.org, grant.likely@linaro.org, robh+dt@kernel.org, devicetree <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tuesday 24 June 2014 07:39:04 Jim Davis wrote:
> Building with the attached random configuration file,
> 
> drivers/built-in.o: In function `sec_pmic_suspend':
> sec-core.c:(.text+0x31e02c): undefined reference to `regulator_suspend_prepare'
> make: *** [vmlinux] Error 1

Reported-by: Jim Davis <jim.epost@gmail.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 207c433..1caa3c5 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -582,7 +582,7 @@ config MFD_RC5T583
 
 config MFD_SEC_CORE
 	bool "SAMSUNG Electronics PMIC Series Support"
-	depends on I2C=y
+	depends on I2C=y && REGULATOR
 	select MFD_CORE
 	select REGMAP_I2C
 	select REGMAP_IRQ
