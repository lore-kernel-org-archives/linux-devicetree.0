From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] arm64: dts: sdm845-mtp: Reserve reserved gpios
Date: Sat, 03 Nov 2018 20:15:19 -0700
Message-ID: <154130131919.88331.12558287167971033698@swboyd.mtv.corp.google.com>
References: <20181102214532.17661-1-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181102214532.17661-1-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Quoting Bjorn Andersson (2018-11-02 14:45:32)
> With the introduction of commit 3edfb7bd76bd ("gpiolib: Show correct
> direction from the beginning") the gpiolib will attempt to read the
> direction of all pins, which triggers a read from protected register
> regions.
> =

> The pins 0 through 3 and 81 through 84 are protected, so mark these as
> reserved.
> =

> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
