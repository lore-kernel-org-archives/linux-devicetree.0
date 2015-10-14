From: Murali Karicheri <m-karicheri2@ti.com>
Subject: [PATCH v4 0/3]
Date: Wed, 14 Oct 2015 10:17:12 -0400
Message-ID: <1444832235-15263-1-git-send-email-m-karicheri2@ti.com>
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
To: corbet@lwn.net, ssantosh@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, devicetree@vger.kernel.org, arnd@arndb.de
List-Id: devicetree@vger.kernel.org

This patch series enable accumulator queue support for K2 SoCs. Accumulator
queues are a type of qmss queue that is monitored by the PDSP firmware and
accumulated. Host is interrupted by PDSP firmware when packets become
available in a ring buffer shared between the host and PDSP.

There was an issue raised when merging the original patch set at
 (1) https://lkml.org/lkml/2015/9/4/681
	[PATCH v1 1/2] soc: ti: display firmware file name as part of boot log
 (2) https://lkml.org/lkml/2015/9/4/680
	[PATCH v1 2/2] ARM: dts: keystone: enable accumulator channels

This series fixes the issues raised against v3. Maintainer, could you please
apply this series to v4.4 next please at your earliest opportunity.

Change Log
==========
v4
	- collected Acked-by from Arnd Bergmann against 1/3
v3
	- Added Arnd's Acked-by against 2/4
	- 1/4 modified not to touch the DT documentation per Rob's comment.
	- Removed DTS update from the series per Santosh. Will send the same
	  as a separate patch
v2
	- Remove the firmware filename from DT and add it to the driver.
	  Use a name ks2_qmss_pdsp_acc48.bin. The idea is this can be a
	  soft link pointing to the real firmware file in file system.

	- Move the description of the driver design from DT document to one
	  under Documentation/arm/keystone/knav-qmss.txt. Update the this
	  document with location of acc firmware available under
	  linux-firmware.git.

	- Additionally added accumulator queue support optional so that lack
	  of firmware in the file system will not cause other queue types not
	  available due to driver probe failure.

Murali Karicheri (3):
  Documentation: dt: soc: Add description for knav qmss driver
  soc: ti: add firmware file name as part of the driver
  soc: ti: qmss: make acc queue support optional in the driver

 Documentation/arm/keystone/knav-qmss.txt           | 56 ++++++++++++++++++
 .../bindings/soc/ti/keystone-navigator-qmss.txt    |  1 -
 drivers/soc/ti/knav_qmss.h                         |  3 +-
 drivers/soc/ti/knav_qmss_acc.c                     | 10 +++-
 drivers/soc/ti/knav_qmss_queue.c                   | 67 ++++++++++++++--------
 5 files changed, 109 insertions(+), 28 deletions(-)
 create mode 100644 Documentation/arm/keystone/knav-qmss.txt

-- 
1.9.1
