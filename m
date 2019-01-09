From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v1 1/6] clk: qcom: Add missing freq for usb30_master_clk on 8998
Date: Wed, 09 Jan 2019 10:59:18 -0800
Message-ID: <154706035805.15366.6771584987166910977@swboyd.mtv.corp.google.com>
References: <1546620586-2352-1-git-send-email-jhugo@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1546620586-2352-1-git-send-email-jhugo@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: mturquette@baylibre.com
Cc: bjorn.andersson@linaro.org, andy.gross@linaro.org, david.brown@linaro.org, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, kishon@ti.com, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, gregkh@linuxfoundation.org, balbi@kernel.org, linux-usb@vger.kernel.org, Jeffrey Hugo <jhugo@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Quoting Jeffrey Hugo (2019-01-04 08:49:46)
> The usb30_master_clk supports a 60Mhz frequency, but that is missing from
> the table of supported frequencies.  Add it.
>=20
> Fixes: b5f5f525c547 (clk: qcom: Add MSM8998 Global Clock Control (GCC) dr=
iver)
> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
> ---

Applied to clk-next
