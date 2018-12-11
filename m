From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 0/3] nvmem: imx-ocotp: Implement i.MX6ULL/ULZ support
Date: Tue, 11 Dec 2018 14:51:10 +0100
Message-ID: <1544536273-17909-1-git-send-email-stefan.wahren@i2se.com>
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
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>
Cc: Stefan Wahren <stefan.wahren@i2se.com>, devicetree@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, linux-imx@nxp.com, kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

According to the reference manuals for i.MX6ULL and i.MX6ULZ both SoCs
only support 8 OTP banks instead of 16. So we can't use the compatible
string of i.MX6UL.

Stefan Wahren (3):
  dt-bindings: imx-ocotp: Add i.MX6ULL/ULZ support
  nvmem: imx-ocotp: Implement i.MX6ULL/ULZ support
  ARM: dts: imx6ull: Fix i.MX6ULL/ULZ ocotp compatible

 Documentation/devicetree/bindings/nvmem/imx-ocotp.txt | 3 ++-
 arch/arm/boot/dts/imx6ull.dtsi                        | 4 ++++
 drivers/nvmem/imx-ocotp.c                             | 7 +++++++
 3 files changed, 13 insertions(+), 1 deletion(-)

-- 
2.7.4
