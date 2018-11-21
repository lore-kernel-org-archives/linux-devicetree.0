From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-mtp: Mark protected gcc clocks
Date: Wed, 21 Nov 2018 01:07:38 -0800
Message-ID: <154279125838.88331.18392289591312243428@swboyd.mtv.corp.google.com>
References: <20181106055013.11271-1-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181106055013.11271-1-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Bjorn Andersson (2018-11-05 21:50:13)
> As of v4.20-rc1 probing the GCC driver on a SDM845 device with the
> standard security implementation causes an access violation and an
> immediate system restart. Use the protected-clocks property to mark the
> offending clocks protected for the MTP, in order to allow it to boot.
> =

> Cc: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> =


Sorry, I meant to say do you want me to send in the protected clk
patches into clk-fixes so it can be merged for v4.20 final. I expected
Andy to pick up these dts patches.
