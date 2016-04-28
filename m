From: Russell King <rmk+kernel@arm.linux.org.uk>
Subject: [PATCH 09/12] kexec: ensure user memory sizes do not wrap
Date: Thu, 28 Apr 2016 10:28:30 +0100
Message-ID: <E1aviFK-0000jY-1S@rmk-PC.arm.linux.org.uk>
References: <20160428092644.GX19428@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-ia64-owner@vger.kernel.org>
In-Reply-To: <20160428092644.GX19428@n2100.arm.linux.org.uk>
Content-Disposition: inline
Sender: linux-ia64-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, Eric Biederman <ebiederm@xmission.com>, Fenghua Yu <fenghua.yu@intel.com>, Haren Myneni <hbabu@us.ibm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Jonathan Corbet <corbet@lwn.net>, kexec@lists.infradead.org, Kumar Gala <galak@codeaurora.org>, linux-doc@vger.kernel.org, linux-ia64@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>, Tony Luck <tony.luck@intel.com>, Vivek Goyal <vgoyal@redhat.com>
List-Id: devicetree@vger.kernel.org

Ensure that user memory sizes do not wrap around when validating the
user input, which can lead to the following input validation working
incorrectly.

Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>
---
 kernel/kexec_core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/kexec_core.c b/kernel/kexec_core.c
index 8d34308ea449..d719a4d0ef55 100644
--- a/kernel/kexec_core.c
+++ b/kernel/kexec_core.c
@@ -169,6 +169,8 @@ int sanity_check_segment_list(struct kimage *image)
 
 		mstart = image->segment[i].mem;
 		mend   = mstart + image->segment[i].memsz;
+		if (mstart > mend)
+			return result;
 		if ((mstart & ~PAGE_MASK) || (mend & ~PAGE_MASK))
 			return result;
 		if (mend >= KEXEC_DESTINATION_MEMORY_LIMIT)
-- 
2.1.0

