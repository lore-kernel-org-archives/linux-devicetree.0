From: Vinayak Kale <vkale@apm.com>
Subject: [PATCH 0/2] arm64: Add PMU node for APM X-Gene Storm SoC
Date: Thu, 20 Mar 2014 15:17:25 +0530
Message-ID: <1395308847-16317-1-git-send-email-vkale@apm.com>
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
To: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc: Catalin.Marinas@arm.com, patches@apm.com, Vinayak Kale <vkale@apm.com>, will.deacon@arm.com, jcm@redhat.com
List-Id: devicetree@vger.kernel.org

This patch series adds PMU node for APM X-Gene's Potenza CPU.
Potenza CPU PMU is compatible with ARMv8-PMUv3.

Vinayak Kale (2):
  dt-bindings: Add Potenza PMU binding
  arm64: dts: Add PMU node for APM X-Gene Storm SOC

 Documentation/devicetree/bindings/arm/pmu.txt |    1 +
 arch/arm64/boot/dts/apm-storm.dtsi            |    5 +++++
 2 files changed, 6 insertions(+)

-- 
1.7.9.5
