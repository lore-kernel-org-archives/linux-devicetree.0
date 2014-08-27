From: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 9/9] arm64: Add new cpu-return-addr device tree binding
Date: Wed, 27 Aug 2014 09:30:22 +0100
Message-ID: <20140827083022.GE6968@arm.com>
References: <cover.1408736066.git.geoff@infradead.org>
 <4192d403bb9703063c59a052293faa19d38d2f02.1408736066.git.geoff@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4192d403bb9703063c59a052293faa19d38d2f02.1408736066.git.geoff-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geoff Levand <geoff-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 22, 2014 at 08:49:17PM +0100, Geoff Levand wrote:
> Add a new arm64 device tree binding cpu-return-addr.  This binding is recomended
> for all ARM v8 CPUs that have an "enable-method" property value of "spin-table".
> The value is a 64 bit physical address that secondary CPU execution will transfer
> to upon CPU shutdown.
> 
> Signed-off-by: Geoff Levand <geoff-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/arm/cpus.txt | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/cpus.txt b/Documentation/devicetree/bindings/arm/cpus.txt
> index 1fe72a0..42d5d5f 100644
> --- a/Documentation/devicetree/bindings/arm/cpus.txt
> +++ b/Documentation/devicetree/bindings/arm/cpus.txt
> @@ -201,6 +201,15 @@ nodes to be present and contain the properties described below.
>  			  property identifying a 64-bit zero-initialised
>  			  memory location.
>  
> +	- cpu-return-addr
> +		Usage: recomended for all ARM v8 CPUs that have an
> +		       "enable-method" property value of "spin-table".
> +		Value type: <prop-encoded-array>
> +		Definition:
> +			# On ARM v8 64-bit systems must be a two cell property.
> +			The value is a 64 bit physical address that secondary
> +			CPU execution will transfer to upon CPU shutdown.

As I've been away for most of the past four weeks, I haven't read all
the threads around this topic. But I don't think we ended up with a
clearly agreed recommendation for cpu-return-addr. If we do, we also
need to be clear on what state the CPU should be in when returned to
such address (ELx, MMU, caches).

In general, if we need returning to firmware I would strongly recommend
PSCI but I know there is the Applied board which does not have EL3, so
something like this may work. But we need to get them into discussion as
well since I assume cpu-return-addr would be a firmware provided
address.

-- 
Catalin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
