From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH V3 1/2] clk: imx6sx: add missing lvds2 clock to the clock tree
Date: Fri, 04 May 2018 19:57:15 -0700
Message-ID: <152548903523.138124.11755955848234075756@swboyd.mtv.corp.google.com>
References: <1524209891-14146-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1524209891-14146-1-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <Anson.Huang@nxp.com>, fabio.estevam@nxp.com, kernel@pengutronix.de, mark.rutland@arm.com, mturquette@baylibre.com, robh+dt@kernel.org, shawnguo@kernel.org, shengjiu.wang@nxp.com
Cc: Linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Anson Huang (2018-04-20 00:38:10)
> i.MX6SX has lvds2 (analog clock2), an I/O clock like lvds1.
> And this lvds2, along with lvds1, can be used to provide
> external clock source to the internal pll, such as pll4_audio
> and pll5_video.
> =

> This patch mainly adds the lvds2 to the clock tree and fix its
> relationship with pll accordingly.
> =

> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---

Applied to clk-next
