From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 08/54] MAINTAINERS: Add file patterns for mips brcm device tree bindings
Date: Sun, 22 May 2016 11:05:45 +0200
Message-ID: <1463907991-7916-9-git-send-email-geert@linux-m68k.org>
References: <1463907991-7916-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <1463907991-7916-1-git-send-email-geert@linux-m68k.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Hauke Mehrtens <hauke@hauke-m.de>, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>, linux-mips@linux-mips.org
List-Id: devicetree@vger.kernel.org

Submitters of device tree binding documentation may forget to CC
the subsystem maintainer if this is missing.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Hauke Mehrtens <hauke@hauke-m.de>
Cc: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
Cc: linux-mips@linux-mips.org
---
Please apply this patch directly if you want to be involved in device
tree binding documentation for your subsystem.
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d92b26da80747622..63833fe6c6cee985 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2512,6 +2512,7 @@ M:	Hauke Mehrtens <hauke@hauke-m.de>
 M:	Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
 L:	linux-mips@linux-mips.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/mips/brcm/
 F:	arch/mips/bcm47xx/*
 F:	arch/mips/include/asm/mach-bcm47xx/*
=20
--=20
1.9.1
