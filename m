From: Michal Simek <michal.simek@xilinx.com>
Subject: [PATCH 00/10] arm64: zynqmp: dtsi changes
Date: Thu, 20 Jul 2017 14:16:59 +0200
Message-ID: <cover.1500552941.git.michal.simek@xilinx.com>
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
To: linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>, Alexander Graf <agraf@suse.de>, Krzysztof Kozlowski <krzk@kernel.org>, Marc Zyngier <marc.zyngier@arm.com>, Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>, Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>, Stefan Krsmanovic <stefan.krsmanovic@aggios.com>, Bharat Kumar Gogada <bharat.kumar.gogada@xilinx.com>, Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>, Will Wong <willw@xilinx.com>, Rob Herring <robh+dt@kernel.org>, Moritz Fischer <mdf@kernel.org>, =?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann@xilinx.com>, monstr@monstr.eu, Duc Dang <dhdang@apm.com>, linux-kernel@vger.kernel.org, Carlo Caione <carlo@endlessm.com>, Dinh Nguyen <dinguyen@opens>
List-Id: devicetree@vger.kernel.org

Hi,

I have cherry-picked all patches from xilinx soc vendor tree which are
ready for submission.
This patchset targets only zynqmp.dtsi which is shared with all zynqmp
families.

Thanks,
Michal


Bharat Kumar Gogada (1):
  arm64: zynqmp: Adding prefetchable memory space to pcie node

Edgar E. Iglesias (1):
  arm64: zynqmp: Correct IRQ nr for the SMMU

Michal Simek (5):
  arm64: zynqmp: Add references to cpu nodes
  arm64: zynqmp: Add dcc console for zynqmp
  arm64: zynqmp: Add CCI-400 node
  arm64: zynqmp: Add support for RTC
  arm64: zynqmp: Add new uartps compatible string

Naga Sureshkumar Relli (1):
  arm64: zynqmp: Set status disabled in dtsi

Shubhrajyoti Datta (1):
  arm64: zynqmp: Add operating points

Stefan Krsmanovic (1):
  arm64: zynqmp: Add idle state for ZynqMP

 arch/arm64/boot/dts/xilinx/zynqmp.dtsi | 111 ++++++++++++++++++++++++++++-----
 1 file changed, 94 insertions(+), 17 deletions(-)

-- 
1.9.1
