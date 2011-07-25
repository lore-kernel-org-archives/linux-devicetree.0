From: Jamie Iles <jamie@jamieiles.com>
Subject: [PATCH 0/3] Add device tree based initialisation for VIC
Date: Mon, 25 Jul 2011 17:09:57 +0100
Message-ID: <1311610200-12408-1-git-send-email-jamie@jamieiles.com>
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
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: Jamie Iles <jamie@jamieiles.com>, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

This series aims to allow VIC devices to be probed from the device tree.
Currently the only in-tree device tree enabled user of the VIC is versatile,
but I'll shortly submit patches for picoxcell on device tree that uses 2
VIC's.

I've split this into 3 patches for bisectability, but this could be fairly
squashed into 2.

Jamie Iles (3):
  vic: add device tree bindings
  versatile dt: set the irq-start property for the vic
  versatile: convert to common VIC DT probing

 Documentation/devicetree/bindings/arm/vic.txt |   21 +++++++++++++++
 arch/arm/boot/dts/versatile-ab.dts            |    1 +
 arch/arm/common/vic.c                         |   35 +++++++++++++++++++++++++
 arch/arm/include/asm/hardware/vic.h           |    5 +++
 arch/arm/mach-versatile/core.c                |    9 +-----
 5 files changed, 63 insertions(+), 8 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/vic.txt

-- 
1.7.4.1
