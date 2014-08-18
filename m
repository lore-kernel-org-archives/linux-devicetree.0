From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [RFC] arm64: Add new cpu-return-addr device tree binding
Date: Mon, 18 Aug 2014 10:21:56 +0100
Message-ID: <20140818092156.GA14559@leverpostej>
References: <1408132130.22761.64.camel@smoke>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1408132130.22761.64.camel@smoke>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geoff Levand <geoff-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Geoff,

On Fri, Aug 15, 2014 at 08:48:50PM +0100, Geoff Levand wrote:
> Add a new device tree binding cpu-return-addr.  This binding is required for
> all ARM v8 CPUs that have an "enable-method" property value of "spin-table". The
> value is a 64 bit read-only physical address that secondary CPU execution will
> transfer to upon CPU shutdown.

As we already have implementations of spin-table which won't necessarily
be able to implement cpu-return-addr I do not think this can be required
for all spin-table implementations.

Given that it's probably not worth updating the topology documentation.

> Signed-off-by: Geoff Levand <geoff-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
> ---
> Hi All,
> 
> We currently have no way for arm64 spin-table CPUs to re-enter the spin
> table code, and some way to do so is needed to implement a hot-plug
> cpu_die() for these CPUs.  
> 
> I just wanted to get this binding patch out for review now.  I have other
> patches that implement the spin-table hot-plug in my kexec repo [1].
> 
> Please consider.
> 
> -Geoff
> 
> [1] https://git.linaro.org/people/geoff.levand/linux-kexec.git
> 
>  Documentation/devicetree/bindings/arm/cpus.txt     | 26 ++++++++++++++++++++++
>  Documentation/devicetree/bindings/arm/topology.txt | 16 +++++++++++++
>  2 files changed, 42 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/cpus.txt b/Documentation/devicetree/bindings/arm/cpus.txt
> index 1fe72a0..24b98a9 100644
> --- a/Documentation/devicetree/bindings/arm/cpus.txt
> +++ b/Documentation/devicetree/bindings/arm/cpus.txt
> @@ -201,6 +201,16 @@ nodes to be present and contain the properties described below.
>  			  property identifying a 64-bit zero-initialised
>  			  memory location.
>  
> +	- cpu-return-addr
> +		Usage: required for all ARM v8 CPUs that have an "enable-method"
> +		       property value of "spin-table".
> +		Value type: <prop-encoded-array>
> +		Definition:
> +			# On ARM v8 64-bit systems must be a two cell property.
> +			The value is a 64 bit read-only physical address that
> +			secondary CPU execution will transfer to upon CPU
> +			shutdown.

I'm not sure what's meant by read-only here. We're never likely to read
anything from that physical address, just branch the CPU there.

Cheers,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
