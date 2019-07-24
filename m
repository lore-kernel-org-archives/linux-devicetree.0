From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v15 00/13] TCU patchset v15
Date: Wed, 24 Jul 2019 13:16:02 -0400
Message-ID: <20190724171615.20774-1-paul@crapouillou.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Lee Jones <lee.jones@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, od@zcrc.me, Mathieu Malaterre <malat@debian.org>
List-Id: devicetree@vger.kernel.org

Hi,

This is the V15 of my Ingenic TCU patchet.

The big change since V14 is that the custom MFD driver
(ex patch 04/13) was dropped in favor of a small patch to syscon
and a "simple-mfd" compatible.

The patchset was based on mips/mips-next, but all of them minus
the last one will apply cleanly on v5.3-rc1.

Changelog:

* [02/13]: Remove info about MFD driver
* [03/13]: Add "simple-mfd" compatible string
* [04/13]: New patch
* [05/13]: - Use CLK_OF_DECLARE_DRIVER since we use "simple-mfd"
           - Use device_node_to_regmap()
* [06/13]: Use device_node_to_regmap()
* [07/13]: Use device_node_to_regmap()
* [09/13]: Add "simple-mfd" compatible string

Cheers,
-Paul
