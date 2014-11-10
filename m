From: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: [PATCH v2 1/2] arm64: Create link to include/dt-bindings to enable C preprocessor use.
Date: Mon, 10 Nov 2014 11:27:54 +0000
Message-ID: <1415618875-8469-2-git-send-email-Liviu.Dudau@arm.com>
References: <1415618875-8469-1-git-send-email-Liviu.Dudau@arm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1415618875-8469-1-git-send-email-Liviu.Dudau@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: arm@kernel.org, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@linaro.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Will Deacon <will.deacon@arm.com>, device tree <devicetree@vger.kernel.org>, LAKML <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

DT files used in the compilation phase can be preprocessed by the C
preprocessor. This requires an include/dt-bindings directory to be
present in the arch/arm64/boot/dts directory.

Signed-off-by: Liviu Dudau <Liviu.Dudau@arm.com>
---
 arch/arm64/boot/dts/include/dt-bindings | 1 +
 1 file changed, 1 insertion(+)
 create mode 120000 arch/arm64/boot/dts/include/dt-bindings

diff --git a/arch/arm64/boot/dts/include/dt-bindings b/arch/arm64/boot/dts/include/dt-bindings
new file mode 120000
index 0000000..08c00e4
--- /dev/null
+++ b/arch/arm64/boot/dts/include/dt-bindings
@@ -0,0 +1 @@
+../../../../../include/dt-bindings
\ No newline at end of file
-- 
2.1.3
