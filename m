From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 4/6] reset: hi6220: Add support for AO reset controller
Date: Fri, 19 Apr 2019 13:13:46 -0700
Message-ID: <155570482647.15276.10153086772852393750@swboyd.mtv.corp.google.com>
References: <1555662781-22570-1-git-send-email-peter.griffin@linaro.org> <1555662781-22570-5-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1555662781-22570-5-git-send-email-peter.griffin@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Griffin <peter.griffin@linaro.org>, airlied@linux.ie, daniel@ffwll.ch, john.stultz@linaro.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, mark.rutland@arm.com, mturquette@baylibre.com, p.zabel@pengutronix.de, robh+dt@kernel.org, xuwei5@hisilicon.com, yuq825@gmail.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, lima@lists.freedesktop.org
List-Id: devicetree@vger.kernel.org

Quoting Peter Griffin (2019-04-19 01:32:59)
> This is required to bring Mali450 gpu out of reset. Also
> we now use CLK_OF_DECLARE_DRIVER to probe in both the
> clock and reset drivers. The clock and reset parts have
> been done as one atomic commit to avoid a bisection hole.
>=20
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> ---

>  drivers/clk/hisilicon/clk-hi6220.c        |  3 +-

Acked-by: Stephen Boyd <sboyd@kernel.org>
