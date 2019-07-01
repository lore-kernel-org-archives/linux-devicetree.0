From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v14 00/13] Ingenic TCU patchset v14
Date: Mon,  1 Jul 2019 17:13:57 +0200
Message-ID: <20190701151410.23127-1-paul@crapouillou.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>, Jonathan Corbet <corbet@lwn.net>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Mathieu Malaterre <malat@debian.org>, od@zcrc.me, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-mips@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

Changelog from v13:

- [02/13]: The documentation has been converted to ReStructured Text.
- [04/13]: - Use ERR_CAST() instead of ERR_PTR(PTR_ERR())
           - Remove ingenic_tcu_can_use_pwm().
- [05/13]: Use %d instead of %i in messages
- [06/13]: Remove empty lines in structure definitions
- [07/13]: Remove empty lines in structure definitions

The patches that are not listed above did not see any change since v13.

Regards,
-Paul
