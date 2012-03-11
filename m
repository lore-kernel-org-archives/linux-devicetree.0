From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: kirkwood: Basic support for DNS-320 and DNS-325
Date: Sun, 11 Mar 2012 17:46:09 +0000
Message-ID: <201203111746.09757.arnd@arndb.de>
References: <1331476406-9844-1-git-send-email-jm@lentin.co.uk>
 <1331476406-9844-2-git-send-email-jm@lentin.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1331476406-9844-2-git-send-email-jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jamie Lentin <jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Jason <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sunday 11 March 2012, Jamie Lentin wrote:
> Add support for the DNS-320 and DNS-325. Describe as much as currently possible
> in the devicetree files, leave everything else in board-dt.c to be patched
> later.
> 
> Signed-off-by: Jamie Lentin <jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org>

Great work!

> +
> +/ {
> +	model = "D-Link DNS-320 NAS (Rev A1)";
> +	compatible = "dlink,dns-320-a1", "dlink,dns-320", "dlink,dns-kirkwood", "marvell,kirkwood-88f6281", "marvell,kirkwood";
> +
> +	memory {
> +		device_type = "memory";
> +		reg = <0x00000000 0x8000000>;
> +	};
> +
> +	chosen {
> +		bootargs = "console=ttyS0,115200n8 earlyprintk";
> +	};
> +
> +	wdt@fed20300 {
> +		compatible = "mrvl,orion-wdt";
> +		reg = <0xfed20300 0x28>;
> +		clock-frequency = <166666667>;
> +	};
> +
> +	serial@f1012000 {
> +		compatible = "ns16550a";
> +		reg = <0xf1012000 0xff>;
> +		reg-shift = <2>;
> +		interrupts = <33>;
> +		clock-frequency = <166666667>;
> +	};
> +
> +	serial@f1012100 {
> +		compatible = "ns16550a";
> +		reg = <0xf1012100 0xff>;
> +		reg-shift = <2>;
> +		interrupts = <34>;
> +		clock-frequency = <166666667>;
> +	};

I think the generic kirkwood device nodes should all be part of
the kirkwood.dtsi file, except for any properties you want to
override.

You can add a status="disabled" property in device nodes
that may not be connected in individual boards, and then
just override it by listing status="enabled" in the board.dts
file, without having to duplicate all the other properties.

I would also suggest to change the kirkwood.dtsi layout to
put all the on-chip peripherals from the 0xf1 section into
one bus in the device tree, like

	ocp@f1000000 {
		compatible = "simple-bus";
		ranges = <0xf1000000 0xf1000000 0x1000000>;
		#address-cells = 1;
		#size-cells = 1;

		serial@f1012000 {
			...
		};

		...
	};

Or even use the ranges property to remap everything into
a simpler address range:

	ocp@f1000000 {
		compatible = "simple-bus";
		ranges = <0 0xf1000000 0x1000000>;
		#address-cells = 1;
		#size-cells = 1;

		serial@12000 {
			reg = <0x12000 0x100>;
			...
		};

		...
	};


	Arnd
