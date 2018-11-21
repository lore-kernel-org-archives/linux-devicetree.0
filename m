From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-mtp: Mark protected gcc clocks
Date: Wed, 21 Nov 2018 01:01:34 -0800
Message-ID: <154279089454.88331.1059903104788594574@swboyd.mtv.corp.google.com>
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

> This depends on the acceptance of
> https://lore.kernel.org/lkml/20181105194011.43770-1-swboyd@chromium.org/

Do you need me to merge this into clk-fixes so that Andy can send this
up for v4.20 final? I thought you may have other boot blocking issues so
this wouldn't be a critical fix.
