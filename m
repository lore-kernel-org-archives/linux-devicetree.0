From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2] soc: qcom: smp2p: Access APCS as mailbox client
Date: Fri, 1 Dec 2017 16:25:45 -0600
Message-ID: <20171201222545.hkp73cuou6aildky@rob-hp-laptop>
References: <20171130000040.23681-1-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171130000040.23681-1-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Arun Kumar Neelakantam <aneela@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 29, 2017 at 04:00:40PM -0800, Bjorn Andersson wrote:
> Attempt to acquire the APCS IPC through the mailbox framework and fall
> back to the old syscon based approach, to allow us to move away from
> using the syscon.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Changes since v1:
> - Added dt binding update
> - Specifies knows_txdone on the mailbox client
> 
>  .../devicetree/bindings/soc/qcom/qcom,smp2p.txt    |  8 ++++-
>  drivers/soc/qcom/Kconfig                           |  1 +
>  drivers/soc/qcom/smp2p.c                           | 39 ++++++++++++++++++----
>  3 files changed, 41 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,smp2p.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,smp2p.txt
> index af9ca37221ce..a35af2dafdad 100644
> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,smp2p.txt
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,smp2p.txt
> @@ -17,9 +17,15 @@ processor ID) and a string identifier.
>  	Value type: <prop-encoded-array>
>  	Definition: one entry specifying the smp2p notification interrupt
>  
> -- qcom,ipc:
> +- mboxes:
>  	Usage: required
>  	Value type: <prop-encoded-array>
> +	Definition: reference to the associated doorbell in APCS, as described
> +		    in mailbox/mailbox.txt
> +
> +- qcom,ipc:
> +	Usage: required, unless mboxes is specified

Is this deprecated as mboxes is required, so it's never present?

> +	Value type: <prop-encoded-array>
>  	Definition: three entries specifying the outgoing ipc bit used for
>  		    signaling the remote end of the smp2p edge:
>  		    - phandle to a syscon node representing the apcs registers
