From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [RESEND PATCHv2 2/2] arm64: ti: add support for building Texas
 instruments overlays
Date: Wed, 5 Sep 2018 13:53:16 -0700
Message-ID: <da954637-3eab-a48b-e608-f379a4572a1c@gmail.com>
References: <1535722107-13767-1-git-send-email-t-kristo@ti.com>
 <1536049651-10206-1-git-send-email-t-kristo@ti.com>
 <1536049651-10206-3-git-send-email-t-kristo@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1536049651-10206-3-git-send-email-t-kristo@ti.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Tero Kristo <t-kristo@ti.com>, catalin.marinas@arm.com, will.deacon@arm.com, linux@armlinux.org.uk, robh+dt@kernel.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, tony@atomide.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 09/04/18 01:27, Tero Kristo wrote:
> Add the symbols to TI build DT files, for supporting overlays. Right now,
> there are no overlay files introduced, those shall be added later on.
> 
> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> ---
>  arch/arm64/boot/dts/ti/Makefile | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
> index 63e619d..753de8c 100644
> --- a/arch/arm64/boot/dts/ti/Makefile
> +++ b/arch/arm64/boot/dts/ti/Makefile
> @@ -6,4 +6,6 @@
>  # Copyright (C) 2016-2018 Texas Instruments Incorporated - http://www.ti.com/
>  #
>  
> +DTC_FLAGS += -@
> +
>  dtb-$(CONFIG_ARCH_K3_AM6_SOC) += k3-am654-base-board.dtb
> 

same comment as for patch 1/2
