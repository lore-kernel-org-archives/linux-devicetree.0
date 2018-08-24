From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: sdm845-mtp: Add nodes for USB
Date: Fri, 24 Aug 2018 09:13:37 -0700
Message-ID: <153512721757.28926.8065711677671939620@swboyd.mtv.corp.google.com>
References: <20180822173629.202885-1-dianders@chromium.org>
 <20180822173629.202885-4-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180822173629.202885-4-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, tfiga@chromium.org, Manu Gautam <mgautam@codeaurora.org>, David Collins <collinsd@codeaurora.org>, Vivek Gautam <vivek.gautam@codeaurora.org>, Douglas Anderson <dianders@chromium.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>, linux-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Douglas Anderson (2018-08-22 10:36:29)
> Set the various nodes to "okay" and hook up the regulators.
> =

> NOTE: For now the main USB port (the one that goes out the Type C
> connector) is forced to host.  Eventually someone will need to get the
> Type C detection hooked up and get this all integrated with the
> PMI8998 PMIC.  The reason for forcing to "host" in the meantime is
> that this will leave us with one "host" and one "peripheral" port.
> =

> In order for host mode this to work, we assume that the bootloader
> left things configured enough for us.  Apparently the magic for that
> is is to do these writes on pmi8998:
> - pm_comm_write_byte(2, 0x1153, 0x2C, 0);
> - pm_comm_write_byte(2, 0x1152, 0x07, 0);
> - pm_comm_write_byte(2, 0x1140, 0x00, 0);
> - pm_comm_write_byte(2, 0x1140, 0x01, 0);
> =

> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
