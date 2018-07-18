From: Edgar Bernardi Righi <edgar.righi@lsitec.org.br>
Subject: [PATCH v1 00/04] Add clock driver for Actions Semi S500 SoC
Date: Wed, 18 Jul 2018 12:27:56 -0300
Message-ID: <CADHB5bA2KiPSN32+G-Oyf9AfOkFrOB48sc54K5rFem9+xyWtAQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, linux@armlinux.org.uk, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, =?UTF-8?Q?Guilherme_G=2E_Sim=C3=B5es?= <guilherme.simoes@lsitec.org.br>, Jon maddog Hall <jon.maddog.hall@gmail.com>, mkzuffo@lsi.usp.br, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, sboyd@kernel.org, mark.rutland@arm.com, linux@cubietech.com, support@cubietech.com, catalin.marinas@arm.com, Michael Turquette <mturquette@baylibre.com>, will.deacon@arm.com, thomas liau <thomas.liau@actions-semi.com>, darren@cubietech.com, robh+dt@kernel.org, jeff.chen@actions-semi.com, pn@denx.de, mp-cs@actions-semi.com, Laisa Costa - LSI-TEC <laisa.costa@lsitec.org.br>
List-Id: devicetree@vger.kernel.org

This patchset adds clock support for Actions Semi Owl series S500 SoC
with relevant clock bindings and device tree info.

This patchset depends on patch "[PATCH v6 1/5] clk: actions: Add
missing REGMAP_MMIO dependency" by Saravanan Sekar.
This patchset depends on patch "[PATCH] clk: actions: Add custom delay
option to Actions Semi OWL pll clock driver" by Edgar Bernardi Righi.

Signed-off-by: Edgar Bernardi Righi <edgar.righi@lsitec.org.br>
