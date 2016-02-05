From: Jon Mason <jonmason@broadcom.com>
Subject: [PATCH 0/5] ARM: dts: NSP: DT Updates
Date: Fri,  5 Feb 2016 17:43:19 -0500
Message-ID: <1454712204-30419-1-git-send-email-jonmason@broadcom.com>
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
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: devicetree@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Northstar Plus device tree changes.  The first 2 are bug fixes that
probably should go in ASAP.  The other 3 enable new hardware and can be
pushed into the next merge window.

Thanks,
Jon

Jon Mason (5):
  ARM: dts: NSP: Fix PCIE DT issue
  ARM: dts: NSP: Fix CPU DT issue
  ARM: dts: NSP: Add PMU Support to DT
  ARM: dts: NSP: Add SP805 Support to DT
  ARM: dts: NSP: Add SP804 Support to DT

 arch/arm/boot/dts/bcm-nsp.dtsi | 193 +++++++++++++++++++++++------------------
 1 file changed, 107 insertions(+), 86 deletions(-)

-- 
1.9.1
