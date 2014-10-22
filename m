From: Scott Branden <sbranden@broadcom.com>
Subject: [PATCH v6 5/6] MAINTAINERS: Entry for Cygnus/iproc arm architecture
Date: Tue, 21 Oct 2014 19:09:51 -0700
Message-ID: <1413943792-7379-6-git-send-email-sbranden@broadcom.com>
References: <Scott Branden <sbranden@broadcom.com>
 <1413943792-7379-1-git-send-email-sbranden@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1413943792-7379-1-git-send-email-sbranden@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Christian Daudt <bcm@fixthebug.org>, Matt Porter <mporter@linaro.org>, Russell King <linux@arm.linux.org.uk>, bcm-kernel-feedback-list@broadcom.com, Mike Turquette <mturquette@linaro.org>, Alex Elder <elder@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Andrew Morton <akpm@linux-foundation.org>, "David S. Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Joe Perches <joe@perches.com>, Mauro Carvalho Chehab <m.chehab@samsung.com>, Antti Palosaari <crope@iki.fi>
Cc: JD Zheng <jdzheng@broadcom.com>, Ray Jui <rjui@broadcom.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Scott Branden <sbranden@broadcom.com>
List-Id: devicetree@vger.kernel.org

Acked-by: Jonathan Richardson <jonathar@broadcom.com>
Signed-off-by: Scott Branden <sbranden@broadcom.com>
---
 MAINTAINERS |   14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b0f17d5..dfe255f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2125,6 +2125,20 @@ L:	linux-scsi@vger.kernel.org
 S:	Supported
 F:	drivers/scsi/bnx2i/
 
+BROADCOM CYGNUS/IPROC ARM ARCHITECTURE
+M:	Ray Jui <rjui@broadcom.com>
+M:	Scott Branden <sbranden@broadcom.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	bcm-kernel-feedback-list@broadcom.com
+T:	git git://git.github.com/brcm/linux.git
+S:	Maintained
+N:	iproc
+N:	cygnus
+N:	bcm9113*
+N:	bcm9583*
+N:	bcm583*
+N:	bcm113*
+
 BROADCOM KONA GPIO DRIVER
 M:	Ray Jui <rjui@broadcom.com>
 L:	bcm-kernel-feedback-list@broadcom.com
-- 
1.7.9.5
