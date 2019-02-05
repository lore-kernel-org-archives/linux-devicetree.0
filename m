From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v1 1/4] clk: qcom: smd: Add XO clock for MSM8998
Date: Tue, 05 Feb 2019 14:01:29 -0800
Message-ID: <154940408967.169292.15276398799323074789@swboyd.mtv.corp.google.com>
References: <1548866102-30224-1-git-send-email-jhugo@codeaurora.org> <1548866144-30265-1-git-send-email-jhugo@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1548866144-30265-1-git-send-email-jhugo@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bjorn.andersson@linaro.org, mturquette@baylibre.com
Cc: marc.w.gonzalez@free.fr, andy.gross@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Jeffrey Hugo <jhugo@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Quoting Jeffrey Hugo (2019-01-30 08:35:44)
> The XO clock generally feeds into other clock controllers as the parent
> for a lot of clock generators.
>=20
> Fixes: 6131dc81211c (clk: qcom: smd: Add support for MSM8998 rpm clocks)
> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>

We've historically left out the XO clk because it causes problems where
the XO vote goes away during late init because nobody references it from
the rest of the clk tree and also because RPM defers probe of the system
and then the console blows up when it gets a clk that can't change rate.
See commit 54823af9cd52 ("clk: qcom: Always add factor clock for xo
clocks") for some more info on why we removed all the workarounds and
stuff around here too.

So are you sure this is OK to do?
=20
