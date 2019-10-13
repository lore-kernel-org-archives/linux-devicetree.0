From: Brian Masney <masneyb@onstation.org>
Subject: [PATCH 0/5] ARM: qcom: add defconfig items and dts nodes
Date: Sun, 13 Oct 2019 04:07:59 -0400
Message-ID: <20191013080804.10231-1-masneyb@onstation.org>
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
To: agross@kernel.org, bjorn.andersson@linaro.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Here's a small patch series that adds support for the On Chip MEMory
(OCMEM) and msm8974 interconnect support to qcom_defconfig and to
qcom-msm8974.dtsi. The OCMEM driver is already in linux-next and it
looks like the interconnect support should be merged soon:
https://lore.kernel.org/lkml/20191005114605.5279-1-masneyb@onstation.org/

I have some work in progress patches for the HDMI bridge that's found
on the Nexus 5 and this series adds the necessary driver to
qcom_defconfig.

Brian Masney (5):
  ARM: qcom_defconfig: add ocmem support
  ARM: qcom_defconfig: add msm8974 interconnect support
  ARM: qcom_defconfig: add anx78xx HDMI bridge support
  ARM: dts: qcom: msm8974: add ocmem node
  ARM: dts: qcom: msm8974: add interconnect nodes

 arch/arm/boot/dts/qcom-msm8974.dtsi | 79 +++++++++++++++++++++++++++++
 arch/arm/configs/qcom_defconfig     |  5 ++
 2 files changed, 84 insertions(+)

-- 
2.21.0
