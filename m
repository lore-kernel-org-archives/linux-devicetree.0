From: David Collins <collinsd@codeaurora.org>
Subject: Re: [PATCH v2 2/6] dt-bindings: opp: Introduce qcom-opp bindings
Date: Fri, 25 May 2018 15:33:43 -0700
Message-ID: <67054dca-33a8-7e7c-6218-dc5abf84f6d8@codeaurora.org>
References: <20180525100121.28214-1-rnayak@codeaurora.org>
 <20180525100121.28214-3-rnayak@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180525100121.28214-3-rnayak@codeaurora.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rajendra Nayak <rnayak@codeaurora.org>, viresh.kumar@linaro.org, sboyd@kernel.org, andy.gross@linaro.org, ulf.hansson@linaro.org
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello Rajendra,

On 05/25/2018 03:01 AM, Rajendra Nayak wrote:
> On Qualcomm platforms, an OPP node needs to describe an

s/Qualcomm/Qualcomm Technologies, Inc./


> additional level/corner value that is then communicated to
> a remote microprocessor by the CPU, which then takes some
> actions (like adjusting voltage values across various rails)
> based on the value passed.
> 
> Describe these bindings in the qcom-opp bindings document.
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/opp/qcom-opp.txt      | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/opp/qcom-opp.txt
> 
> diff --git a/Documentation/devicetree/bindings/opp/qcom-opp.txt b/Documentation/devicetree/bindings/opp/qcom-opp.txt
> new file mode 100644
> index 000000000000..db4d970c7ec7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/opp/qcom-opp.txt
> @@ -0,0 +1,25 @@
> +Qualcomm OPP bindings to descibe OPP nodes with corner/level values

s/Qualcomm/Qualcomm Technologies, Inc./ ?

s/descibe/describe/


> +
> +OPP tables for devices on Qualcomm platforms require an additional

s/Qualcomm/Qualcomm Technologies, Inc./


> +platform specific corner/level value to be specified.
> +This value is passed on to the RPM (Resource Power Manager) by

Do you want to mention RPMh here as well?


> +the CPU, which then takes the necessary actions to set a voltage
> +rail to an appropriate voltage based on the value passed.
> +
> +The bindings are based on top of the operating-points-v2 bindings
> +described in Documentation/devicetree/bindings/opp/opp.txt
> +Additional properties are described below.
> +
> +* OPP Table Node
> +
> +Required properties:
> +- compatible: Allow OPPs to express their compatibility. It should be:
> +  "operating-points-v2-qcom-level"
> +
> +* OPP Node
> +
> +Required properties:
> +- qcom,level: On Qualcomm platforms an OPP node can describe a positive value

s/Qualcomm/Qualcomm Technologies, Inc./


> +representing a corner/level that's communicated with a remote microprocessor
> +(usually called the RPM) which then translates it into a certain voltage on
> +a voltage rail.

Should these lines be indented 2 spaces as is the case for the compatible
property above?

Could you add an example for both RPM and RPMh in this binding file?

Thanks,
David

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
