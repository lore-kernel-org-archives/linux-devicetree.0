From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] arm64: dts: qcom: sdm845: Sort nodes in the soc by
 address
Date: Mon, 7 May 2018 11:49:00 -0700
Message-ID: <20180507184900.GH2259@tuxbook-pro>
References: <20180504220356.261711-1-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180504220356.261711-1-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Douglas Anderson <dianders@chromium.org>
Cc: Andy Gross <andy.gross@linaro.org>, swboyd@chromium.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, David Brown <david.brown@linaro.org>, Will Deacon <will.deacon@arm.com>, Mark Rutland <mark.rutland@arm.com>, linux-soc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri 04 May 15:03 PDT 2018, Douglas Anderson wrote:

> This is pure-churn and should be a no-op.  I'm doing it in the hopes
> of reducing merge conflicts.  When things are sorted in a sane way
> (and by base address seems sane) then it's less likely that future
> patches will cause merge conflicts.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Nice, I like it.

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn
