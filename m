From: Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH v2 0/4] Enable the timer clock on DT MMP2
Date: Tue, 18 Sep 2018 22:54:51 +0200
Message-ID: <20180918205455.25464-1-lkundrak@v3.sk>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Eric Miao <eric.y.miao@gmail.com>, Haojian Zhuang <haojian.zhuang@gmail.com>, Russell King <linux@armlinux.org.uk>
List-Id: devicetree@vger.kernel.org

This makes the timer work for me on an OLPC XO 1.75, which is a
device-tree based MMP2 platform.

Compared to v1 patch set, this makes the clock optional to keep compatibility
with older device trees or platforms with a compatible timer that don't seem
to require the clock.

Lubomir Rintel (4):
      dt-bindings: mrvl,mmp-timer: add clock
      DT: marvell,mmp2: add clock to the timer
      ARM: mmp2: initialize clocks before the timer
      ARM: mmp/mmp2: dt: enable the clock

Thanks,
Lubo
