From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 0/8] arm64: dts: db820c: Add basic board support
Date: Tue, 21 Jun 2016 18:22:41 +0100
Message-ID: <1466529769-2674-1-git-send-email-srinivas.kandagatla@linaro.org>
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
To: Andy Gross <andy.gross@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This patchset adds basic board support with uart/i2c/spi/sd card for db820c
board based on apq8096. I have tested this patchset on top of msm8996
patches at [1].
With this patchset am able to boot the board with sdcard and able to
play with i2c devices.

Thanks,
srini
[1] https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1170562.html


Changes since v1:
	- Fixed compatible string as suggested by Stephen.
	- Fixed entry in Makefile as suggested by Stephen.
	- Fixed sdhci address to be smalls.

Srinivas Kandagatla (8):
  arm64: dts: db820c: add basic board support
  arm64: dts: db820c: add support to LS-UART0
  arm64: dts: db820c: add support to LS-I2C0
  arm64: dts: db820c: add support to LS-I2C1
  arm64: dts: db820c: add support to I2C on HS
  arm64: dts: db820c: add support to LS-SPI0
  arm64: dts: db820c: add support to SPI on HS
  arm64: dts: db820c: add support to external sd card.

 arch/arm64/boot/dts/qcom/Makefile                 |  1 +
 arch/arm64/boot/dts/qcom/apq8096-db820c-pins.dtsi | 39 ++++++++++
 arch/arm64/boot/dts/qcom/apq8096-db820c.dts       | 21 ++++++
 arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi      | 88 +++++++++++++++++++++++
 4 files changed, 149 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/apq8096-db820c-pins.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/apq8096-db820c.dts
 create mode 100644 arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi

-- 
2.7.4
