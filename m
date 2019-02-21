From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: marvell,mmp2: Add clock id for the LCDC clock
Date: Thu, 21 Feb 2019 13:53:41 -0800
Message-ID: <155078602184.77512.6860842537619686021@swboyd.mtv.corp.google.com>
References: <20190121063129.552580-1-lkundrak@v3.sk> <20190121063129.552580-2-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190121063129.552580-2-lkundrak@v3.sk>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>
List-Id: devicetree@vger.kernel.org

Quoting Lubomir Rintel (2019-01-20 22:31:28)
> The peripheral clock is required for access the the LCDC registers. It
> is in fact separate from the "AXI clock" that is optionally used to
> generate the pixel clock and as such requires a separate clock id.
>=20
> Link: https://lists.freedesktop.org/archives/dri-devel/2019-January/20397=
5.html
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> ---

Applied to clk-next
