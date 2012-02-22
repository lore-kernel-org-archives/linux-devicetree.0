From: Jason Cooper <jason@lakedaemon.net>
Subject: [PATCH 1/3] arm: ignore devicetree blobs.
Date: Wed, 22 Feb 2012 19:18:44 +0000
Message-ID: <3629df9b5b96d3a3a63a34ebf6ddfca2fd72ccfc.1329936660.git.jason@lakedaemon.net>
References: <cover.1329936660.git.jason@lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.1329936660.git.jason@lakedaemon.net>
In-Reply-To: <cover.1329936660.git.jason@lakedaemon.net>
References: <cover.1312906908.git.jason@lakedaemon.net>
 <cover.1329936660.git.jason@lakedaemon.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: arnd@arndb.de, grant.likely@secretlab.ca
Cc: devicetree-discuss@lists.ozlabs.org, Jason Cooper <jason@lakedaemon.net>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


Signed-off-by: Jason Cooper <jason@lakedaemon.net>
---
NOTE: This is the first version of this patch, so no change history.

 arch/arm/boot/.gitignore |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/.gitignore b/arch/arm/boot/.gitignore
index ce1c5ff..3c79f85 100644
--- a/arch/arm/boot/.gitignore
+++ b/arch/arm/boot/.gitignore
@@ -3,3 +3,4 @@ zImage
 xipImage
 bootpImage
 uImage
+*.dtb
-- 
1.7.3.4
