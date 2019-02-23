From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: qcom_spmi: Document pms405 support
Date: Fri, 22 Feb 2019 18:44:55 -0600
Message-ID: <20190223004455.GA8453@bogus>
References: <1548675904-18324-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <1548675904-18324-2-git-send-email-jorge.ramirez-ortiz@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1548675904-18324-2-git-send-email-jorge.ramirez-ortiz@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: jorge.ramirez-ortiz@linaro.org, lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, bjorn.andersson@linaro.org, vinod.koul@linaro.org, niklas.cassel@linaro.org, khasim.mohammed@linaro.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, 28 Jan 2019 12:45:02 +0100, Jorge Ramirez-Ortiz wrote:
> The PMS405 supports 5 SMPS and 13 LDO regulators.
> 
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> ---
>  .../bindings/regulator/qcom,spmi-regulator.txt     | 24 ++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
