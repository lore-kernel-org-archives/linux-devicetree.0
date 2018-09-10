From: Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH 0/4] Enable the timer clock on DT MMP2
Date: Mon, 10 Sep 2018 13:30:27 +0200
Message-ID: <20180910113031.42634-1-lkundrak@v3.sk>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Eric Miao <eric.y.miao@gmail.com>, Haojian Zhuang <haojian.zhuang@gmail.com>, Russell King <linux@armlinux.org.uk>
List-Id: devicetree@vger.kernel.org

This makes the timer work for me on an OLPC 1.75, which is a
device-tree based MMP2 platform.
