From: Rob Herring <robh@kernel.org>
Subject: Re: [(RFC) PATCH v2 7/7] soc: qcom: aoss-qmp: Add cooling device
 support
Date: Fri, 11 Jan 2019 16:11:29 -0600
Message-ID: <20190111221129.GA25616@bogus>
References: <20190106080915.4493-1-bjorn.andersson@linaro.org>
 <20190106080915.4493-8-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190106080915.4493-8-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Ulf Hansson <ulf.hansson@linaro.org>, Arun Kumar Neelakantam <aneela@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sun, Jan 06, 2019 at 12:09:15AM -0800, Bjorn Andersson wrote:
> The AOSS provides three cooling devices "cx", "mx" and "ebi" that must
> be enabled when temperature goes below a certain level to counter low
> temperature issues. Probe these devices, when described in DeviceTree.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> We do not yet have the necessary support in the thermal framework to implement
> the cooling device associated with the QMP, so I've just included this patch as
> an RFC in this series.

I'd be fine if you include the binding part now. Looks fine to me.

> 
>  .../bindings/soc/qcom/qcom,aoss-qmp.txt       | 18 ++++++++++
>  drivers/soc/qcom/aoss-qmp.c                   | 36 +++++++++++++++++++
>  2 files changed, 54 insertions(+)
