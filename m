From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v13 00/13] Ingenic Timer/Counter Unit patchset v13
Date: Tue, 25 Jun 2019 00:57:46 +0200
Message-ID: <20190624225759.18299-1-paul@crapouillou.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Lee Jones <lee.jones@linaro.org>
Cc: Mathieu Malaterre <malat@debian.org>, od@zcrc.me, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linux-doc@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

This is the version 13 of my patchset to support the Timer/Counter Unit
(TCU) present in JZ47xx SoCs from Ingenic.

Changelog:

Patch [03/13]:
 - Revert back to v11. Turns out it was okay.
 - Remove 'interrupt-parent' of the list of required properties.

Patch [05/13]:
 - Don't enable/disable the TCU clock on demand. Enable it in the probe
   and call it a day.
 - Register suspend callbacks to gate/ungate the TCU clock on
   suspend/resume.
 - Use pr_fmt and pr_crit instead of custom TCU_ERR() macro
 - Remove useless dependency on COMMON_CLK in Kconfig
 - Remove registration of clkdev

All the other patches have not been modified.
The patchset was rebased on 5.2-rc6.

Cheers,
-Paul
