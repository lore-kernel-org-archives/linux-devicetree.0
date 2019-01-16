From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] arm64: dts: sdm845: Add lpasscc node
Date: Wed, 16 Jan 2019 08:55:45 -0800
Message-ID: <154765774593.169631.13437519610171417596@swboyd.mtv.corp.google.com>
References: <1543996836-16717-1-git-send-email-tdas@codeaurora.org> <20190116060910.GA6841@builder>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190116060910.GA6841@builder>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Taniya Das <tdas@codeaurora.org>
Cc: Andy Gross <andy.gross@linaro.org>, linux-arm-msm@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, david.brown@linaro.org, Mark Rutland <mark.rutland@arm.com>, linux-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Bjorn Andersson (2019-01-15 22:09:10)
> On Wed 05 Dec 00:00 PST 2018, Taniya Das wrote:
>=20
> > This adds the low pass audio clock controller node to sdm845 based on
> > the example in the bindings.
> >=20
>=20
> Applying this causes my MTP to reboot as clk_disable_unused() tries to
> disable "lpass_qdsp6ss_core_clk". Am I missing something?
>=20

Probably you need this patch[1] so that this "essential" clk isn't
turned off during clk late init.

[1] https://lkml.kernel.org/r/1545306385-31240-1-git-send-email-tdas@codeau=
rora.org
