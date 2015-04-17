From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v3 3/4] ARM: dts: UniPhier: add support for UniPhier SoCs and boards
Date: Fri, 17 Apr 2015 17:56:02 +0200
Message-ID: <2809229.iRV9NgGGKe@wuerfel>
References: <1429285698-11829-1-git-send-email-yamada.masahiro@socionext.com> <1429285698-11829-4-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1429285698-11829-4-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, Baruch Siach <baruch@tkos.co.il>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Olof Johansson <olof@lixom.net>
List-Id: devicetree@vger.kernel.org

On Saturday 18 April 2015 00:48:17 Masahiro Yamada wrote:
> +
> +               smp_syscon@59801208 {
> +                       compatible = "socionext,uniphier-smp-reg", "syscon";
> +                       reg = <0x59801208 0x4>;
> +               };
> +
> 

Using syscon here is a good idea, but please name the register area
according to what it is called in the data sheet, not according to how
it is used in Linux, and list all the registers that belong in this
device. It's quite possible that another driver needs a second
register from the same syscon.

E.g. if there is a device called a foo controller, make this device

	foo-controller@0x59800000 {
		compatible = "socionext,uniphier-foo-controller", "syscon";
		reg = <0x59800000 0x4000>;
	};

then hardcode the 0x1208 offset in the smp code, or add it as an
argument to the property containing the phandle.

	Arnd
