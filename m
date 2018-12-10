From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 1/4] dt-bindings/gic-v3: Add msm8996 compatible string
Date: Mon, 10 Dec 2018 16:19:38 -0600
Message-ID: <20181210221938.GA23517@bogus>
References: <20181210135633.30283-1-srinivas.kandagatla@linaro.org>
 <20181210135633.30283-2-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181210135633.30283-2-srinivas.kandagatla@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: marc.zyngier@arm.com, sudeep.holla@arm.com, tglx@linutronix.de, jason@lakedaemon.net, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, rnayak@codeaurora.org, sboyd@kernel.org, bjorn.andersson@linaro.org, nicolas.dechesne@linaro.org, ctatlor97@gmail.com, vkoul@kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: devicetree@vger.kernel.org

On Mon, 10 Dec 2018 13:56:30 +0000, Srinivas Kandagatla wrote:
> Access to GICR_WAKER is restricted on msm8996 SoC in Hypervisor.
> There are many devices out there with this restriction in place
> and there has been no update to this firmware since last few years,
> making those devices totally unusable for upstream development.
> 
> IIDR register value conflicts with other SoCs, using compatible seems
> to be the only way to apply quirks required for msm8996 based SoCs.
> 
> Without this quirk many qcom SoCs (atleast 3 that I know) are
> unable to boot mainline.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  .../devicetree/bindings/interrupt-controller/arm,gic-v3.txt   | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
