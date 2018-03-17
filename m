From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v4 0/8] Ingenic JZ47xx Timer/Counter Unit drivers
Date: Sun, 18 Mar 2018 00:28:53 +0100
Message-ID: <20180317232901.14129-1-paul@crapouillou.net>
References: <20180110224838.16711-2-paul@crapouillou.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180110224838.16711-2-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Lee Jones <lee.jones@linaro.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Ralf Baechle <ralf@linux-mips.org>, Rob Herring <robh+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Mark Rutland <mark.rutland@arm.com>
Cc: James Hogan <jhogan@kernel.org>, Maarten ter Huurne <maarten@treewalker.org>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, linux-doc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

This is the 4th version of my TCU patchset.

The major change is a greatly improved documentation, both in-code
and as separate text files, to describe how the hardware works and
how the devicetree bindings should be used.

There are also cosmetic changes in the irqchip driver, and the
clocksource driver will now use as timers all TCU channels not
requested by the TCU PWM driver.

Cheers,
-Paul
