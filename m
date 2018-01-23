From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH RFC 2/4] dt-bindings/interrupt-controller: pdc: descibe
 PDC device binding
Date: Tue, 23 Jan 2018 18:09:11 +0000
Message-ID: <eb959e8b-604b-b38c-f8ad-de7b4bd3963f@arm.com>
References: <20180123175656.11942-1-ilina@codeaurora.org>
 <20180123175656.11942-3-ilina@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180123175656.11942-3-ilina@codeaurora.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Lina Iyer <ilina@codeaurora.org>
Cc: tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, Sudeep Holla <sudeep.holla@arm.com>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, sboyd@codeaurora.org, rnayak@codeaurora.org, asathyak@codeaurora.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 23/01/18 17:56, Lina Iyer wrote:
> From: Archana Sathyakumar <asathyak@codeaurora.org>
> 
> Add device binding documentation for the PDC Interrupt controller on
> QCOM SoC's like the SDM845. The interrupt-controller can be used to
> sense edge low interrupts and wakeup interrupts when the GIC is
> non-operational.
> 
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Archana Sathyakumar <asathyak@codeaurora.org>
> Signed-off-by: Lina Iyer <ilina@codeaurora.org>
> ---
>  .../bindings/interrupt-controller/qcom,pdc.txt     | 55 ++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt
> new file mode 100644
> index 000000000000..c4592bbf678d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt
> @@ -0,0 +1,55 @@
> +PDC interrupt controller
> +
> +Qualcomm Technologies Inc. SoCs based on the RPM Hardened archicture have a
> +Power Domain Controller (PDC) that is on always-on domain. In addition to
> +providing power control for the power domains, the hardware also has an
> +interrupt controller that can be used to help detect edge low interrupts as
> +well detect interrupts when the GIC is non-operational.
> +
> +GIC is parent interrupt controller at the highest level. Platform interrupt
> +controller PDC is next in hierarchy, followed by others.

> This driver only configures the interrupts, does not handle them.

Not sure if the above statement belongs to the binding.

-- 
Regards,
Sudeep
