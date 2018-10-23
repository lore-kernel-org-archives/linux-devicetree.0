Return-Path: <SRS0=t27U=ND=stusta.de=bunk@kernel.org>
Date: Tue, 23 Oct 2018 20:26:37 +0300
From: Adrian Bunk <bunk@kernel.org>
Subject: Re: [PATCH v2] eeprom: at24: Add 24c2048
Message-ID: <20181023172637.GB24921@localhost>
References: <20181020182502.8835-1-bunk@kernel.org>
 <CAMRc=MfpjpFwrVBSywO1x7+OLcVfT9RGy_E2E-raVQVGaZvj=g@mail.gmail.com>
 <20181022145858.GA24640@localhost>
 <CAMRc=McwQXyvfL+iFWfaTuAd-a5jRDJhLxYsXHV_sVpj7GqPyA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=McwQXyvfL+iFWfaTuAd-a5jRDJhLxYsXHV_sVpj7GqPyA@mail.gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-i2c <linux-i2c@vger.kernel.org>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Mon, Oct 22, 2018 at 11:59:56PM +0200, Bartosz Golaszewski wrote:
> pon., 22 paź 2018 o 16:59 Adrian Bunk <bunk@kernel.org> napisał(a):
>...
> > I just realized that I forgot to add the entry to
> > Documentation/devicetree/bindings/eeprom/at24.txt,
> > fixed patch is below.
>...
> please send it to the DT maintainers as well and get their Acked-by on that.
> 
> Bart
>...

Rob, Mark, please ack this change.

Thanks
Adrian


>From 580ae2be3d314d9b8df34c9f4e31a9901cc8d300 Mon Sep 17 00:00:00 2001
From: Adrian Bunk <bunk@kernel.org>
Date: Sat, 20 Oct 2018 20:40:16 +0300
Subject: [PATCH] eeprom: at24: Add 24c2048

Works with an ST M24M02.

Signed-off-by: Adrian Bunk <bunk@kernel.org>
---
 Documentation/devicetree/bindings/eeprom/at24.txt | 1 +
 drivers/misc/eeprom/Kconfig                       | 2 +-
 drivers/misc/eeprom/at24.c                        | 3 +++
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/eeprom/at24.txt b/Documentation/devicetree/bindings/eeprom/at24.txt
index aededdbc262b..f9a7c984274c 100644
--- a/Documentation/devicetree/bindings/eeprom/at24.txt
+++ b/Documentation/devicetree/bindings/eeprom/at24.txt
@@ -27,6 +27,7 @@ Required properties:
                 "atmel,24c256",
                 "atmel,24c512",
                 "atmel,24c1024",
+                "atmel,24c2048",
 
                 If <manufacturer> is not "atmel", then a fallback must be used
                 with the same <model> and "atmel" as manufacturer.
diff --git a/drivers/misc/eeprom/Kconfig b/drivers/misc/eeprom/Kconfig
index 68a1ac929917..d382b13c27dd 100644
--- a/drivers/misc/eeprom/Kconfig
+++ b/drivers/misc/eeprom/Kconfig
@@ -13,7 +13,7 @@ config EEPROM_AT24
 	  ones like at24c64, 24lc02 or fm24c04:
 
 	     24c00, 24c01, 24c02, spd (readonly 24c02), 24c04, 24c08,
-	     24c16, 24c32, 24c64, 24c128, 24c256, 24c512, 24c1024
+	     24c16, 24c32, 24c64, 24c128, 24c256, 24c512, 24c1024, 24c2048
 
 	  Unless you like data loss puzzles, always be sure that any chip
 	  you configure as a 24c32 (32 kbit) or larger is NOT really a
diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
index 7e50e1d6f58c..94836fcbe721 100644
--- a/drivers/misc/eeprom/at24.c
+++ b/drivers/misc/eeprom/at24.c
@@ -173,6 +173,7 @@ AT24_CHIP_DATA(at24_data_24c128, 131072 / 8, AT24_FLAG_ADDR16);
 AT24_CHIP_DATA(at24_data_24c256, 262144 / 8, AT24_FLAG_ADDR16);
 AT24_CHIP_DATA(at24_data_24c512, 524288 / 8, AT24_FLAG_ADDR16);
 AT24_CHIP_DATA(at24_data_24c1024, 1048576 / 8, AT24_FLAG_ADDR16);
+AT24_CHIP_DATA(at24_data_24c2048, 2097152 / 8, AT24_FLAG_ADDR16);
 /* identical to 24c08 ? */
 AT24_CHIP_DATA(at24_data_INT3499, 8192 / 8, 0);
 
@@ -199,6 +200,7 @@ static const struct i2c_device_id at24_ids[] = {
 	{ "24c256",	(kernel_ulong_t)&at24_data_24c256 },
 	{ "24c512",	(kernel_ulong_t)&at24_data_24c512 },
 	{ "24c1024",	(kernel_ulong_t)&at24_data_24c1024 },
+	{ "24c2048",    (kernel_ulong_t)&at24_data_24c2048 },
 	{ "at24",	0 },
 	{ /* END OF LIST */ }
 };
@@ -227,6 +229,7 @@ static const struct of_device_id at24_of_match[] = {
 	{ .compatible = "atmel,24c256",		.data = &at24_data_24c256 },
 	{ .compatible = "atmel,24c512",		.data = &at24_data_24c512 },
 	{ .compatible = "atmel,24c1024",	.data = &at24_data_24c1024 },
+	{ .compatible = "atmel,24c2048",	.data = &at24_data_24c2048 },
 	{ /* END OF LIST */ },
 };
 MODULE_DEVICE_TABLE(of, at24_of_match);
-- 
2.11.0
