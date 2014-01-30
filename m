From: Patrice CHOTARD <patrice.chotard@st.com>
Subject: [PATCH 0/4] ARM:sti: Add STiD127 platform and board support
Date: Thu, 30 Jan 2014 15:55:40 +0100
Message-ID: <1391093744-19905-1-git-send-email-patrice.chotard@st.com>
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
To: Srinivas Kandagatla <srinivas.kandagatla@st.com>, Stuart Menefy <stuart.menefy@st.com>, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, kernel@stlinux.com, linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>, patrice.chotard@st.com, alexandre.torgue@st.com, maxime.coquelin@st.com
List-Id: devicetree@vger.kernel.org

From: Patrice Chotard <patrice.chotard@st.com>

This patch-set adds basic support for STMicroelectronics STiD127 
with B2112 board support. STiD127 is dual-core ARM Cortex-A9 CPU 
to function as a cable modem or in combination with a back end
as a gateway set top box.

Alexandre TORGUE (4):
  ARM: STi: add stid127 soc support
  pinctrl: st: add stid127 support
  ARM: dts: Add support of STid127 Soc.
  ARM: dts: add B2112 board support

 arch/arm/boot/dts/Makefile             |    3 +-
 arch/arm/boot/dts/stid127-b2112.dts    |   35 +++++
 arch/arm/boot/dts/stid127-clock.dtsi   |   31 ++++
 arch/arm/boot/dts/stid127-pinctrl.dtsi |  245 ++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/stid127.dtsi         |  130 +++++++++++++++++
 arch/arm/mach-sti/board-dt.c           |    6 +
 drivers/pinctrl/pinctrl-st.c           |   25 ++++
 7 files changed, 474 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/stid127-b2112.dts
 create mode 100644 arch/arm/boot/dts/stid127-clock.dtsi
 create mode 100644 arch/arm/boot/dts/stid127-pinctrl.dtsi
 create mode 100644 arch/arm/boot/dts/stid127.dtsi

-- 
1.7.9.5
