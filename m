From: Dinh Nguyen <dinguyen@opensource.altera.com>
Subject: Re: [PATCH] dts: add specific compatible type for Terasic DE0-NANO-SoC
 Board
Date: Wed, 24 Feb 2016 10:50:15 -0600
Message-ID: <alpine.DEB.2.02.1602241048100.3815@linux-builds1>
References: <8416439.76b9YNhpgR@dabox>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <8416439.76b9YNhpgR@dabox>
Sender: linux-kernel-owner@vger.kernel.org
To: Tim Sander <tim@krieglstein.org>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Tim,

On Fri, 12 Feb 2016, Tim Sander wrote:

> From: Tim Sander <tim@krieglstein.org>
> 
> Add a more specific compatible string:"terasic,de0-nano-soc" for respective board.
> Background: when checking for bootspec entries, some board specific fixups
>                          are not apropriate for board of the same platform ("altr,socfpga-cyclone5").
>                         The same aproach is taken with the EBV-Socrates board.
>

Please fix up the spacing in the commit message.

> Signed-off-by: Tim Sander <tim@krieglstein.org>
> ---
>  arch/arm/boot/dts/socfpga_cyclone5_de0_sockit.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/socfpga_cyclone5_de0_sockit.dts b/arch/arm/boot/dts/socfpga_cyclone5_de0_sockit.dts
> index 555e9caf21e1..3a427423168e 100644
> --- a/arch/arm/boot/dts/socfpga_cyclone5_de0_sockit.dts
> +++ b/arch/arm/boot/dts/socfpga_cyclone5_de0_sockit.dts
> @@ -18,7 +18,7 @@
>  
>  / {
>         model = "Terasic DE-0(Atlas)";
> -       compatible = "altr,socfpga-cyclone5", "altr,socfpga";
> +       compatible = "terasic,de0-nano-soc"," altr,socfpga-cyclone5", "altr,socfpga";
> 

"terasic" is not listed in Documentation/devicetree/bindings/vendor-prefixes.txt.
 
BR,
Dinh
