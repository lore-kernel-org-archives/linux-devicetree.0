From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: cpu: Document and tweak clock-frequency property
Date: Sat, 07 Dec 2013 12:36:35 -0600
Message-ID: <52A36AB3.6060102@gmail.com>
References: <1386331027-26065-1-git-send-email-broonie@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1386331027-26065-1-git-send-email-broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linaro-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 12/06/2013 05:57 AM, Mark Brown wrote:
> From: Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> 
> The ARMv7 topology code uses the ePAPR specified mandatory clock-frequency
> property to determine the relative performances of the CPUs along with the
> CPU type. However with FDT we don't update to take account of the current
> speed and if the cores are not running at full speed on boot then a device
> tree which is accurate on boot can provide incorrect information about the
> relative performances of the cores.
> 
> Document the current usage both to override ePAPR and to make the binding
> within the kernel more complete. Ideally the kernel would use information
> from the CPU frequency scaling drivers here but they may in turn consider
> this property and such changes are likely to be part of the energy aware
> scheduling work so not immediately available.
> 
> Signed-off-by: Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/arm/cpus.txt | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/cpus.txt b/Documentation/devicetree/bindings/arm/cpus.txt
> index 91304353eea4..e3726f6bca92 100644
> --- a/Documentation/devicetree/bindings/arm/cpus.txt
> +++ b/Documentation/devicetree/bindings/arm/cpus.txt
> @@ -191,6 +191,15 @@ nodes to be present and contain the properties described below.
>  			  property identifying a 64-bit zero-initialised
>  			  memory location.
>  
> +	- clock-frequency
> +		Usage: required

This breaks compatibility. It may be required for a feature in the
kernel to work, but should not be required in general. Perhaps we need
"optional/recommended" or "optional/required for new designs". Or we
could say required only with heterogeneous cores.

> +		Value type: <u32> or <u64>

How do I determine the size? I think generally this property which is
used in multiple bindings is always u32. Of course, that won't work for
our 5GHz parts next year.

> +		Definition:
> +			This is specified in ePAPR as the current clock
> +			frequency of the CPU.  When used with these
> +			extensions it should reflect the maximum clock
> +			frequency for the CPU.

What does extensions mean? cpu topology nodes?

It is useful to have a standard way to determine the current cpu
frequency. I've been asked for this several times on highbank. This
could be cpufreq, but there is not always a driver loaded. lshw already
has support for reading the frequency using this property. So I'm not
real sure deviating from the ePAPR is a good idea.

If a cpu only supports 1 frequency, then clock-frequency will always
reflect the current and max freq. If a cpu supports multiple
frequencies, then it should have an OPP table with those frequencies. We
should then get max frequency from the OPP table rather than
clock-frequency. It is clear that clock-frequency is insufficient to
describe everything we need.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
