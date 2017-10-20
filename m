From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 1/3] dt-bindings: soc: qcom: Support GLINK intents
Date: Thu, 19 Oct 2017 22:00:49 -0700
Message-ID: <CAOCOHw75mrusG6XPXwKV7UDUt2gFZfU_MyUZxryk4YziCGinNg@mail.gmail.com>
References: <1508375418-15611-1-git-send-email-clew@codeaurora.org> <1508375418-15611-2-git-send-email-clew@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1508375418-15611-2-git-send-email-clew@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Chris Lew <clew@codeaurora.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arun Kumar Neelakantam <aneela@codeaurora.org>, smaliyap@codeaurora.org, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed 18 Oct 18:10 PDT 2017, Chris Lew wrote:

> Virtual GLINK channels may know what throughput to expect from a
> remoteproc. An intent advertises to the remoteproc this channel is
> ready to receive data. Allow a channel to define the size and amount of
> intents to be prequeued.
>
> Signed-off-by: Chris Lew <clew@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/soc/qcom/qcom,glink.txt | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,glink.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,glink.txt
> index b277eca861f7..6c21f76822ca 100644
> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,glink.txt
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,glink.txt
> @@ -39,6 +39,14 @@ of these nodes are defined by the individual bindings for the specific function
>   Definition: a list of channels tied to this function, used for matching
>      the function to a set of virtual channels
>
> +- intents:

qcom,intents or qcom,default-intents

> + Usage: optional
> + Value type: <prop-encoded-array>
> + Definition: a list of size,amount pairs describing what intents should
> +    be preallocated for this virtual channel. If a GLINK node
> +    supports intents, an intent advertises this channel is ready
> +    to receive data.

Rather than describing what a GLINK intent is I would suggest that you
replace this second sentence with something like "This can be used to
tweak the default intents available for the channel to meet expectations
of the remote."

> +
>  = EXAMPLE
>  The following example represents the GLINK RPM node on a MSM8996 device, with
>  the function for the "rpm_request" channel defined, which is used for
> @@ -69,6 +77,8 @@ regualtors and root clocks.
>   compatible = "qcom,rpm-msm8996";
>   qcom,glink-channels = "rpm_requests";
>
> + intents = <0x400 5
> +   0x800 1>;
>   ...
>   };
>   };

Regards,
Bjorn
