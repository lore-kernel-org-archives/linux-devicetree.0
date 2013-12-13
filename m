From: Nicolin Chen <Guangyu.Chen@freescale.com>
Subject: [PATCH 0/2] Add missing audio-related clocks to imx6 clock tree
Date: Fri, 13 Dec 2013 23:44:06 +0800
Message-ID: <cover.1386949189.git.Guangyu.Chen@freescale.com>
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
To: shawn.guo@linaro.org, kernel@pengutronix.de
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux@arm.linux.org.uk, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, linux-kernel@vger.kernel.org, rob.herring@calxeda.com, galak@codeaurora.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This series of patches appends some essential clocks of audio IP to the
current i.MX6 Series clock trees. 

Nicolin Chen (2):
  ARM: imx6sl: Add missing pll4_audio_div to the clock tree
  ARM: imx6sl: Add missing spba clock to clock tree

 arch/arm/mach-imx/clk-imx6sl.c           | 6 ++++--
 include/dt-bindings/clock/imx6sl-clock.h | 4 +++-
 2 files changed, 7 insertions(+), 3 deletions(-)

-- 
1.8.4
