From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] clk: qcom: Add CLK_SET_RATE_PARENT for 8998 branch clocks
Date: Wed, 09 Jan 2019 10:59:12 -0800
Message-ID: <154706035216.15366.40165828357929779@swboyd.mtv.corp.google.com>
References: <1545099134-26471-1-git-send-email-jhugo@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1545099134-26471-1-git-send-email-jhugo@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: mark.rutland@arm.com, mturquette@baylibre.com, robh+dt@kernel.org
Cc: bjorn.andersson@linaro.org, marc.w.gonzalez@free.fr, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Jeffrey Hugo <jhugo@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Quoting Jeffrey Hugo (2018-12-17 18:12:14)
> A branch clock is basically a clock that can be gated for power savings,
> but is also what devices/drivers consume.  Configuring a branch clock's
> rate needs to be done at the source, so for all branch clocks which have
> a defined parent, set CLK_SET_RATE_PARENT so that clk_set_rate() calls on
> branch clocks can do what is expected.  This is important as most drivers
> do not check the resulting clock rate after a successful clk_set_rate()
> call, thus the driver may get out of sync with the actual hardware state
> and weird issues might crop up.  This has been observed with issues
> getting SDHCI to reliably support "fast" cards such as SDR104.
>=20
> Fixes: 4807c71cc688 (arm64: dts: Add msm8998 SoC and MTP board support)
> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
> ---

Applied to clk-next
