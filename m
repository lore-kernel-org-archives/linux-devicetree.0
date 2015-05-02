Return-Path: <linux-arm-kernel-bounces+robherring2=gmail.com@lists.infradead.org>
Date: Sat, 2 May 2015 16:59:47 +0200
From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] Show proper respect for Heinrich Hertz by using the
 correct unit for frequency
Message-ID: <20150502145947.GA8156@xo-6d-61-c0.localdomain>
References: <20150511131952.GD2067@n2100.arm.linux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20150511131952.GD2067@n2100.arm.linux.org.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+robherring2=gmail.com@lists.infradead.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: devicetree@vger.kernel.org, linux-omap@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-ID: <devicetree@vger.kernel.org>

Hi!

> The SI unit of frequency is Hertz, named after Heinrich Hertz, and is
> given the symbol "Hz" to denote this.  "hz" is not the unit of frequency,
> and is in fact meaningless.
> 
> Fix arch/arm to correctly use "Hz", thereby acknowledging Heinrich Hertz
> contribution to the modern world.
> 

> --- a/arch/arm/mach-ixp4xx/include/mach/platform.h
> +++ b/arch/arm/mach-ixp4xx/include/mach/platform.h
> @@ -74,7 +74,7 @@ extern unsigned long ixp4xx_exp_bus_size;
>  /*
>   * Clock Speed Definitions.
>   */
> -#define IXP4XX_PERIPHERAL_BUS_CLOCK 	(66) /* 66Mhzi APB BUS   */ 
> +#define IXP4XX_PERIPHERAL_BUS_CLOCK 	(66) /* 66MHzi APB BUS   */ 
>  #define IXP4XX_UART_XTAL        	14745600
>  

Speaking about meaningless... What is MHzi supposed to mean?

ACK for the rest.
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
