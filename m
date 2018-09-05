From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [RESEND PATCHv2 3/4] arm64: dts: add support for building DT
 overlays
Date: Wed, 5 Sep 2018 13:36:40 -0700
Message-ID: <bbfcd3d0-d3ce-d499-f14d-e284008c959a@gmail.com>
References: <1535719666-13595-1-git-send-email-t-kristo@ti.com>
 <1536048344-9995-1-git-send-email-t-kristo@ti.com>
 <1536048344-9995-4-git-send-email-t-kristo@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1536048344-9995-4-git-send-email-t-kristo@ti.com>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, tony@atomide.com, Devicetree Compiler <devicetree-compiler@vger.kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 09/04/18 01:05, Tero Kristo wrote:
> Add simple support for building DT overlays. This just compiles any
> given .dtso file under the base arch/arm64/boot/dts/*/ directory into
> a .dtbo.
> 
> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> ---
>  arch/arm64/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
> index 106039d..f04c814 100644
> --- a/arch/arm64/Makefile
> +++ b/arch/arm64/Makefile
> @@ -127,7 +127,7 @@ Image.%: Image
>  zinstall install:
>  	$(Q)$(MAKE) $(build)=$(boot) $@
>  
> -%.dtb: scripts
> +%.dtb %.dtbo: scripts
>  	$(Q)$(MAKE) $(build)=$(boot)/dts $(boot)/dts/$@
>  
>  PHONY += dtbs dtbs_install
> 

Same comments as for patch 1/4.
