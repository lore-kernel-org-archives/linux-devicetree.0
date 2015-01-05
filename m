From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH 2/2] ARM: mediatek: dts: Add uart to Aquaris5
Date: Mon, 5 Jan 2015 13:28:49 +0100
Message-ID: <20150105122849.GF4544@pengutronix.de>
References: <1420224485-11043-1-git-send-email-matthias.bgg@gmail.com>
 <1420224485-11043-3-git-send-email-matthias.bgg@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1420224485-11043-3-git-send-email-matthias.bgg@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-kernel@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Matthias,

On Fri, Jan 02, 2015 at 07:48:05PM +0100, Matthias Brugger wrote:
> This patch enables uart port for the Aquaris5 mobile phone.
> 
> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
> ---
>  arch/arm/boot/dts/mt6589-aquaris5.dts | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/mt6589-aquaris5.dts b/arch/arm/boot/dts/mt6589-aquaris5.dts
> index 0da0470..d5cbfda 100644
> --- a/arch/arm/boot/dts/mt6589-aquaris5.dts
> +++ b/arch/arm/boot/dts/mt6589-aquaris5.dts
> @@ -21,10 +21,16 @@
>  	compatible = "mundoreader,bq-aquaris5", "mediatek,mt6589";
>  
>  	chosen {
> -		bootargs = "earlyprintk";
> +		bootargs = "console=ttyS0,921600n8 earlyprintk";
>  	};

		stdout-path = &uart0;

Should work aswell and makes you independent from the way the kernel
decides to number the UARTs.

>  
>  	memory {
>  		reg = <0x80000000 0x40000000>;
>  	};
> +
> +	soc {
> +		uart0: serial@11006000 {
> +			status = "okay";
> +		};
> +	};

By using the & notation you don't have to resemble the tree structure in
the board file, like this:

&uart0 {
	status = "okay";
};

See for example the omap, i.MX or other dts files.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
