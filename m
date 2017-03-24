From: Doug Berger <opendmb@gmail.com>
Subject: [PATCH 2/9] arm64: mm: mark fault_info __ro_after_init
Date: Fri, 24 Mar 2017 07:46:25 -0700
Message-ID: <20170324144632.5896-3-opendmb@gmail.com>
References: <20170324144632.5896-1-opendmb@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170324144632.5896-1-opendmb@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: catalin.marinas@arm.com
Cc: mark.rutland@arm.com, wangkefeng.wang@huawei.com, linus.walleij@linaro.org, will.deacon@arm.com, mingo@kernel.org, panand@redhat.com, f.fainelli@gmail.com, jonathanh@nvidia.com, bgolaszewski@baylibre.com, bcm-kernel-feedback-list@broadcom.com, shijie.huang@arm.com, opendmb@gmail.com, treding@nvidia.com, devicetree@vger.kernel.org, vladimir.murzin@arm.com, cmetcalf@mellanox.com, suzuki.poulose@arm.com, andre.przywara@arm.com, robh+dt@kernel.org, gregory.0xf0@gmail.com, sandeepa.s.prabhu@gmail.com, horms+renesas@verge.net.au, linux-arm-kernel@lists.infradead.org, mirza.krak@gmail.com, linux-kernel@vger.kernel.org, james.morse@arm.com, olof@lixom.net, computersforpeace@gmail.com
List-Id: devicetree@vger.kernel.org

The fault_info table must be made writeable to allow installation
of custom memory abort handlers, but it can be made read-only
after initialization to provide some protection.

Signed-off-by: Doug Berger <opendmb@gmail.com>
---
 arch/arm64/mm/fault.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
index cdf1260f1005..43319ed58a47 100644
--- a/arch/arm64/mm/fault.c
+++ b/arch/arm64/mm/fault.c
@@ -493,7 +493,7 @@ static struct fault_info {
 	int	sig;
 	int	code;
 	const char *name;
-} fault_info[] = {
+} fault_info[] __ro_after_init = {
 	{ do_bad,		SIGBUS,  0,		"ttbr address size fault"	},
 	{ do_bad,		SIGBUS,  0,		"level 1 address size fault"	},
 	{ do_bad,		SIGBUS,  0,		"level 2 address size fault"	},
-- 
2.12.0
