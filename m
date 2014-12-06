From: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>
Subject: [PATCH] arch: arm: common: edma.c:  Remove some unused functions
Date: Sat,  6 Dec 2014 23:53:26 +0100
Message-ID: <1417906406-5527-1-git-send-email-rickard_strandqvist@spectrumdigital.se>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Russell King <linux@arm.linux.org.uk>, Grant Likely <grant.likely@linaro.org>
Cc: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>, Rob Herring <robh+dt@kernel.org>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Sekhar Nori <nsekhar@ti.com>, Vinod Koul <vinod.koul@intel.com>, Joel Fernandes <joelf@ti.com>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Removes some functions that are not used anywhere:
edma_shadow0_read() edma_or_array()

This was partially found by using a static code analysis program called cppcheck.

Signed-off-by: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>
---
 arch/arm/common/edma.c |    8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/arm/common/edma.c b/arch/arm/common/edma.c
index d86771a..163273d 100644
--- a/arch/arm/common/edma.c
+++ b/arch/arm/common/edma.c
@@ -160,10 +160,6 @@ static inline void edma_modify_array(unsigned ctlr, int offset, int i,
 {
 	edma_modify(ctlr, offset + (i << 2), and, or);
 }
-static inline void edma_or_array(unsigned ctlr, int offset, int i, unsigned or)
-{
-	edma_or(ctlr, offset + (i << 2), or);
-}
 static inline void edma_or_array2(unsigned ctlr, int offset, int i, int j,
 		unsigned or)
 {
@@ -174,10 +170,6 @@ static inline void edma_write_array2(unsigned ctlr, int offset, int i, int j,
 {
 	edma_write(ctlr, offset + ((i*2 + j) << 2), val);
 }
-static inline unsigned int edma_shadow0_read(unsigned ctlr, int offset)
-{
-	return edma_read(ctlr, EDMA_SHADOW0 + offset);
-}
 static inline unsigned int edma_shadow0_read_array(unsigned ctlr, int offset,
 		int i)
 {
-- 
1.7.10.4
