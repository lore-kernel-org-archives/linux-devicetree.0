From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/2] ARM: at91: Add DT support for Olimex SAM9-L9260
 board.
Date: Thu, 2 Jun 2016 18:19:39 -0500
Message-ID: <20160602231939.GA32346@rob-hp-laptop>
References: <1464679051-5263-1-git-send-email-raashidmuhammed@zilogic.com>
 <1464679051-5263-2-git-send-email-raashidmuhammed@zilogic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1464679051-5263-2-git-send-email-raashidmuhammed@zilogic.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Raashid Muhammed <raashidmuhammed@zilogic.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, May 31, 2016 at 12:47:31PM +0530, Raashid Muhammed wrote:
> From: Raashid Muhammed <raashidmuhammed@zilogic.com>
> 
> sam9-l9260 is a low cost board designed by Olimex.
> 
> More information is available at:
> https://www.olimex.com/Products/ARM/Atmel/SAM9-L9260/
> 
> Signed-off-by: Raashid Muhammed <raashidmuhammed@zilogic.com>
> Reviewed-by: Vijay Kumar B. <vijaykumar@bravegnu.org>
> ---
>  Documentation/devicetree/bindings/arm/olimex.txt |   8 +-
>  arch/arm/boot/dts/Makefile                       |   1 +
>  arch/arm/boot/dts/at91-sam9_l9260.dts            | 115 +++++++++++++++++++++++
>  3 files changed, 122 insertions(+), 2 deletions(-)
>  create mode 100644 arch/arm/boot/dts/at91-sam9_l9260.dts

One nit, otherwise:

Acked-by: Rob Herring <robh@kernel.org>

> +			spi0: spi@fffc8000 {
> +				cs-gpios = <&pioC 11 0>, <0>, <0>, <0>;
> +				status = "okay";
> +
> +				mtd_dataflash@0 {

flash@0

> +					compatible = "atmel,at45", "atmel,dataflash";
> +					spi-max-frequency = <15000000>;
> +					reg = <0>;
> +				};
> +			};
