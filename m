From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: rockchip: replace gpio-key,
 wakeup with wakeup-source property
Date: Wed, 10 Feb 2016 00:32:51 +0100
Message-ID: <48510660.EJbbczq5fX@phil>
References: <1454968512-11956-1-git-send-email-sudeep.holla@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1454968512-11956-1-git-send-email-sudeep.holla-5wv7dgnIgG8@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Sudeep,

Am Montag, 8. Februar 2016, 21:55:12 schrieb Sudeep Holla:
> Keyboard driver for GPIO buttons(gpio-keys) checks for the legacy
> "gpio-key,wakeup" boolean property to enable gpio buttons as wakeup
> source.
> 
> Few dts files assign value "1" to gpio-key,wakeup and in one instance a
> value "0" is assigned probably assuming it won't be enabled as a wakeup
> source. Since the presence of the boolean property indicates it is
> enabled, value of "0" have no value.
> 
> This patch replaces the legacy "gpio-key,wakeup" with the unified
> "wakeup-source" property which inturn fixes the above mentioned issue.
> 
> Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> Reviewed-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
> Signed-off-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
> ---
>  arch/arm/boot/dts/rk3066a-bqcurie2.dts          | 3 +--
>  arch/arm/boot/dts/rk3066a-rayeager.dts          | 2 +-
>  arch/arm/boot/dts/rk3188-radxarock.dts          | 2 +-
>  arch/arm/boot/dts/rk3288-evb.dtsi               | 2 +-
>  arch/arm/boot/dts/rk3288-firefly.dtsi           | 2 +-
>  arch/arm/boot/dts/rk3288-popmetal.dts           | 2 +-
>  arch/arm/boot/dts/rk3288-r89.dts                | 2 +-
>  arch/arm/boot/dts/rk3288-veyron-chromebook.dtsi | 2 +-
>  arch/arm/boot/dts/rk3288-veyron.dtsi            | 2 +-
>  arch/arm64/boot/dts/rockchip/rk3368-evb.dtsi    | 2 +-
>  arch/arm64/boot/dts/rockchip/rk3368-r88.dts     | 2 +-
>  11 files changed, 11 insertions(+), 12 deletions(-)
> 
> Hi Heiko,
> 
> You can reviewed this, however there are couple of ARM64 dts additions.
> Also most of the other platform/SoC maintainers preferred to take it via
> their tree and few of these got missed during v4.5 merge window.
> Can you take it via your tree for v4.6 ?

I've split the patch in two, as the 32 and 64 bit devicetree parts go 
through separate branches and applied both to their respective branches for 
v4.6


Heiko
