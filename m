From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v6 3/6] dt/bindings: add bindings for optee
Date: Mon, 16 Nov 2015 11:01:10 -0600
Message-ID: <20151116170109.GA20076@rob-hp-laptop>
References: <1446106888-8983-1-git-send-email-jens.wiklander@linaro.org>
 <1446106888-8983-4-git-send-email-jens.wiklander@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1446106888-8983-4-git-send-email-jens.wiklander@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kees Cook <keescook@chromium.org>, valentin.manea@huawei.com, jean-michel.delorme@st.com, emmanuel.michel@st.com, javier@javigon.com, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Mark Rutland <mark.rutland@arm.com>, Michal Simek <michal.simek@xilinx.com>, Will Deacon <will.deacon@arm.com>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 29, 2015 at 09:21:25AM +0100, Jens Wiklander wrote:
> Introduces optee prefix and adds bindings for ARM TrustZone based OP-TEE
> implementation.
> 
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> ---
>  .../bindings/arm/firmware/optee,optee-tz.txt       | 29 ++++++++++++++++++++++
>  .../devicetree/bindings/vendor-prefixes.txt        |  1 +
>  2 files changed, 30 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/firmware/optee,optee-tz.txt
> 
> diff --git a/Documentation/devicetree/bindings/arm/firmware/optee,optee-tz.txt b/Documentation/devicetree/bindings/arm/firmware/optee,optee-tz.txt
> new file mode 100644
> index 0000000..0a8ed0d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/firmware/optee,optee-tz.txt
> @@ -0,0 +1,29 @@
> +OP-TEE Device Tree Bindings
> +
> +OP-TEE is a piece of software using hardware features to provide a Trusted
> +Execution Environment. The security can be provided with ARM TrustZone, but
> +also by virtualization or a separate chip. As there's no single OP-TEE
> +vendor we're using "optee" as the first part of compatible property,
> +indicating the OP-TEE protocol is used when communicating with the secure
> +world.
> +
> +* OP-TEE based on ARM TrustZone required properties:
> +
> +- compatible     : should contain "optee,optee-tz"

I would leave off optee as a vendor. Different implementations by 
vendors should then add their vendor prefix as they all have the chance 
to screw-up something. I suppose we could do "linaro" as the reference 
implementation.

> +
> +- method         : The method of calling the OP-TEE Trusted OS. Permitted
> +                   values are:
> +
> +                   "smc" : SMC #0, with the register assignments specified
> +		           in drivers/tee/optee/optee_smc.h
> +
> +                   "hvc" : HVC #0, with the register assignments specified
> +		           in drivers/tee/optee/optee_smc.h

The use here would be a guest VM calling thru to hypervisor and then 
hypervisor calling optee?

> +
> +
> +
> +Example:
> +	optee {

This should go under a /firmware node similar to 
Documentation/devicetree/bindings/arm/firmware/tlm,trusted-foundations.txt.

Rob
