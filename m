From: Rob Herring <robh@kernel.org>
Subject: [PATCH] of: add HAS_IOMEM depends to OF_ADDRESS
Date: Sun,  5 Jul 2015 12:26:50 -0500
Message-ID: <1436117210-17485-1-git-send-email-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Grant Likely <grant.likely@linaro.org>
List-Id: devicetree@vger.kernel.org

On UML builds, of_address.c fails to compile:

=2E./drivers/of/address.c:873:2: error: implicit declaration of functio=
n =E2=80=98ioremap=E2=80=99 [-Werror=3Dimplicit-function-declaration]

This is due to CONFIG_OF now being user selectable. Add a dependency on
HAS_IOMEM to OF_ADDRESS in order to fix this.

Signed-off-by: Rob Herring <robh@kernel.org>
Cc: Grant Likely <grant.likely@linaro.org>
---
 drivers/of/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/Kconfig b/drivers/of/Kconfig
index 8df1b17..59bb855 100644
--- a/drivers/of/Kconfig
+++ b/drivers/of/Kconfig
@@ -47,7 +47,7 @@ config OF_DYNAMIC
=20
 config OF_ADDRESS
 	def_bool y
-	depends on !SPARC
+	depends on !SPARC && HAS_IOMEM
 	select OF_ADDRESS_PCI if PCI
=20
 config OF_ADDRESS_PCI
--=20
2.1.0
