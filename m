From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] csky: remove deprecated arch/csky/boot/dts/include/dt-bindings
Date: Mon,  4 Feb 2019 16:56:01 +0900
Message-ID: <1549266961-13765-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Guo Ren <guoren@kernel.org>
Cc: Olof Johansson <olof@lixom.net>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Having a symbolic link arch/*/boot/dts/include/dt-bindings was
deprecated by commit d5d332d3f7e8 ("devicetree: Move include
prefixes from arch to separate directory").

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 arch/csky/boot/dts/include/dt-bindings | 1 -
 1 file changed, 1 deletion(-)
 delete mode 120000 arch/csky/boot/dts/include/dt-bindings

diff --git a/arch/csky/boot/dts/include/dt-bindings b/arch/csky/boot/dts/include/dt-bindings
deleted file mode 120000
index 08c00e4..0000000
--- a/arch/csky/boot/dts/include/dt-bindings
+++ /dev/null
@@ -1 +0,0 @@
-../../../../../include/dt-bindings
\ No newline at end of file
-- 
2.7.4
