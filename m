Return-Path: <robherring2@gmail.com>
Date: Mon, 19 Feb 2018 12:34:05 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v7 2/2] dt-bindings/interrupt-controller: pdc: describe
 PDC device binding
Message-ID: <20180219183405.us2qjjza7sveahay@rob-hp-laptop>
References: <20180215212742.4675-1-ilina@codeaurora.org>
 <20180215212742.4675-3-ilina@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180215212742.4675-3-ilina@codeaurora.org>
To: Lina Iyer <ilina@codeaurora.org>
Cc: tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, rnayak@codeaurora.org, asathyak@codeaurora.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Thu, Feb 15, 2018 at 02:27:42PM -0700, Lina Iyer wrote:
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
>  .../bindings/interrupt-controller/qcom,pdc.txt     | 78 ++++++++++++++++++++++
>  1 file changed, 78 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt

Reviewed-by: Rob Herring <robh@kernel.org>
