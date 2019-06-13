From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/9] Documentation: arm: Link idle-states binding to
 "enable-method" property
Date: Thu, 13 Jun 2019 17:13:38 -0600
Message-ID: <20190613231338.GA23667@bogus>
References: <cover.1558430617.git.amit.kucheria@linaro.org>
 <9dc4ce06143de48039e841c337fafa7cb9c8d7d2.1558430617.git.amit.kucheria@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <9dc4ce06143de48039e841c337fafa7cb9c8d7d2.1558430617.git.amit.kucheria@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Amit Kucheria <amit.kucheria@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org, agross@kernel.org, niklas.cassel@linaro.org, marc.w.gonzalez@free.fr, sibis@codeaurora.org, daniel.lezcano@linaro.org, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Li Yang <leoyang.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, 21 May 2019 15:05:12 +0530, Amit Kucheria wrote:
> The "enable-method" property for cpu nodes needs to be "psci" for CPU
> idle management to be setup correctly.
> 
> Add a note to the binding documentation to this effect to make it
> obvious.
> 
> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> Acked-by: Sudeep Holla <sudeep.holla@arm.com>
> ---
>  .../devicetree/bindings/arm/idle-states.txt         | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 

Applied, thanks.

Rob
