From: <suravee.suthikulpanit@amd.com>
Subject: [PATCH 0/4] irqchip: gic-v2m: Rework GICv2m Initialization
Date: Fri, 8 Aug 2014 18:17:12 -0500
Message-ID: <1407539836-9768-1-git-send-email-suravee.suthikulpanit@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: marc.zyngier@arm.com, mark.rutland@arm.com, jason@lakedaemon.net
Cc: devicetree@vger.kernel.org, pawel.moll@arm.com, linux-doc@vger.kernel.org, Catalin.Marinas@arm.com, Harish.Kasiviswanathan@amd.com, linux-kernel@vger.kernel.org, Will.Deacon@arm.com, Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>, linux-pci@vger.kernel.org, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>

This patch set reworks the GICv2m initialization based on Marc Zyngier
review comments.

* Rebase to git://git.infradead.org/users/jcooper/linux.git irqchip/gic-v2m

Suravee Suthikulpanit (1):
  irqchip/gic-v2m: Restructure the initalization code for v2m

 Documentation/devicetree/bindings/arm/gic.txt |  37 +++++++--
 drivers/irqchip/irq-gic-v2m.c                 | 115 +++++++++-----------------
 drivers/irqchip/irq-gic.c                     |  30 +++----
 drivers/irqchip/irq-gic.h                     |  10 +--
 4 files changed, 91 insertions(+), 101 deletions(-)

-- 
1.9.0
