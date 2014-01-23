From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH] clk: corenet: Update the clock bindings
Date: Wed, 22 Jan 2014 18:44:23 -0600
Message-ID: <1390437863.24905.549.camel@snotra.buserror.net>
References: <1390269732-22798-1-git-send-email-Yuantian.Tang@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1390269732-22798-1-git-send-email-Yuantian.Tang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tang Yuantian <Yuantian.Tang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: b07421-KZfg59tc24xl57MIdRCFDg@public.gmane.org, galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, b32579-KZfg59tc24xl57MIdRCFDg@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 2014-01-21 at 10:02 +0800, Tang Yuantian wrote:
> From: Tang Yuantian <yuantian.tang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> 
> Main changs include:
> 	- Clarified the clock nodes' version number
> 	- Fixed a issue in example
> 
> Singed-off-by: Tang Yuantian <Yuantian.Tang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/clock/corenet-clock.txt | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/corenet-clock.txt b/Documentation/devicetree/bindings/clock/corenet-clock.txt
> index 24711af..d6cadef 100644
> --- a/Documentation/devicetree/bindings/clock/corenet-clock.txt
> +++ b/Documentation/devicetree/bindings/clock/corenet-clock.txt
> @@ -54,6 +54,8 @@ Required properties:
>  		It takes parent's clock-frequency as its clock.
>  	* "fsl,qoriq-sysclk-2.0": for input system clock (v2.0).
>  		It takes parent's clock-frequency as its clock.
> +	Note: v1.0 and v2.0 are clock version which should align to
> +	clockgen node's they belong to which is chassis version.

Instead, how about a note like this near the top of the file:

All references to "1.0" and "2.0" refer to the QorIQ chassis version to
which the chip complies.

Chassis Version		Example Chips
---------------		-------------
1.0			p4080, p5020, p5040
2.0			t4240, b4860, t1040


BTW, this binding and the associated driver really should be called
"qoriq-clock", not "corenet-clock".  This would match the compatible
string, and it doesn't really have much to do with corenet (which is
part of the QorIQ chassis v1 and v2, but not *this* part).  Do you know
if the chassis v3 clock interface will be similar enough to share a
driver?

-Scott


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
