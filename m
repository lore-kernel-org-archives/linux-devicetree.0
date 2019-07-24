From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 01/13] dt-bindings: cpufreq: Re-organise kryo cpufreq to
 use it for other nvmem based qcom socs
Date: Wed, 24 Jul 2019 08:53:22 -0600
Message-ID: <20190724145322.GA4233@bogus>
References: <20190705095726.21433-1-niklas.cassel@linaro.org>
 <20190705095726.21433-2-niklas.cassel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190705095726.21433-2-niklas.cassel@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, Ilia Lin <ilia.lin@kernel.org>, Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org, jorge.ramirez-ortiz@linaro.org, bjorn.andersson@linaro.org, ulf.hansson@linaro.org, Sricharan R <sricharan@codeaurora.org>, Niklas Cassel <niklas.cassel@linaro.org>, Mark Rutland <mark.rutland@arm.com>, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri,  5 Jul 2019 11:57:12 +0200, Niklas Cassel wrote:
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
> ---
> Changes since RFC:
> -Made DT bindings a separate patch.
> -Keep the original compatible string, since renaming it breaks DT
> backwards compatibility.
> 
>  .../opp/{kryo-cpufreq.txt => qcom-nvmem-cpufreq.txt}   | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>  rename Documentation/devicetree/bindings/opp/{kryo-cpufreq.txt => qcom-nvmem-cpufreq.txt} (98%)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
