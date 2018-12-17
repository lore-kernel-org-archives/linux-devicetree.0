From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 05/13] clk: qcom: apcs-msm8916: get parent clock names from DT
Date: Mon, 17 Dec 2018 15:37:43 -0800
Message-ID: <154508986359.19322.1555129141976726505@swboyd.mtv.corp.google.com>
References: <1545039990-19984-1-git-send-email-jorge.ramirez-ortiz@linaro.org> <1545039990-19984-6-git-send-email-jorge.ramirez-ortiz@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1545039990-19984-6-git-send-email-jorge.ramirez-ortiz@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org, david.brown@linaro.org, jassisinghbrar@gmail.com, jorge.ramirez-ortiz@linaro.org, mark.rutland@arm.com, mturquette@baylibre.com, robh+dt@kernel.org, will.deacon@arm.com
Cc: bjorn.andersson@linaro.org, vkoul@kernel.org, niklas.cassel@linaro.org, sibis@codeaurora.org, georgi.djakov@linaro.org, arnd@arndb.de, horms+renesas@verge.net.au, heiko@sntech.de, enric.balletbo@collabora.com, jagan@amarulasolutions.com, olof@lixom.net, amit.kucheria@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Jorge Ramirez-Ortiz (2018-12-17 01:46:22)
> Allow accessing the parent clock names required for the driver
> operation by using the device tree node.
>=20
> This permits extending the driver to other platforms without having to
> modify its source code.
>=20
> For backwards compatibility leave previous values as default.

Why do we need to maintain backwards compatibility? Isn't is required
that the nodes have clocks properties?
