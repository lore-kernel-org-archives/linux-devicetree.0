From: Rob Herring <robh@kernel.org>
Subject: [PATCH 0/3] Versatile AB/PB clocksource support
Date: Wed, 28 Jan 2015 11:56:29 -0600
Message-ID: <1422467792-2065-1-git-send-email-robh@kernel.org>
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
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Rob Herring <robh@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The Versatile clocksource driver can also be used on Versatile AB and PB 
platforms, not just Versatile Express. This series adds support for 
those boards.

I've split this off from the rest of the Versatile DT and 
multi-platform support as I'm not going to get it in place for 3.20. 
This part is fairly trivial and is ready to go.

Daniel, Can you please take the whole series.

Rob

Rob Herring (3):
  dt/bindings: Add binding for Versatile system registers
  clocksource: versatile: adapt for Versatile AB and PB boards
  dts: versatile: add sysregs node

 Documentation/devicetree/bindings/arm/versatile-sysreg.txt | 10 ++++++++++
 arch/arm/boot/dts/versatile-ab.dts                         |  5 +++++
 drivers/clocksource/versatile.c                            |  4 +++-
 3 files changed, 18 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/arm/versatile-sysreg.txt

-- 
2.1.0
