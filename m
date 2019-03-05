From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] dt-bindings: clock: imx8mq: Fix numbering overlaps and gaps
Date: Tue, 05 Mar 2019 10:38:29 -0800
Message-ID: <155181110921.20095.1641360339603928947@swboyd.mtv.corp.google.com>
References: <1551779342-2640-1-git-send-email-abel.vesa@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1551779342-2640-1-git-send-email-abel.vesa@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Fabio Estevam <fabio.estevam@nxp.com>, Lucas Stach <l.stach@pengutronix.de>, Mark Rutland <mark.rutland@arm.com>, Patrick Wildt <patrick@blueri.se>, Rob Herring <robh@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Abel Vesa <abel.vesa@nxp.com>
List-Id: devicetree@vger.kernel.org

Quoting Abel Vesa (2019-03-05 01:49:16)
> IMX8MQ_CLK_USB_PHY_REF changes from 163 to 153, this way removing the gap.
> All the following clock ids are now decreased by 10 to keep the numbering
> right. Doing this, the IMX8MQ_CLK_CSI2_CORE is not overlapped with
> IMX8MQ_CLK_GPT1 anymore. IMX8MQ_CLK_GPT1_ROOT changes from 193 to 183 and
> all the following ids are updated accordingly.

Why do the numbers need to be consecutive? This looks difficult to merge
given that the commit that's being "fixed" is in v5.0 and thus the
integer value of these defines is pretty much an ABI. So if there are
holes in the space, I suggest we leave them there unless something is
really wrong or unworkable with that solution.

BTW, it would be great if the binding header was generated once and then
never changed again so that we don't have to spend time on these sorts
of patches in the future. Please try to fully describe each possible clk
that might be used with a particular binding instead of adding new clk
ids over time, especially if you have access to the silicon manufacturer
documentation and can easily figure out all the clks that are there
beforehand.
