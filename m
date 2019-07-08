From: Ilia Lin <ilia.lin@kernel.org>
Subject: Re: [PATCH 03/13] dt-bindings: cpufreq: qcom-nvmem: Make speedbin
 related properties optional
Date: Mon, 8 Jul 2019 09:28:53 +0300
Message-ID: <CA+5LGR22k7cshDiiM=nv4BUtZko8JLoW3-ZjYgsdPkcedstDtQ@mail.gmail.com>
References: <20190705095726.21433-1-niklas.cassel@linaro.org> <20190705095726.21433-4-niklas.cassel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190705095726.21433-4-niklas.cassel@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Niklas Cassel <niklas.cassel@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Ilia Lin <ilia.lin@kernel.org>, Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org, jorge.ramirez-ortiz@linaro.org, bjorn.andersson@linaro.org, ulf.hansson@linaro.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Reviewed-by: Ilia Lin <ilia.lin@kernel.org>

On Fri, Jul 5, 2019 at 12:58 PM Niklas Cassel <niklas.cassel@linaro.org> wrote:
>
> Not all Qualcomm platforms need to care about the speedbin efuse,
> nor the value blown into the speedbin efuse.
> Therefore, make the nvmem-cells and opp-supported-hw properties
> optional.
>
> Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
> ---
>  Documentation/devicetree/bindings/opp/qcom-nvmem-cpufreq.txt | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/opp/qcom-nvmem-cpufreq.txt b/Documentation/devicetree/bindings/opp/qcom-nvmem-cpufreq.txt
> index 198441e80ba8..c5ea8b90e35d 100644
> --- a/Documentation/devicetree/bindings/opp/qcom-nvmem-cpufreq.txt
> +++ b/Documentation/devicetree/bindings/opp/qcom-nvmem-cpufreq.txt
> @@ -20,6 +20,10 @@ In 'cpus' nodes:
>  In 'operating-points-v2' table:
>  - compatible: Should be
>         - 'operating-points-v2-kryo-cpu' for apq8096 and msm8996.
> +
> +Optional properties:
> +--------------------
> +In 'operating-points-v2' table:
>  - nvmem-cells: A phandle pointing to a nvmem-cells node representing the
>                 efuse registers that has information about the
>                 speedbin that is used to select the right frequency/voltage
> --
> 2.21.0
>
