From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v6 2/5] MAINTAINERS: add zx2967 SoC drivers to ARM ZTE
 architecture
Date: Thu, 5 Jan 2017 14:49:43 +0800
Message-ID: <20170105064941.GB4667@x250>
References: <1483530494-14177-1-git-send-email-baoyou.xie@linaro.org>
 <1483530494-14177-2-git-send-email-baoyou.xie@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1483530494-14177-2-git-send-email-baoyou.xie@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Baoyou Xie <baoyou.xie@linaro.org>
Cc: mark.rutland@arm.com, amitdanielk@gmail.com, ulf.hansson@linaro.org, geert+renesas@glider.be, arnd@arndb.de, devicetree@vger.kernel.org, pankaj.dubey@samsung.com, xie.baoyou@zte.com.cn, linux-kernel@vger.kernel.org, krzk@kernel.org, claudiu.manoil@nxp.com, robh+dt@kernel.org, chen.chaokai@zte.com.cn, laurent.pinchart@ideasonboard.com, yangbo.lu@nxp.com, wang.qiang01@zte.com.cn, jun.nie@linaro.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Jan 04, 2017 at 07:48:11PM +0800, Baoyou Xie wrote:
> Add the ZTE SoC drivers as maintained by ARM ZTE
> architecture maintainers, as they're parts of the core IP.
> 
> By the way, this patch adds the maintainer for ARM
> ZTE architecture to Baoyou Xie.
> 
> Signed-off-by: Baoyou Xie <baoyou.xie@linaro.org>
> ---
>  MAINTAINERS | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ad199da..2593296 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1975,12 +1975,17 @@ F:	arch/arm/mach-pxa/include/mach/z2.h
>  
>  ARM/ZTE ARCHITECTURE
>  M:	Jun Nie <jun.nie@linaro.org>
> +M:	Baoyou Xie <baoyou.xie@linaro.org>
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  S:	Maintained
>  F:	arch/arm/mach-zx/
>  F:	drivers/clk/zte/
> +F:	drivers/soc/zte/
> +F:	drivers/thermal/zx*

This line is about thermal support, and shouldn't be added in this
patch series.

Shawn

>  F:	Documentation/devicetree/bindings/arm/zte.txt
>  F:	Documentation/devicetree/bindings/clock/zx296702-clk.txt
> +F:	Documentation/devicetree/bindings/soc/zte/
> +F:	include/dt-bindings/soc/zx*.h
>  
>  ARM/ZYNQ ARCHITECTURE
>  M:	Michal Simek <michal.simek@xilinx.com>
> -- 
> 2.7.4
> 
