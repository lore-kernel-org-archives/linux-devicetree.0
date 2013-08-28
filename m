From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Subject: Re: [PATCHv3 1/4] arm: dts: Add clock entries for timers in SOCFPGA
Date: Wed, 28 Aug 2013 17:31:27 +0200
Message-ID: <20130828153127.GA17806@pengutronix.de>
References: <1377118427-20644-1-git-send-email-dinguyen@altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1377118427-20644-1-git-send-email-dinguyen@altera.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: dinguyen@altera.com
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, dinh.linux@gmail.com, Ian Campbell <ian.campbell@citrix.com>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Pavel Machek <pavel@denx.de>, Rob Herring <rob.herring@calxeda.com>, Arnd Bergmann <arnd@arndb.de>, John Stultz <john.stultz@linaro.org>, Olof Johansson <olof@lixom.net>, Jamie Iles <jamie@jamieiles.com>, linux-arm-kernel@lists.infradead.org, Heiko Stuebner <heiko@sntech.de>
List-Id: devicetree@vger.kernel.org

Hi!

On Wed, Aug 21, 2013 at 03:53:44PM -0500, dinguyen@altera.com wrote:
> From: Dinh Nguyen <dinguyen@altera.com>
> 
> Set the correct clock entries for the the timers, and also clean up
> the timer entries for SOCFPGA by removing timer<n> in the timer entry.
> 
> Signed-off-by: Dinh Nguyen <dinguyen@altera.com>
> CC: Rob Herring <rob.herring@calxeda.com>
> Cc: Pawel Moll <pawel.moll@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Stephen Warren <swarren@wwwdotorg.org>
> Cc: Ian Campbell <ian.campbell@citrix.com>
> CC: Arnd Bergmann <arnd@arndb.de>
> Cc: Olof Johansson <olof@lixom.net>
> CC: Jamie Iles <jamie@jamieiles.com>
> Cc: John Stultz <john.stultz@linaro.org>
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: Pavel Machek <pavel@denx.de>
> Cc: devicetree@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  arch/arm/boot/dts/socfpga.dtsi         |   16 ++++++++--------
>  arch/arm/boot/dts/socfpga_cyclone5.dts |    8 ++++----
>  arch/arm/boot/dts/socfpga_vt.dts       |    8 ++++----
>  3 files changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/socfpga.dtsi b/arch/arm/boot/dts/socfpga.dtsi
> index 9706767..9957bae 100644
> --- a/arch/arm/boot/dts/socfpga.dtsi
> +++ b/arch/arm/boot/dts/socfpga.dtsi
> @@ -26,10 +26,6 @@
>  		ethernet1 = &gmac1;
>  		serial0 = &uart0;
>  		serial1 = &uart1;
> -		timer0 = &timer0;
> -		timer1 = &timer1;
> -		timer2 = &timer2;
> -		timer3 = &timer3;
>  	};
>

Yes. Do that.

>  	cpus {
> @@ -486,28 +482,32 @@
>  			interrupts = <1 13 0xf04>;
>  		};
>  
> -		timer0: timer0@ffc08000 {
> +		timer@ffc08000 {

No. Why? Than I can not write something like

&timer0 {
	clock-frequency = <100000000>;
};

and would have to reference the whole tree ala

/ {
	soc {
		timer@ffc08000 {
			clock-frequency = <100000000>;
		};
	};
};

in a boardspecific or SoC specific file (see below).

> diff --git a/arch/arm/boot/dts/socfpga_cyclone5.dts b/arch/arm/boot/dts/socfpga_cyclone5.dts
> index 698dde9..c1af01c 100644
> --- a/arch/arm/boot/dts/socfpga_cyclone5.dts
> +++ b/arch/arm/boot/dts/socfpga_cyclone5.dts
>  
> diff --git a/arch/arm/boot/dts/socfpga_vt.dts b/arch/arm/boot/dts/socfpga_vt.dts
> index 6f23121..72ff14c 100644
> --- a/arch/arm/boot/dts/socfpga_vt.dts
> +++ b/arch/arm/boot/dts/socfpga_vt.dts

Leads me to a question about terminology: Is the cyclone5 an actual board?
AFAIK it is. And the Cyclone 5 FPGA is also called socfpga? Is that correct?
But then, seeing that, in an other patch, you add two different sysmgr addresses to
the socfpga_vt and socfpga_cyclone5, there are different socfpgas?

I want to write a devicetree for the SoCkit. It has a Cyclone 5 on it.
So naturally I would now go and include the socfpga_cyclone5.dtsi, with all the
cyclone5 stuff and just add my board specific stuff in a socfpga_sockit.dts.
But there is no socfpga_cyclone5.dtsi, just the socfpga_cyclone5.dts, which itself
seems to be a board...

So, how should we reorder the current dts (as I tested with current mainline, the
support is completely broken out of the box, but works fine with your patches that
are floating around, there should be no users as of now)?

Something like:

socfpga.dtsi
 -> socfpga_cyclone5.dtsi
 --> socfpga_cyclone5_devboard.dts (?)
 --> socfpga_sockit.dts
 -> socfpga_???.dtsi
 --> socfpga_vt.dts

?

Thanks and regards,
Steffen

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
