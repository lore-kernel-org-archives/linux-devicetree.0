From: Jon Mason <jonmason@broadcom.com>
Subject: [PATCH v2 5/5] MAINTAINERS: add entry for the Broadcom Northstar Plus SoCs
Date: Wed, 26 Aug 2015 18:35:30 -0400
Message-ID: <1440628530-6137-6-git-send-email-jonmason@broadcom.com>
References: <1440628530-6137-1-git-send-email-jonmason@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1440628530-6137-1-git-send-email-jonmason@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Florian Fainelli <f.fainelli@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Modify the iProc MAINTAINER to cover the Nortstar Plus SoCs, and add me
to the list of people responsible for it.  Since iProc is a family of
SoCs that includes more than just Cygnus (i.e., Northstar (BCM5301X),
Northstar Plus, Northstar 2, and a number of other platforms), remove it
from the title to avoid any future confusion.

Signed-off-by: Jon Mason <jonmason@broadcom.com>
Acked-by: Scott Branden <sbranden@broadcom.com>
---
 MAINTAINERS | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index a9ae6c1..4b851f5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2315,19 +2315,27 @@ L:	linux-scsi@vger.kernel.org
 S:	Supported
 F:	drivers/scsi/bnx2i/
 
-BROADCOM CYGNUS/IPROC ARM ARCHITECTURE
+BROADCOM IPROC ARM ARCHITECTURE
 M:	Ray Jui <rjui@broadcom.com>
 M:	Scott Branden <sbranden@broadcom.com>
+M:	Jon Mason <jonmason@broadcom.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	bcm-kernel-feedback-list@broadcom.com
 T:	git git://github.com/broadcom/cygnus-linux.git
 S:	Maintained
 N:	iproc
 N:	cygnus
+N:	nsp
 N:	bcm9113*
 N:	bcm9583*
-N:	bcm583*
+N:	bcm9585*
+N:	bcm9586*
+N:	bcm988312
 N:	bcm113*
+N:	bcm583*
+N:	bcm585*
+N:	bcm586*
+N:	bcm88312
 
 BROADCOM BRCMSTB GPIO DRIVER
 M:	Gregory Fong <gregory.0xf0@gmail.com>
-- 
1.9.1
