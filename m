From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 2/5] dt/bindings: add bindings for optee
Date: Tue, 15 Sep 2015 17:37:07 -0500
Message-ID: <55F89D93.4080608@kernel.org>
References: <1439973629-19505-1-git-send-email-jens.wiklander@linaro.org>
 <1439973629-19505-3-git-send-email-jens.wiklander@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1439973629-19505-3-git-send-email-jens.wiklander@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kees Cook <keescook@chromium.org>, valentin.manea@huawei.com, jean-michel.delorme@st.com, emmanuel.michel@st.com, javier@javigon.com, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Mark Rutland <mark.rutland@arm.com>, Michal Simek <michal.simek@xilinx.com>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

On 08/19/2015 03:40 AM, Jens Wiklander wrote:
> Introduces optee prefix and adds bindings for ARM TrustZone based OP-TEE
> implementation.
> 
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> ---
>  Documentation/devicetree/bindings/optee/optee.txt     | 17 +++++++++++++++++

How about bindings/arm/firmware/... where the *other* TZ binding is located.

>  Documentation/devicetree/bindings/vendor-prefixes.txt |  1 +
>  2 files changed, 18 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/optee/optee.txt
> 
> diff --git a/Documentation/devicetree/bindings/optee/optee.txt b/Documentation/devicetree/bindings/optee/optee.txt
> new file mode 100644
> index 0000000..4a6ff10
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/optee/optee.txt
> @@ -0,0 +1,17 @@
> +OP-TEE Device Tree Bindings
> +
> +OP-TEE is a piece of software using hardware features to provide a Trusted
> +Execution Environment. The security can be provided with ARM TrustZone, but
> +also by virtualization or a separate chip. As there's no single OP-TEE

I don't see how the Linux side would not need to know what the
communication channel is whether it is smc, hvc, or something else.

> +vendor we're using "optee" as the first part of compatible property,
> +indicating the OP-TEE protocol is used when communicating with the secure
> +world.
> +
> +* OP-TEE based on ARM TrustZone required properties:
> +
> +- compatible="optee,optee-tz"
> +
> +Example:
> +	optee {
> +		compatible="optee,optee-tz";
> +	};
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> index 8033919..17c2a7e 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -141,6 +141,7 @@ nvidia	NVIDIA
>  nxp	NXP Semiconductors
>  onnn	ON Semiconductor Corp.
>  opencores	OpenCores.org
> +optee	OP-TEE, Open Portable Trusted Execution Environment
>  ortustech	Ortus Technology Co., Ltd.
>  ovti	OmniVision Technologies
>  panasonic	Panasonic Corporation
> 
