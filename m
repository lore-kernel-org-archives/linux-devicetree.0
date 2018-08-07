Return-Path: <SRS0=Ch3o=KW=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-ed1-f65.google.com ([209.85.208.65]:38472 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729922AbeHGVjI (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 7 Aug 2018 17:39:08 -0400
Received: by mail-ed1-f65.google.com with SMTP id t2-v6so115055edr.5
        for <devicetree@vger.kernel.org>; Tue, 07 Aug 2018 12:23:16 -0700 (PDT)
Subject: Re: [PATCH] Change timer interrupt to edge sensitive
References: <1533210074-4996-1-git-send-email-silvan.murer@gmail.com>
From: Silvan Murer <silvan.murer@gmail.com>
Message-ID: <1389dc3f-080f-cbea-8db0-76ad6b0628c3@gmail.com>
Date: Tue, 7 Aug 2018 21:23:14 +0200
MIME-Version: 1.0
In-Reply-To: <1533210074-4996-1-git-send-email-silvan.murer@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: devicetree-owner@vger.kernel.org
To: thor.thayer@linux.intel.com, devicetree@vger.kernel.org
Cc: dinguyen@kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi Thor,

Did you saw my patch? I think the default configuration for the timer interrupt should be <1 13 0xf01>

Otherwise, the driver get the error "GIC: PPI13 is secure or misconfigured"

Base on the ARM documentation it is a edge sensitive trigger:
http://infocenter.arm.com/help/topic/com.arm.doc.ddi0407f/CCHEIGIC.html

Or do I understand something wrong?

Best regards,
Silvan


On 02.08.2018 13:41, Silvan Murer wrote:
> Signed-off-by: Silvan Murer <silvan.murer@gmail.com>
> ---
>  arch/arm/boot/dts/socfpga_arria10.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/socfpga_arria10.dtsi b/arch/arm/boot/dts/socfpga_arria10.dtsi
> index 791ca15..52a7025 100644
> --- a/arch/arm/boot/dts/socfpga_arria10.dtsi
> +++ b/arch/arm/boot/dts/socfpga_arria10.dtsi
> @@ -748,7 +748,7 @@
>  		timer@ffffc600 {
>  			compatible = "arm,cortex-a9-twd-timer";
>  			reg = <0xffffc600 0x100>;
> -			interrupts = <1 13 0xf04>;
> +			interrupts = <1 13 0xf01>;
>  			clocks = <&mpu_periph_clk>;
>  		};
>  

