From: Gabriel FERNANDEZ <gabriel.fernandez@st.com>
Subject: [RESEND PATCH 0/4] Enables STMicroelectronics Flexgen Clock support
Date: Mon, 25 Aug 2014 16:44:44 +0200
Message-ID: <1408977888-10473-1-git-send-email-gabriel.fernandez@linaro.org>
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
To: Srinivas Kandagatla <srinivas.kandagatla@gmail.com>, Maxime Coquelin <maxime.coquelin@st.com>, Patrice Chotard <patrice.chotard@st.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, olof@lixom.net
Cc: devicetree@vger.kernel.org, kernel@stlinux.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Lee Jones <lee.jones@linaro.org>, Gabriel Fernandez <gabriel.fernandez@linaro.org>
List-Id: devicetree@vger.kernel.org

These patches enables clock drivers for STih407 boards.

Gabriel Fernandez (4):
  ARM: STi: DT: STiH407: 407 DT Entry for clockgen A0
  ARM: STi: DT: STiH407: 407 DT Entry for clockgen C0
  ARM: STi: DT: STiH407: 407 DT Entry for clockgen D0/D2/D3
  ARM: STi: DT: STiH407: 407 DT Entry for clockgenA9

 arch/arm/boot/dts/stih407-clock.dtsi     | 295 ++++++++++++++++++++++++++++++-
 arch/arm/boot/dts/stih407.dtsi           |  18 +-
 include/dt-bindings/clock/stih407-clks.h |  11 ++
 3 files changed, 307 insertions(+), 17 deletions(-)
 create mode 100644 include/dt-bindings/clock/stih407-clks.h

-- 
1.9.1
