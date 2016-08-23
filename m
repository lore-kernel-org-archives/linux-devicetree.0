From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v3 0/2] ARM: dts: Add support for the MDM9615
Date: Tue, 23 Aug 2016 13:30:48 +0200
Message-ID: <1471951850-29842-1-git-send-email-narmstrong@baylibre.com>
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
To: andy.gross@linaro.org, david.brown@linaro.org, linux@armlinux.org.uk, sboyd@codeaurora.org
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

In order to support the Qualcomm MDM9615 in the Sierra Wireless WP8548
Modules, add the MDM9615 DTSI and update its dt-bindings.

This patchset depends on pinctrl [merged], clk [merged], pmic [1] and arm-soc [merged] patchsets.

This patchset is part of a global SoC + Module + Board support for the
Sierra Wireless mangOH Board support with the WP8548 module.

[1] http://lkml.kernel.org/r/1470921406-18468-1-git-send-email-narmstrong@baylibre.com

Changes since v2 at http://lkml.kernel.org/r/1471525661-2563-1-git-send-email-narmstrong@baylibre.com :
 - Cleanup interrupts types
 - Moved dummy regulator to "/regulators" node
 - Fixed ssbi mpp/gpio compatibles
 - Removed pinctrl syscon

Changes since v1 at : http://lkml.kernel.org/r/1466159704-22774-1-git-send-email-narmstrong@baylibre.com
 - Added cxo_board clock node
 - Added secondary pm8921 compatibles
 - Dropped corner regulator
 - Dropped USB nodes

Neil Armstrong (2):
  ARM: dts: Add MDM9615 dtsi
  dt-bindings: qcom: Add MDM9615 bindings

 Documentation/devicetree/bindings/arm/qcom.txt |   1 +
 arch/arm/boot/dts/qcom-mdm9615.dtsi            | 555 +++++++++++++++++++++++++
 2 files changed, 556 insertions(+)
 create mode 100644 arch/arm/boot/dts/qcom-mdm9615.dtsi

-- 
1.9.1
