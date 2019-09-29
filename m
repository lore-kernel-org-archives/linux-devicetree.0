From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 4/6] arm64: dts: rockchip: Rename roc-pc with libretech
 notation
Date: Sun, 29 Sep 2019 23:32:18 +0200
Message-ID: <4177305.6QI6aNXrAv@phil>
References: <20190919052822.10403-1-jagan@amarulasolutions.com>
 <20190919052822.10403-5-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190919052822.10403-5-jagan@amarulasolutions.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Da Xue <da@lessconfused.com>, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Akash Gajjar <akash@openedev.com>, Levin Du <djw@t-chip.com.cn>, linux-amarula@amarulasolutions.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Jagan,

Am Donnerstag, 19. September 2019, 07:28:20 CEST schrieb Jagan Teki:
> Though the ROC-PC is manufactured by firefly, it is co-designed
> by libretch like other Libretech computer boards from allwinner,
> amlogic does.
> 
> So, it is always meaningful to keep maintain those vendors who
> are part of design participation so-that the linux mainline
> code will expose outside world who are the makers of such
> hardware prototypes.
> 
> So, rename the existing rk3399-roc-pc.dts with libretch notation,
> rk3399-libretech-roc-rk3399-pc.dts
> 
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>  arch/arm64/boot/dts/rockchip/Makefile                           | 2 +-
>  .../{rk3399-roc-pc.dts => rk3399-libretech-roc-rk3399-pc.dts}   | 0

Somewhat "randomly" renaming files for "exposure" of the maker isn't the
way to go. Especially as the file name itself is merely a handle and not
meant for fame. The board filename should mainly enable developers to
hopefully the correct board file to use/change - and "rk3399-roc-pc"
is sufficiently unique to do that.

Similar to how the NanoPi boards do that.

And renames not only loose the history of changes but also in this case
the file is in the kernel since july 2018 - more than a year, so this might
actually affect the workflow of someone.

So I'd really expect an actual technical reason for a rename.

Heiko


>  2 files changed, 1 insertion(+), 1 deletion(-)
>  rename arch/arm64/boot/dts/rockchip/{rk3399-roc-pc.dts => rk3399-libretech-roc-rk3399-pc.dts} (100%)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
> index 1f18a9392d15..73c10ddb4300 100644
> --- a/arch/arm64/boot/dts/rockchip/Makefile
> +++ b/arch/arm64/boot/dts/rockchip/Makefile
> @@ -21,12 +21,12 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-khadas-edge.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-khadas-edge-captain.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-khadas-edge-v.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-leez-p710.dtb
> +dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-libretech-roc-rk3399-pc.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-nanopc-t4.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-nanopi-m4.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-nanopi-neo4.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-orangepi.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-puma-haikou.dtb
> -dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-roc-pc.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-rock-pi-4.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-rock960.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-rockpro64.dtb
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dts b/arch/arm64/boot/dts/rockchip/rk3399-libretech-roc-rk3399-pc.dts
> similarity index 100%
> rename from arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dts
> rename to arch/arm64/boot/dts/rockchip/rk3399-libretech-roc-rk3399-pc.dts
> 
