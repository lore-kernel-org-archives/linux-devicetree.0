From: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [STLinux Kernel] [PATCH v5 7/7] ARM: STiH407: Move over to using
 the 'reserved-memory' API for obtaining DMA memory
Date: Wed, 16 Mar 2016 16:35:08 +0000
Message-ID: <20160316163508.GA8396@griffinp-ThinkPad-X1-Carbon-2nd>
References: <1452602781-22424-1-git-send-email-lee.jones@linaro.org>
 <1452602781-22424-8-git-send-email-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1452602781-22424-8-git-send-email-lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, Nathan_Lynch-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org, s-anna-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Lee,

On Tue, 12 Jan 2016, Lee Jones wrote:

> Doing so saves quite a bit of code in the driver.
> 
> For more information on the 'reserved-memory' bindings see:
> 
>   Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
> 
> Suggested-by: Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>
> Signed-off-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  arch/arm/boot/dts/stih407-family.dtsi | 46 +++++++++++++++++++++++++++++------
>  1 file changed, 38 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/stih407-family.dtsi b/arch/arm/boot/dts/stih407-family.dtsi
> index 15c20b6..27b8efc 100644
> --- a/arch/arm/boot/dts/stih407-family.dtsi
> +++ b/arch/arm/boot/dts/stih407-family.dtsi
> @@ -15,6 +15,36 @@
>  	#address-cells = <1>;
>  	#size-cells = <1>;
>  
> +	reserved-memory {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		gp0_reserved: rproc@40000000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x40000000 0x01000000>;
> +			no-map;
> +		};
> +
> +		gp1_reserved: rproc@41000000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x41000000 0x01000000>;
> +			no-map;
> +		};
> +
> +		audio_reserved: rproc@42000000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x42000000 0x01000000>;
> +			no-map;
> +		};
> +
> +		dmu_reserved: rproc@43000000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x43000000 0x01000000>;
> +			no-map;
> +		};

I don't believe these reserved memory ranges are correct for audio_reserved and dmu_reserved.

For example my vid_firmware-stih407.elf is linked at 0x41c00000 base address and my
audio_firmware-bd-stih407.elf is linked at 0x40c00000.

So with all the st231 rproc nodes enabled I guess it would still work. But
currently I think st231_gp0 is reserving the memory region for st231_audio,
and st231-gp1 is reserving the memory region for st231_dmu.

regards,

Peter.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
