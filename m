From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: Re: [PATCH 1/2] ARM: dts: at91: sama5d3_xplained: fix ADC vref
Date: Mon, 10 Apr 2017 12:28:27 +0200
Message-ID: <20170410102827.fo3lvmlmrfsbmjxj@piout.net>
References: <20170410082517.19628-1-ludovic.desroches@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170410082517.19628-1-ludovic.desroches@microchip.com>
Sender: stable-owner@vger.kernel.org
To: Ludovic Desroches <ludovic.desroches@microchip.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, nicolas.ferre@microchip.com, Eugen.Hristev@microchip.com, "# 3 . 16+" <stable@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 10/04/2017 at 10:25:16 +0200, Ludovic Desroches wrote:
> The voltage reference for the ADC is not 3V but 3.3V since it is connected to
> VDDANA.
> 
> Signed-off-by: Ludovic Desroches <ludovic.desroches@microchip.com>
> Cc: <stable@vger.kernel.org> # 3.16+
> ---
>  arch/arm/boot/dts/at91-sama5d3_xplained.dts | 1 +
>  1 file changed, 1 insertion(+)
> 
Applied, thanks.

-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
