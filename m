From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 05/22] clk: at91: generated: set audio_pll_allowed in
 at91_clk_register_generated()
Date: Wed, 17 Oct 2018 10:49:49 -0700
Message-ID: <153979858914.5275.16522645452377539139@swboyd.mtv.corp.google.com>
References: <20181016142200.19741-1-alexandre.belloni@bootlin.com>
 <20181016142200.19741-6-alexandre.belloni@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181016142200.19741-6-alexandre.belloni@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>, Michael Turquette <mturquette@baylibre.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>
List-Id: devicetree@vger.kernel.org

Quoting Alexandre Belloni (2018-10-16 07:21:43)
> Set gck->audio_pll_allowed in at91_clk_register_generated. This makes it
> easier to do it from code that is not parsing device tree.
> =

> Also, this fixes an issue where the resulting clk_hw can be dereferenced
> before being tested for error.
> =

> Fixes: 1a1a36d72e3d ("clk: at91: clk-generated: make gclk determine audio=
_pll rate")
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> ---

Applied to clk-next
