From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: msm8998: Fix compatible of scm node
Date: Mon, 03 Dec 2018 15:56:36 -0800
Message-ID: <154388139680.88331.14830807298283280853@swboyd.mtv.corp.google.com>
References: <20181130065655.26713-1-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181130065655.26713-1-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, David Brown <david.brown@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Bjorn Andersson (2018-11-29 22:56:55)
> The scm binding and driver was updated to rely on the fallback to the
> default qcom,scm for any modern SoC and as such both are required. Add
> the default compatible to make the scm instance probe.
> =

> Fixes: d850156a226a ("arm64: dts: qcom: msm8998: Add firmware node")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
