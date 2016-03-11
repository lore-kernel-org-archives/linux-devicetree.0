From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: vulcan: Update PCI ranges
Date: Fri, 11 Mar 2016 12:16:15 -0800
Message-ID: <56E3278F.5090200@gmail.com>
References: <56D200F5.7010505@broadcom.com>
 <1456645037-12978-1-git-send-email-jchandra@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1456645037-12978-1-git-send-email-jchandra-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jayachandran C <jchandra-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Florian Fainelli <florian.fainelli-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 27/02/16 23:37, Jayachandran C wrote:
> The PCI memory windows available in vulcan.dtsi are limited to 128MB
> for 32-bit BARs, and 4GB for 64-bit BARs. Given the memory mapped IO
> space available in arm64, these windows can be increased substantially
> to support more use cases.
> 
> The change increases the 32-bit window to 256MB and the 64-bit window
> to 128 GB. The firmware on vulcan boards will use these ranges as well.
> 
> PCI IO windows are not supported on Vulcan, so remove them instead of
> keeping an unused value.
> 
> Signed-off-by: Jayachandran C <jchandra-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> ---
> 
> This is an update to the patch with subject
> "arm64: Broadcom Vulcan support"
> I had sent earlier, please fold it into that patch if possible

Arnd, I do not have any other Broadcom ARM64 DT changes for 4.6 to be
sent at the moment, do you mind taking this patch directly?

Feel free to add my:

Signed-off-by: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Thanks!

> 
> Thanks,
> JC.
> 
> 
>  arch/arm64/boot/dts/broadcom/vulcan.dtsi | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/broadcom/vulcan.dtsi b/arch/arm64/boot/dts/broadcom/vulcan.dtsi
> index c49b5a8..85820e2 100644
> --- a/arch/arm64/boot/dts/broadcom/vulcan.dtsi
> +++ b/arch/arm64/boot/dts/broadcom/vulcan.dtsi
> @@ -108,12 +108,15 @@
>  		reg = <0x0 0x30000000  0x0 0x10000000>;
>  		reg-names = "PCI ECAM";
>  
> -			  /* IO 0x4000_0000 - 0x4001_0000 */
> -		ranges = <0x01000000 0 0x40000000 0 0x40000000 0 0x00010000
> -			  /* MEM 0x4800_0000 - 0x5000_0000 */
> -			  0x02000000 0 0x48000000 0 0x48000000 0 0x08000000
> -			  /* MEM64 pref 0x6_0000_0000 - 0x7_0000_0000 */
> -			  0x43000000 6 0x00000000 6 0x00000000 1 0x00000000>;
> +		/*
> +		 * PCI ranges:
> +		 *   IO		no supported
> +		 *   MEM        0x4000_0000 - 0x6000_0000
> +		 *   MEM64 pref 0x40_0000_0000 - 0x60_0000_0000
> +		 */
> +		ranges =
> +		  <0x02000000    0 0x40000000    0 0x40000000    0 0x20000000
> +		   0x43000000 0x40 0x00000000 0x40 0x00000000 0x20 0x00000000>;
>  		interrupt-map-mask = <0 0 0 7>;
>  		interrupt-map =
>  		      /* addr  pin  ic   icaddr  icintr */
> 


-- 
Florian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
