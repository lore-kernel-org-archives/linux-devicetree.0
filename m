From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] clk: qcom: Add MSM8976/56 Global Clock Controller (GCC) driver
Date: Thu, 24 Jan 2019 11:22:55 -0800
Message-ID: <154835777525.136743.6424256006615217720@swboyd.mtv.corp.google.com>
References: <65fb363366f651e42d3e97792d5990185823cbc3.camel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <65fb363366f651e42d3e97792d5990185823cbc3.camel@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Michael Turquette <mturquette@baylibre.com>
Cc: AngeloGioacchino Del Regno <kholk11@gmail.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting AngeloGioacchino Del Regno (2019-01-12 07:03:18)
> From 50465f2a4454625aac622bb84dbecdeaf5a50904 Mon Sep 17 00:00:00 2001
> From: "Angelo G. Del Regno" <kholk11@gmail.com>
> Date: Sat, 12 Jan 2019 10:52:18 +0100
> Subject: [PATCH] clk: qcom: Add MSM8976/56 Global Clock Controller (GCC)
>  driver
>=20
> Add support for the global clock controller found on MSM8976
> and MSM8976 SoCs.
> Since the multimedia clocks are actually in the GCC on these
> SoCs, this will allow drivers to probe and control basically
> all the required clocks.
>=20
> Signed-off-by: Angelo G. Del Regno <kholk11@gmail.com>

Are you going to send out DTS bits and provide platform support? I'm not
interested in merging the clk bits and then having to support a driver
that never gets used.

Also, is this copy/pasted from some downstream kernel sources? Would be
good to have a pointer to that so we can compare and see if you've
changed anything.
