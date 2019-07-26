From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v2 02/14] dt-bindings: cpufreq: Re-organise kryo cpufreq
 to use it for other nvmem based qcom socs
Date: Fri, 26 Jul 2019 13:34:17 +0530
Message-ID: <20190726080417.ohsgedbtyxbxfyj7@vireshk-i7>
References: <20190725104144.22924-1-niklas.cassel@linaro.org>
 <20190725104144.22924-3-niklas.cassel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190725104144.22924-3-niklas.cassel@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Niklas Cassel <niklas.cassel@linaro.org>
Cc: Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, Andy Gross <agross@kernel.org>, Ilia Lin <ilia.lin@kernel.org>, linux-arm-msm@vger.kernel.org, jorge.ramirez-ortiz@linaro.org, bjorn.andersson@linaro.org, ulf.hansson@linaro.org, Sricharan R <sricharan@codeaurora.org>, Rob Herring <robh@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

$subject of this and few more binding patches updated to:

"dt-bindings: opp: XXX"

On 25-07-19, 12:41, Niklas Cassel wrote:
> From: Sricharan R <sricharan@codeaurora.org>
> 
> The kryo cpufreq driver reads the nvmem cell and uses that data to
> populate the opps. There are other qcom cpufreq socs like krait which
> does similar thing. Except for the interpretation of the read data,
> rest of the driver is same for both the cases. So pull the common things
> out for reuse.
> 
> Signed-off-by: Sricharan R <sricharan@codeaurora.org>
> [niklas.cassel@linaro.org: split dt-binding into a separate patch and
> do not rename the compatible string.]
> Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
> Reviewed-by: Ilia Lin <ilia.lin@kernel.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
> Changes since V1:
> -Picked up tags.

-- 
viresh
