From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v1 01/04] clk: actions: Add Actions Semi S500 SoC clock support
Date: Tue, 24 Jul 2018 23:21:03 -0700
Message-ID: <153249966379.48062.8866967540355341765@swboyd.mtv.corp.google.com>
References: <CADHB5bAns1PmTvq=fG8Rc2S6orEh7wf5XYAGQONTKMsoYv-UTg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CADHB5bAns1PmTvq=fG8Rc2S6orEh7wf5XYAGQONTKMsoYv-UTg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Edgar Bernardi Righi <edgar.righi@lsitec.org.br>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: mark.rutland@arm.com, support@cubietech.com, Laisa Costa - LSI-TEC <laisa.costa@lsitec.org.br>, linux@cubietech.com, darren@cubietech.com, =?utf-8?q?Guilherme_G=2E_Sim=C3=B5es?= <guilherme.simoes@lsitec.org.br>, catalin.marinas@arm.com, Michael Turquette <mturquette@baylibre.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, mkzuffo@lsi.usp.br, linux@armlinux.org.uk, will.deacon@arm.com, jeff.chen@actions-semi.com, robh+dt@kernel.org, thomas liau <thomas.liau@actions-semi.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, pn@denx.de, =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, Jon maddog Hall <jon.maddog.hall@gmail.com>, mp-cs@actions-semi.com
List-Id: devicetree@vger.kernel.org

Quoting Edgar Bernardi Righi (2018-07-18 08:32:34)
> Add Actions Semi S500 SoC clock support.
> Basic clock support for S500 SoC was implemented using the Actions
> Semi Owl clock driver.
> Tested on a Lemaker Guitar board.
> =

> This patch depends on patch "[PATCH v6 1/5] clk: actions: Add missing
> REGMAP_MMIO dependency" by Saravanan Sekar.
> This patch depends on patch "[PATCH] clk: actions: Add custom delay
> option to Actions Semi OWL pll clock driver" by Edgar Bernardi Righi.

The depends list can be left out of the commit text and go below a
triple dash '---' after the sign-off chain.

> =

> File(s) created: "/drivers/clk/actions/owl-s500.c"
> File(s) updated: "/drivers/clk/actions/Makefile", "/drivers/clk/actions/K=
config"

Please remove these "Files created" messages from your patches.
Preferably use git to format your patches before sending too, but using
diff is OK too I guess.

> =

> Signed-off-by: Edgar Bernardi Righi <edgar.righi@lsitec.org.br>
> =

> diff -uprN -X vanilla/Documentation/dontdiff
> vanilla/drivers/clk/actions/Kconfig linux/drivers/clk/actions/Kconfig
