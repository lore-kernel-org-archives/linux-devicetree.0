From: Eric Engestrom <eric@engestrom.ch>
Subject: [PATCH 16/41] Documentation: dt: mmc: fix spelling mistake
Date: Mon, 25 Apr 2016 01:24:13 +0100
Message-ID: <1461543878-3639-17-git-send-email-eric@engestrom.ch>
References: <1461543878-3639-1-git-send-email-eric@engestrom.ch>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1461543878-3639-1-git-send-email-eric@engestrom.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Eric Engestrom <eric@engestrom.ch>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Eric Engestrom <eric@engestrom.ch>
---
 Documentation/devicetree/bindings/mmc/mmc-pwrseq-emmc.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mmc/mmc-pwrseq-emmc.txt b/Documentation/devicetree/bindings/mmc/mmc-pwrseq-emmc.txt
index 0cb827b..3d965d5 100644
--- a/Documentation/devicetree/bindings/mmc/mmc-pwrseq-emmc.txt
+++ b/Documentation/devicetree/bindings/mmc/mmc-pwrseq-emmc.txt
@@ -1,7 +1,7 @@
 * The simple eMMC hardware reset provider
 
 The purpose of this driver is to perform standard eMMC hw reset
-procedure, as descibed by Jedec 4.4 specification. This procedure is
+procedure, as described by Jedec 4.4 specification. This procedure is
 performed just after MMC core enabled power to the given mmc host (to
 fix possible issues if bootloader has left eMMC card in initialized or
 unknown state), and before performing complete system reboot (also in
-- 
2.8.0
