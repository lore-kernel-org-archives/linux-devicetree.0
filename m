From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 1/3] ARM: dts: rockchip: Move cros-ec-sbs to
 rk3288-veyron-chromebook-sbs
Date: Sun, 30 Apr 2017 22:37:48 +0200
Message-ID: <2369975.a4dWayqU5d@phil>
References: <20170430183054.24563-1-contact@paulk.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170430183054.24563-1-contact@paulk.fr>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Paul Kocialkowski <contact@paulk.fr>, briannorris@chromium.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Paul,

Am Sonntag, 30. April 2017, 20:30:52 CEST schrieb Paul Kocialkowski:
> This moves the cros-ec-sbs dtsi to a new rk3288-veyron-chromebook-sbs
> dtsi since it only concerns rk3288 veyron Chromebooks.
> 
> Other Chromebooks (such as the tegra124 nyans) also have sbs batteries
> and don't use this dtsi, that only makes sense when used with
> rk3288-veyron-chromebook anyway.

That isn't true. The gru series (rk3399-based) also uses the
sbs-battery [0]. And while it is currently limited to Rockchip-based
Chromebooks it is nevertheless used on more than one platform, so
the probability is high that it will be used in future series as well.

Also, it might be nice to also include some Chromeos people (there should
be some in the git logs, like Brian who submitted the Gru patches), as they
might be able to provide more detailed input.


Heiko

[0] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi#n886

> 
> Signed-off-by: Paul Kocialkowski <contact@paulk.fr>
> ---
>  .../boot/dts/{cros-ec-sbs.dtsi => rk3288-veyron-chromebook-sbs.dtsi}    | 0
>  arch/arm/boot/dts/rk3288-veyron-jaq.dts                                 | 2 +-
>  arch/arm/boot/dts/rk3288-veyron-jerry.dts                               | 2 +-
>  arch/arm/boot/dts/rk3288-veyron-pinky.dts                               | 2 +-
>  arch/arm/boot/dts/rk3288-veyron-speedy.dts                              | 2 +-
>  5 files changed, 4 insertions(+), 4 deletions(-)
>  rename arch/arm/boot/dts/{cros-ec-sbs.dtsi => rk3288-veyron-chromebook-sbs.dtsi} (100%)
> 
> diff --git a/arch/arm/boot/dts/cros-ec-sbs.dtsi b/arch/arm/boot/dts/rk3288-veyron-chromebook-sbs.dtsi
> similarity index 100%
> rename from arch/arm/boot/dts/cros-ec-sbs.dtsi
> rename to arch/arm/boot/dts/rk3288-veyron-chromebook-sbs.dtsi
> diff --git a/arch/arm/boot/dts/rk3288-veyron-jaq.dts b/arch/arm/boot/dts/rk3288-veyron-jaq.dts
> index d33f5763c39c..f217a978e47a 100644
> --- a/arch/arm/boot/dts/rk3288-veyron-jaq.dts
> +++ b/arch/arm/boot/dts/rk3288-veyron-jaq.dts
> @@ -45,7 +45,7 @@
>  /dts-v1/;
>  
>  #include "rk3288-veyron-chromebook.dtsi"
> -#include "cros-ec-sbs.dtsi"
> +#include "rk3288-veyron-chromebook-sbs.dtsi"
>  
>  / {
>  	model = "Google Jaq";
> diff --git a/arch/arm/boot/dts/rk3288-veyron-jerry.dts b/arch/arm/boot/dts/rk3288-veyron-jerry.dts
> index cdea751f2a8c..bec607574165 100644
> --- a/arch/arm/boot/dts/rk3288-veyron-jerry.dts
> +++ b/arch/arm/boot/dts/rk3288-veyron-jerry.dts
> @@ -44,7 +44,7 @@
>  
>  /dts-v1/;
>  #include "rk3288-veyron-chromebook.dtsi"
> -#include "cros-ec-sbs.dtsi"
> +#include "rk3288-veyron-chromebook-sbs.dtsi"
>  
>  / {
>  	model = "Google Jerry";
> diff --git a/arch/arm/boot/dts/rk3288-veyron-pinky.dts b/arch/arm/boot/dts/rk3288-veyron-pinky.dts
> index 995cff42fa43..c81ad5bf1121 100644
> --- a/arch/arm/boot/dts/rk3288-veyron-pinky.dts
> +++ b/arch/arm/boot/dts/rk3288-veyron-pinky.dts
> @@ -44,7 +44,7 @@
>  
>  /dts-v1/;
>  #include "rk3288-veyron-chromebook.dtsi"
> -#include "cros-ec-sbs.dtsi"
> +#include "rk3288-veyron-chromebook-sbs.dtsi"
>  
>  / {
>  	model = "Google Pinky";
> diff --git a/arch/arm/boot/dts/rk3288-veyron-speedy.dts b/arch/arm/boot/dts/rk3288-veyron-speedy.dts
> index cc0b78cefe34..8aea9c3ff6e2 100644
> --- a/arch/arm/boot/dts/rk3288-veyron-speedy.dts
> +++ b/arch/arm/boot/dts/rk3288-veyron-speedy.dts
> @@ -44,7 +44,7 @@
>  
>  /dts-v1/;
>  #include "rk3288-veyron-chromebook.dtsi"
> -#include "cros-ec-sbs.dtsi"
> +#include "rk3288-veyron-chromebook-sbs.dtsi"
>  
>  / {
>  	model = "Google Speedy";
> 
