From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v6 1/2] DT: hwspinlock: Add binding documentation for
 Qualcomm hwmutex
Date: Thu, 12 Mar 2015 09:51:37 +0000
Message-ID: <20150312095136.GA30145@leverpostej>
References: <1425076217-10415-1-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1425076217-10415-1-git-send-email-bjorn.andersson@sonymobile.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <Pawel.Moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Ohad Ben-Cohen <ohad@wizery.com>, Kumar Gala <galak@codeaurora.org>, Suman Anna <s-anna@ti.com>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, Jeffrey Hugo <jhugo@codeaurora.org>, Andy Gross <agross@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Feb 27, 2015 at 10:30:16PM +0000, Bjorn Andersson wrote:
> Add binding documentation for the Qualcomm Hardware Mutex.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>
> ---
> 
> I think the conclusion on the dt binding discussion for hwspinlocks was that
> we're down to having the #hwlock-cells intact. So this version includes that,
> but non of the other previously discussed properties.
> 
> Changes since v5:
> - Extracted the dt binding documentation into a separate patch
> - Moved the driver to consume a syscon

I'm a little confused here. Why are we now using a syscon? I thought the
set of registers for the block was well-defined.

If there's a link to some previous discussion on that point, it would be
helpful.

Mark.

> - Dropped previously suggested generic hwlock dt bindings
> 
>  .../devicetree/bindings/hwlock/qcom-hwspinlock.txt | 39 ++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.txt
> 
> diff --git a/Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.txt b/Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.txt
> new file mode 100644
> index 0000000..28ade7d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.txt
> @@ -0,0 +1,39 @@
> +Qualcomm Hardware Mutex Block:
> +
> +The hardware block provides mutexes utilized between different processors on
> +the SoC as part of the communication protocol used by these processors.
> +
> +- compatible:
> +	Usage: required
> +	Value type: <string>
> +	Definition: must be one of:
> +		    "qcom,sfpb-mutex",
> +		    "qcom,tcsr-mutex"
> +
> +- syscon:
> +	Usage: required
> +	Value type: <prop-encoded-array>
> +	Definition: one cell containing:
> +		    syscon phandle
> +		    offset of the hwmutex block within the syscon
> +		    stride of the hwmutex registers
> +
> +- #hwlock-cells:
> +	Usage: required
> +	Value type: <u32>
> +	Definition: must be 1, the specified cell represent the lock id
> +		    (hwlock standard property, see hwlock.txt)
> +
> +Example:
> +
> +        tcsr: syscon@1a400000 {
> +		compatible = "qcom,tcsr-msm8974", "syscon";
> +		reg = <0xfd484000 0x2000>;
> +	};
> +
> +	hwlock@fd484000 {
> +		compatible = "qcom,tcsr-mutex";
> +		syscon = <&tcsr 0 0x80>;
> +
> +		#hwlock-cells = <1>;
> +	};
> -- 
> 1.8.2.2
> 
> 
