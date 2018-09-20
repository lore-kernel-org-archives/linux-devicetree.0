From: Andy Gross <andy.gross@linaro.org>
Subject: Re: [PATCH v3 09/16] arm: dts: msm8974: thermal: split address space
 into two
Date: Thu, 20 Sep 2018 11:57:28 -0700
Message-ID: <20180920185728.GA28458@hector.localdomain>
References: <cover.1536744310.git.amit.kucheria@linaro.org>
 <088724896f21d556ecf1e16a6c59c0e404444fa6.1536744310.git.amit.kucheria@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <088724896f21d556ecf1e16a6c59c0e404444fa6.1536744310.git.amit.kucheria@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Amit Kucheria <amit.kucheria@linaro.org>
Cc: linux-kernel@vger.kernel.org, rnayak@codeaurora.org, linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org, edubezval@gmail.com, smohanad@codeaurora.org, dianders@chromium.org, mka@chromium.org, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-soc@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Sep 12, 2018 at 03:22:54PM +0530, Amit Kucheria wrote:
> We've earlier added support to split the register address space into TM
> and SROT regions. Split up the regmap address space into two for msm8974
> that has a similar register layout.
> 
> Since tsens-common.c/init_common() currently only registers one address
> space, the order is important (TM before SROT).  This is OK since the
> code doesn't really use the SROT functionality yet.
> 
> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> ---

Acked-by: Andy Gross <andy.gross@linaro.org>
