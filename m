From: Paul Cercueil <paul@crapouillou.net>
Subject: Ingenic Timer/Counter Unit (TCU) patchset v12
Date: Tue, 21 May 2019 16:51:28 +0200
Message-ID: <20190521145141.9813-1-paul@crapouillou.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Lee Jones <lee.jones@linaro.org>
Cc: Mathieu Malaterre <malat@debian.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-mips@vger.kernel.org, linux-doc@vger.kernel.org, linux-clk@vger.kernel.org, od@zcrc.me
List-Id: devicetree@vger.kernel.org

Hi,

Here's the V12 of my patchset to add support for the Timer/Counter Unit
(TCU) present on the JZ47xx SoCs from Ingenic.

This patchset is much shorter at only 13 patches vs. 27 patches in V11;
the remaining patches will be sent in parallel (if applicable) or as a
follow-up patchset once this one is merged.

In V11 the clocksource maintainers weren't happy with the size of the
ingenic-timer driver, which included clocks and irqchip setup code.
On the other hand, devicetree maintainers wanted one single node for
the TCU hardware since it's effectively just one hardware block.

In this patchset the functionality is cut in four different drivers:
a MFD one to provide the regmap, probe the children and which provides
several API functions; a clocks driver; a irqchip driver; a clocksource
driver. All these drivers work with the same regmap, have the same
compatible strings, and will probe _with the same devicetree node_.

Regards,
-Paul
