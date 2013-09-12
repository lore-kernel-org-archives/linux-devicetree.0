From: Soren Brinkmann <soren.brinkmann@xilinx.com>
Subject: [PATCH 0/2] arm: zynq: Enable global timer
Date: Thu, 12 Sep 2013 09:50:38 -0700
Message-ID: <1379004640-15117-1-git-send-email-soren.brinkmann@xilinx.com>
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
To: Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Russell King <linux@arm.linux.org.uk>, Michal Simek <michal.simek@xilinx.com>, Thomas Gleixner <tglx@linutronix.de>, Daniel Lezcano <daniel.lezcano@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>
Cc: Soren Brinkmann <soren.brinkmann@xilinx.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi all,

I'm sitting on this for a while and was waiting for Stephen's patch to
get merged somewhere. Unfortunately that didn't happen yet.
The patch to enable the global timer is pretty straight forward.
Stephen's patch is the result of this thread: https://lkml.org/lkml/2013/7/22/649
and required to prevent the global_timer from becoming the broadcast
device, since the system will hang otherwise.

Soren Brinkmann (1):
  arm: zynq: Enable arm_global_timer

Stephen Boyd (1):
  tick: broadcast: Deny per-cpu clockevents from being broadcast sources

 arch/arm/boot/dts/zynq-7000.dtsi | 8 ++++++++
 arch/arm/mach-zynq/Kconfig       | 1 +
 kernel/time/tick-broadcast.c     | 3 +++
 3 files changed, 12 insertions(+)

-- 
1.8.4
