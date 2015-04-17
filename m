From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v3 4/4] MAINTAINERS: add myself as ARM/UniPhier maintainer
Date: Sat, 18 Apr 2015 00:48:18 +0900
Message-ID: <1429285698-11829-5-git-send-email-yamada.masahiro@socionext.com>
References: <1429285698-11829-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1429285698-11829-1-git-send-email-yamada.masahiro@socionext.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, Baruch Siach <baruch@tkos.co.il>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Olof Johansson <olof@lixom.net>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v3: None
Changes in v2: None

 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f7bbaec..da452f9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1527,6 +1527,13 @@ F:	drivers/rtc/rtc-ab3100.c
 F:	drivers/rtc/rtc-coh901331.c
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-stericsson.git
 
+ARM/UNIPHIER ARCHITECTURE
+M:	Masahiro Yamada <yamada.masahiro@socionext.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	arch/arm/mach-uniphier/
+N:	uniphier
+
 ARM/Ux500 ARM ARCHITECTURE
 M:	Linus Walleij <linus.walleij@linaro.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-- 
1.9.1
