From: Suzuki K Poulose <Suzuki.Poulose@arm.com>
Subject: Re: [PATCH] coresight: document binding acronyms
Date: Wed, 22 Jun 2016 10:10:18 +0100
Message-ID: <576A55FA.1080707@arm.com>
References: <1466534486-22422-1-git-send-email-mathieu.poirier@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1466534486-22422-1-git-send-email-mathieu.poirier@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mathieu Poirier <mathieu.poirier@linaro.org>, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, sudeep.holla@arm.com, olof@lixom.net
List-Id: devicetree@vger.kernel.org

On 21/06/16 19:41, Mathieu Poirier wrote:
> It can be hard for people not familiar with the CoreSight IP blocks
> to make sense of the acronyms found in the current bindings.  As such
> this patch expands each acronym in the hope of providing a better
> description of the IP block they represent.
>
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>

Thanks for the update. One minor comment below.

> ---
>   .../devicetree/bindings/arm/coresight.txt          | 32 ++++++++++++++++------
>   1 file changed, 24 insertions(+), 8 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/arm/coresight.txt b/Documentation/devicetree/bindings/arm/coresight.txt
> index 93147c0c8a0e..c73a7f773998 100644
> --- a/Documentation/devicetree/bindings/arm/coresight.txt
> +++ b/Documentation/devicetree/bindings/arm/coresight.txt
> @@ -12,14 +12,30 @@ its hardware characteristcs.
>
>   	* compatible: These have to be supplemented with "arm,primecell" as
>   	  drivers are using the AMBA bus interface.  Possible values include:
> -		- "arm,coresight-etb10", "arm,primecell";
> -		- "arm,coresight-tpiu", "arm,primecell";
> -		- "arm,coresight-tmc", "arm,primecell";
> -		- "arm,coresight-funnel", "arm,primecell";
> -		- "arm,coresight-etm3x", "arm,primecell";
> -		- "arm,coresight-etm4x", "arm,primecell";
> -		- "qcom,coresight-replicator1x", "arm,primecell";
> -		- "arm,coresight-stm", "arm,primecell"; [1]
> +		- Embedded Trace Buffer (version 1.0):
> +			"arm,coresight-etb10", "arm,primecell";
> +
> +		- Trace Port Interface Unit:
> +			"arm,coresight-tpiu", "arm,primecell";
> +
> +		- Trace Memory Controller (ETB, ETF, ETR):
> +			"arm,coresight-tmc", "arm,primecell";

Is it worth an explicit mention about this, something like :
"We don't need special bindings for the mode (e.g, ETB, ETF or ETR) in
which the Coresight TMC is configured".

Either way, looks good to me.

Suzuki
