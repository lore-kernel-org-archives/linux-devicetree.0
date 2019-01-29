From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 0/6] arm64: dts: DB820c: Add display and audio support
Date: Tue, 29 Jan 2019 13:23:29 +0000
Message-ID: <20190129132335.30695-1-srinivas.kandagatla@linaro.org>
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
To: andy.gross@linaro.org
Cc: linux-arm-msm@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Andy, 

Now that most of the bits are in mainline, its good time to add display
and audio support to DB820c.
These patches are being tested in integration branch from long time.

Am resending 2 SMMU patches (https://patchwork.kernel.org/cover/10726329/)
in this series to keep all the display and sound patches together.

Can you pick these up for 5.1

thanks,
srini

Archit Taneja (3):
  arm64: dts: msm8996: Add display smmu node
  arm64: qcom: msm8996.dtsi: Add Display nodes
  arm64: dts: apq8096-db820c: Add HDMI display support

Jordan Crouse (2):
  arm64: dts: msm8996: Add graphics smmu node
  arm64: dts: Add Adreno GPU and GPU smmu definitions

Srinivas Kandagatla (1):
  arm64: dts: db820c: Add sound card support

 .../boot/dts/qcom/apq8096-db820c-pins.dtsi    |  52 +++
 .../dts/qcom/apq8096-db820c-pmic-pins.dtsi    |   9 +
 arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi  | 125 +++++++
 arch/arm64/boot/dts/qcom/msm8996-pins.dtsi    |  46 +++
 arch/arm64/boot/dts/qcom/msm8996.dtsi         | 346 ++++++++++++++++++
 5 files changed, 578 insertions(+)

-- 
2.20.1
