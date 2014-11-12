From: Andrew Bresticker <abrestic@chromium.org>
Subject: [PATCH V5 1/4] of: Add vendor prefix for MIPS Technologies, Inc.
Date: Wed, 12 Nov 2014 11:43:36 -0800
Message-ID: <1415821419-26974-2-git-send-email-abrestic@chromium.org>
References: <1415821419-26974-1-git-send-email-abrestic@chromium.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1415821419-26974-1-git-send-email-abrestic@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Ralf Baechle <ralf@linux-mips.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Andrew Bresticker <abrestic@chromium.org>, John Crispin <blogic@openwrt.org>, David Daney <ddaney.cavm@gmail.com>, Qais Yousef <qais.yousef@imgtec.com>, James Hogan <james.hogan@imgtec.com>, Arnd Bergmann <arnd@arndb.de>, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add the vendor prefix "mti" for MIPS Technologies, Inc.

Signed-off-by: Andrew Bresticker <abrestic@chromium.org>
Acked-by: Arnd Bergmann <arnd@arndb.de>
---
I'll update the users of the "mips" prefix to use "mti" instead once
this lands.

No changes from v2/v3/v4.
New for v2.
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 0979393..0221b49 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -98,6 +98,7 @@ mitsubishi	Mitsubishi Electric Corporation
 mosaixtech	Mosaix Technologies, Inc.
 moxa	Moxa
 mpl	MPL AG
+mti	MIPS Technologies, Inc.
 mundoreader	Mundo Reader S.L.
 murata	Murata Manufacturing Co., Ltd.
 mxicy	Macronix International Co., Ltd.
-- 
2.1.0.rc2.206.gedb03e5
