From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Subject: Re: [PATCH 2/3] of: make CONFIG_OF user selectable
Date: Wed, 3 Jun 2015 11:14:14 +0300
Message-ID: <85E4D22F-9BE5-402F-B22D-2D13CB0732AF@konsulko.com>
References: <1433285204-4307-1-git-send-email-robh@kernel.org> <1433285204-4307-3-git-send-email-robh@kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1433285204-4307-3-git-send-email-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Grant Likely <grant.likely@linaro.org>, Ralf Baechle <ralf@linux-mips.org>, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

> On Jun 3, 2015, at 01:46 , Rob Herring <robh@kernel.org> wrote:
> 
> With the addition of overlays, it is now plausible to use DT on any arch
> and without an arch using it at boot time. It is also desirable to
> expand the compile coverage of the DT code. Make CONFIG_OF user
> selectable by converting the menu to menuconfig.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
> Cc: Grant Likely <grant.likely@linaro.org>
> ---
> drivers/of/Kconfig | 9 ++++-----
> 1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/of/Kconfig b/drivers/of/Kconfig
> index 07bb3c8..415b51d 100644
> --- a/drivers/of/Kconfig
> +++ b/drivers/of/Kconfig
> @@ -1,11 +1,10 @@
> config DTC
> 	bool
> 
> -config OF
> -	bool
> +menuconfig OF
> +	bool "Device Tree and Open Firmware support"
> 
> -menu "Device Tree and Open Firmware support"
> -	depends on OF
> +if OF
> 
> config OF_UNITTEST
> 	bool "Device Tree runtime unit tests"
> @@ -97,4 +96,4 @@ config OF_OVERLAY
> 	  While this option is selected automatically when needed, you can
> 	  enable it manually to improve device tree unit test coverage.
> 
> -endmenu # OF
> +endif # OF
> -- 
> 2.1.0
> 

Acked-by: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
