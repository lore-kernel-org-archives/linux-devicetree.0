From: Steve Lin <steven.lin1@broadcom.com>
Subject: [PATCH 0/2] Add Northstar plus suport to PDC mailbox driver
Date: Wed, 22 Feb 2017 15:42:24 -0500
Message-ID: <1487796146-14690-1-git-send-email-steven.lin1@broadcom.com>
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
To: jassisinghbrar@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, ray.jui@broadcom.com, scott.branden@broadcom.com, jon.mason@broadcom.com, linux@armlinux.org.uk, rob.rice@broadcom.com
Cc: devicetree@vger.kernel.org, Steve Lin <steven.lin1@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Adds support for Broadcom Northstar+ to mailbox (PDC) driver.

Patch 1/2: Driver code and Kconfig changes
Patch 2/2: Device tree and documentation changes

Steve Lin (2):
  mailbox: bcm-pdc: Add Northstar Plus support to PDC driver
  ARM: dts: NSP: Add mailbox (PDC) to NSP

 .../bindings/mailbox/brcm,iproc-pdc-mbox.txt       |  6 ++-
 arch/arm/boot/dts/bcm-nsp.dtsi                     |  9 ++++
 drivers/mailbox/Kconfig                            |  9 ++--
 drivers/mailbox/bcm-pdc-mailbox.c                  | 61 ++++++++++++++++------
 4 files changed, 63 insertions(+), 22 deletions(-)

-- 
2.1.0
