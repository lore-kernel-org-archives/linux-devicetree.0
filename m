From: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH] arm/dt: Fix babbage.dts memory node
Date: Sun, 24 Apr 2011 20:48:02 +0800
Message-ID: <20110424124801.GC5161@S2100-06.ap.freescale.net>
References: <1303453526-27523-1-git-send-email-shawn.guo@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1303453526-27523-1-git-send-email-shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linaro-kernel-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Grant,

Let me know if you prefer to get babbage.dts deprecated by merging it
into mx51-babbage.dts.

-- 
Regards,
Shawn

On Fri, Apr 22, 2011 at 02:25:26PM +0800, Shawn Guo wrote:
> Without device_type property set as memory for the node, the generated
> dtb can still work when it gets passed to kernel by u-boot, since
> u-boot will fix it up.  But kernel will not boot due to that it fails
> to parse the memory node, when the dtb is appended to kernel image as
> it is.
> 
> The patch adds a property device_type="memory" for memory node to fix
> the problem.
> 
> Signed-off-by: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
> It applies on branch devicetree/test.
> 
>  arch/arm/boot/dts/babbage.dts |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/babbage.dts b/arch/arm/boot/dts/babbage.dts
> index 8f9b47c..4805168 100644
> --- a/arch/arm/boot/dts/babbage.dts
> +++ b/arch/arm/boot/dts/babbage.dts
> @@ -21,6 +21,7 @@
>  	interrupt-parent = <&tzic>;
>  
>  	memory {
> +		device_type = "memory";
>  		reg = <0x90000000 0x20000000>;
>  	};
>  
> -- 
> 1.7.4.1
> 
