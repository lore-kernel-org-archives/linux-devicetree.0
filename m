From: Sylvain Lemieux <slemieux.tyco@gmail.com>
Subject: Re: [PATCH v2] clk: lpc32xx: add HCLK PLL output configuration
Date: Wed, 02 Mar 2016 09:28:40 -0500
Message-ID: <1456928920.8721.12.camel@localhost>
References: <1455130352-25860-1-git-send-email-slemieux.tyco@gmail.com>
	 <56D685F6.5060400@mleia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <56D685F6.5060400@mleia.com>
Sender: linux-clk-owner@vger.kernel.org
To: Vladimir Zapolskiy <vz@mleia.com>
Cc: sboyd@codeaurora.org, mturquette@baylibre.com, robh+dt@kernel.org, stigge@antcom.de, devicetree@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Vladimir,

On Wed, 2016-03-02 at 08:19 +0200, Vladimir Zapolskiy wrote:
> Hi Sylvain,
> 
> On 10.02.2016 20:52, slemieux.tyco@gmail.com wrote:
> > From: Sylvain Lemieux <slemieux@tycoint.com>
> > 
> > This patch add the support to setup the HCLK PLL output
> > using the "assigned-clock-rates" parameter in the device tree.
> > 
> > If the option is not use, the clock setup by the kickstart
> > and/or bootloader remain unchanged.
> > 
> > The previous kernel version did not change the clock frequency
> > output setup by the kickstart and/or bootloader;
> > this version always setup the clock frequency output to 208MHz.
> > 
> > Signed-off-by: Sylvain Lemieux <slemieux@tycoint.com>
> 
> I've found enough time to test the change and it looks good, so
> 
> 
> Acked-by: Vladimir Zapolskiy <vz@mleia.com>
> 
> 
> 
> Do you have any objections, if 208MHz clock is set by default
> in the shared DTSI file i.e.
> 
I do not have any objection;
you can add my Acked-by when you submit the patch.

> diff --git a/arch/arm/boot/dts/lpc32xx.dtsi b/arch/arm/boot/dts/lpc32xx.dtsi
> index c58d8da..ecbace8 100644
> --- a/arch/arm/boot/dts/lpc32xx.dtsi
> +++ b/arch/arm/boot/dts/lpc32xx.dtsi
> @@ -294,6 +294,9 @@
>  
>  					clocks = <&xtal_32k>, <&xtal>;
>  					clock-names = "xtal_32k", "xtal";
> +
> +					assigned-clocks = <&clk LPC32XX_CLK_HCLK_PLL>;
> +					assigned-clock-rates = <208000000>;
>  				};
>  			};
>  
> ?
> 
> In particular board files the value can be overwritten, however I think
> it is important to have some well defined clock value here to mitigate
> a risk of possible clock rate change done by a bootloader, for example
> the rate may be set to a lower value by a bootloader.
> 
> > ---
> > Changes from v1 to v2:
> > - Rename patch title;
> >   was "clk: lpc32xx: add clock frequency output configuration"
> > - Update the patch as per the feedback received from:
> >   Stephen: http://permalink.gmane.org/gmane.linux.kernel.clk/3913
> >   Vladimir: http://permalink.gmane.org/gmane.linux.kernel.clk/3921 
> > 
> > Note:
> > - There is currently an issue in the current driver;
> >   if the HCLK PLL output, configured by the kickstart and/or
> >   bootloader, is change by the kernel (ex. 266.5MHz to 208MHz),
> >   the serial console is no longer outputing properly.
> 
> yep, I'm aware of this issue too, however it is not obvious that
> the rootcause is in the clock driver, so we can discuss this topic
> somewhere else, but let me present a short intro about what I
> see on my end.
> 
> In case if PCLK is 266 MHz / 16 ~ 16520833 Hz, UART pre-divider is
> bypassed (X = 1, Y = 1), baudrate is 115200, then I observe corrupted
> I/O but correctly set divisor latch registers (DLM = 0, DLL = 9):
> 
>   16520833 / 16 / 9 ~ 114728
> 
> But if I change DLL to 7 as I should do in assumption
> that PCLK is 13 MHz, then UART I/O is *not* corrupted.
> 
> The same happens if I modify UART pre-divider, for example UART
> clock rate is 16520833, baudrate is 115200, X = 27, Y = 242,
> DLM = 0, DLL = 1:
> 
>   16520833 / 16 * 27 / 242 ~ 115202 -- but I/O is corrupted
> 
> And if I change to X = 19, Y = 134 as I should do in case of 
> PCLK = 13 MHz, then console UART is working fine.
> 
> It looks like UART clock is always pinned to 13 MHz (how is it
> possible technically?), but this contradicts to the datasheet IMHO.
> 
> --
> With best wishes,
> Vladimir


