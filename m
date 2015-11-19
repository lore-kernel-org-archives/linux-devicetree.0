From: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH RESEND 1/8] arm: dts: berlin2q: add watchdog nodes
Date: Thu, 19 Nov 2015 21:47:05 +0100
Message-ID: <564E3549.2050700@gmail.com>
References: <1447672194-483-1-git-send-email-jszhang@marvell.com>
 <1447672194-483-2-git-send-email-jszhang@marvell.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1447672194-483-2-git-send-email-jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jisheng Zhang <jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 16.11.2015 12:09, Jisheng Zhang wrote:
> The Marvell Berlin BG2Q has 3 watchdogs which are compatible with the
> snps,dw-wdt driver sit in the sysmgr domain. This patch adds the
> corresponding device tree nodes.
> 
> Signed-off-by: Jisheng Zhang <jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
> ---
>  arch/arm/boot/dts/berlin2q.dtsi | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/berlin2q.dtsi b/arch/arm/boot/dts/berlin2q.dtsi
> index a3ecde5..fac4315 100644
> --- a/arch/arm/boot/dts/berlin2q.dtsi
> +++ b/arch/arm/boot/dts/berlin2q.dtsi
> @@ -483,6 +483,30 @@
>  			ranges = <0 0xfc0000 0x10000>;
>  			interrupt-parent = <&sic>;
>  
> +			wdt0: watchdog@1000 {
> +				compatible = "snps,dw-wdt";
> +				reg = <0x1000 0x100>;
> +				clocks = <&refclk>;
> +				interrupts = <0>;
> +				status = "disabled";

Jisheng,

as the watchdogs are internal and cannot be clock gated
at all, how about we remove the status = "disabled" and
make them always available?

I have applied patches 1-4 with the status property removed.
This also renders patches 5-8 useless.

So, for now tentatively

Appled to berlin/dt and berlin64/dt respectivly

with status property removed.

Sebastian

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
