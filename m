From: "Philip, Avinash" <avinashphilip@ti.com>
Subject: [PATCH 0/2] ARM: dts: AM33XX: Add ECAP and EHRPWM device tree data
Date: Sat, 29 Sep 2012 16:05:18 +0530
Message-ID: <1348914920-30737-1-git-send-email-avinashphilip@ti.com>
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
To: b-cousson@ti.com, tony@atomide.com, thierry.reding@avionic-design.de
Cc: devicetree-discuss@lists.ozlabs.org, nsekhar@ti.com, linux-kernel@vger.kernel.org, gururaja.hebbar@ti.com, omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This patch set adds support for device tree data for ECAP & EHRPWM
& device tree data for am335x-evm with PWM as backlight.

This has been based on [1] merged with [2] & depends on [3]
1. linux-next/master
2. linux-omap-dt/for_3.7/dts_part2
3. http://www.mail-archive.com/linux-kernel@vger.kernel.org/msg312091.html

PWM back light tested on AM335X evm for different backlight levels.

Philip, Avinash (2):
  ARM: dts: AM33XX: Add ECAP & EHRPWM device tree nodes
  ARM: dts: AM33XX: Add PWM backlight DT data to am335x-evm

 arch/arm/boot/dts/am335x-evm.dts |   21 ++++++++++++++++
 arch/arm/boot/dts/am33xx.dtsi    |   48 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 69 insertions(+), 0 deletions(-)
