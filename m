From: Sibi Sankar <sibis@codeaurora.org>
Subject: Re: [PATCH v3 1/6] dt-bindings: opp: Introduce opp-peak-KBps and
 opp-avg-KBps bindings
Date: Tue, 16 Jul 2019 22:55:01 +0530
Message-ID: <98b2e315-e8da-80ad-1ef8-e6b222c1c6fe@codeaurora.org>
References: <20190703011020.151615-1-saravanak@google.com>
 <20190703011020.151615-2-saravanak@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190703011020.151615-2-saravanak@google.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Saravana Kannan <saravanak@google.com>, Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: vincent.guittot@linaro.org, seansw@qti.qualcomm.com, daidavid1@codeaurora.org, Rajendra Nayak <rnayak@codeaurora.org>, bjorn.andersson@linaro.org, evgreen@chromium.org, kernel-team@android.com, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hey Saravana,

https://patchwork.kernel.org/patch/10850815/
There was already a discussion ^^ on how bandwidth bindings were to be
named.

On 7/3/19 6:40 AM, Saravana Kannan wrote:
> Interconnects often quantify their performance points in terms of
> bandwidth. So, add opp-peak-KBps (required) and opp-avg-KBps (optional) to
> allow specifying Bandwidth OPP tables in DT.
> 
> opp-peak-KBps is a required property that replace opp-hz for Bandwidth OPP
> tables.
> 
> opp-avg-KBps is an optional property that can be used in Bandwidth OPP
> tables.
> 
> Signed-off-by: Saravana Kannan <saravanak@google.com>
> ---
>   Documentation/devicetree/bindings/opp/opp.txt | 15 ++++++++++++---
>   1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/opp/opp.txt b/Documentation/devicetree/bindings/opp/opp.txt
> index 76b6c79604a5..c869e87caa2a 100644
> --- a/Documentation/devicetree/bindings/opp/opp.txt
> +++ b/Documentation/devicetree/bindings/opp/opp.txt
> @@ -83,9 +83,14 @@ properties.
>   
>   Required properties:
>   - opp-hz: Frequency in Hz, expressed as a 64-bit big-endian integer. This is a
> -  required property for all device nodes but devices like power domains. The
> -  power domain nodes must have another (implementation dependent) property which
> -  uniquely identifies the OPP nodes.
> +  required property for all device nodes but for devices like power domains or
> +  bandwidth opp tables. The power domain nodes must have another (implementation
> +  dependent) property which uniquely identifies the OPP nodes. The interconnect
> +  opps are required to have the opp-peak-bw property.
> +
> +- opp-peak-KBps: Peak bandwidth in kilobytes per second, expressed as a 32-bit
> +  big-endian integer. This is a required property for all devices that don't
> +  have opp-hz. For example, bandwidth OPP tables for interconnect paths.
>   
>   Optional properties:
>   - opp-microvolt: voltage in micro Volts.
> @@ -132,6 +137,10 @@ Optional properties:
>   - opp-level: A value representing the performance level of the device,
>     expressed as a 32-bit integer.
>   
> +- opp-avg-KBps: Average bandwidth in kilobytes per second, expressed as a
> +  32-bit big-endian integer. This property is only meaningful in OPP tables
> +  where opp-peak-KBps is present.
> +
>   - clock-latency-ns: Specifies the maximum possible transition latency (in
>     nanoseconds) for switching to this OPP from any other OPP.
>   
> 

-- 
Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc, is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
