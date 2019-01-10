From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v11 1/9] dt-bindings: opp: Introduce opp-level bindings
Date: Thu, 10 Jan 2019 11:56:54 +0530
Message-ID: <20190110062654.3ukmgorqdw5tist5@vireshk-i7>
References: <20190110040209.6028-1-rnayak@codeaurora.org>
 <20190110040209.6028-2-rnayak@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190110040209.6028-2-rnayak@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rajendra Nayak <rnayak@codeaurora.org>
Cc: andy.gross@linaro.org, robh@kernel.org, sboyd@kernel.org, ulf.hansson@linaro.org, collinsd@codeaurora.org, mka@chromium.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, henryc.chen@mediatek.com
List-Id: devicetree@vger.kernel.org

On 10-01-19, 09:32, Rajendra Nayak wrote:
> Add opp-level as an additional property in the OPP node to describe
> the performance level of the device.
> 
> On some SoCs (especially from Qualcomm and MediaTek) this value
> is communicated to a remote microprocessor by the CPU, which
> then takes some actions (like adjusting voltage values across various
> rails) based on the value passed.
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/opp/opp.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/opp/opp.txt b/Documentation/devicetree/bindings/opp/opp.txt
> index c396c4c0af92..76b6c79604a5 100644
> --- a/Documentation/devicetree/bindings/opp/opp.txt
> +++ b/Documentation/devicetree/bindings/opp/opp.txt
> @@ -129,6 +129,9 @@ Optional properties:
>  - opp-microamp-<name>: Named opp-microamp property. Similar to
>    opp-microvolt-<name> property, but for microamp instead.
>  
> +- opp-level: A value representing the performance level of the device,
> +  expressed as a 32-bit integer.
> +
>  - clock-latency-ns: Specifies the maximum possible transition latency (in
>    nanoseconds) for switching to this OPP from any other OPP.

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
