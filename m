From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 3/5] powerpc: dts: klondike: Add UART nodes
Date: Tue, 03 Apr 2012 09:57:03 -0600
Message-ID: <20120403155703.3B0593E053F@localhost>
References: <1333348747-12713-1-git-send-email-tinamdar@apm.com> <1333348747-12713-2-git-send-email-tinamdar@apm.com> <1333348747-12713-3-git-send-email-tinamdar@apm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1333348747-12713-3-git-send-email-tinamdar@apm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: benh@kernel.crashing.org, jwboyer@gmail.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: Tanmay Inamdar <tinamdar@apm.com>
List-Id: devicetree@vger.kernel.org

On Mon,  2 Apr 2012 12:09:05 +0530, Tanmay Inamdar <tinamdar@apm.com> wrote:
> Adding UART nodes in Klondike device tree file.
> 
> Signed-off-by: Tanmay Inamdar <tinamdar@apm.com>
> ---
> :100644 100644 4ff2852... d5bf2e1... M	arch/powerpc/boot/dts/klondike.dts
>  arch/powerpc/boot/dts/klondike.dts |   24 ++++++++++++++++++++++++
>  1 files changed, 24 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/powerpc/boot/dts/klondike.dts b/arch/powerpc/boot/dts/klondike.dts
> index 4ff2852..d5bf2e1 100644
> --- a/arch/powerpc/boot/dts/klondike.dts
> +++ b/arch/powerpc/boot/dts/klondike.dts
> @@ -222,6 +222,30 @@
>  				#size-cells = <1>;
>  				ranges;
>  				clock-frequency = <0>;
> +
> +				UART0: serial@50001000 {
> +				       device_type = "serial";
> +				       compatible = "ns16550";
> +				       reg = <0x50001000 0x00000100>;
> +				       virtual-reg = <0x50001000>;

Why do you need virtual-reg?  The kernel should handle all iomapping
properly without this.

g.
