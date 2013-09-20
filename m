From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH V2 2/5] mfd: add support for AMS AS3722 PMIC
Date: Fri, 20 Sep 2013 13:39:30 +0100
Message-ID: <20130920123930.GB2185@lee--X1>
References: <1379680214-9143-1-git-send-email-ldewangan@nvidia.com>
 <1379680214-9143-3-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1379680214-9143-3-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: sameo@linux.intel.com, broonie@kernel.org, linus.walleij@linaro.org, akpm@linux-foundation.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, rtc-linux@googlegroups.com, rob.herring@calxeda.com, mark.rutland@arm.com, pawel.moll@arm.com, swarren@wwwdotorg.org, rob@landley.net, ijc+devicetree@hellion.org.uk, grant.likely@linaro.org, Florian Lobmaier <florian.lobmaier@ams.com>
List-Id: devicetree@vger.kernel.org

> The AMS AS3722 is a compact system PMU suitable for mobile phones,
> tablets etc. It has 4 DC/DC step-down regulators, 3 DC/DC step-down
> controller, 11 LDOs, RTC, automatic battery, temperature and
> over-current monitoring, 8 GPIOs, ADC and wathdog.
>=20
> Add mfd core driver for the AS3722 to support core functionality.

<snip>

> +Example:
> +--------
> +ams3722 {
> +	compatible =3D "ams,as3722";
> +	reg =3D <0x48>
> +
> +	interrupt-parent =3D <&intc>;
> +	interrupt-controller;
> +	#interrupt-cells =3D <2>;
> +
> +	gpio-controller;
> +	#gpio-cells =3D <2>;
> +
> +	gpio {
> +		/*
> +		 * GPIO related properties
> +		 * Refer document bindings/gpio/gpio-as3722.txt
> +		 */
> +	};
> +
> +	regulators {
> +		/*
> +		 * Regulator related properties
> +		 * Refer document bindings/regulator/as3722-regulator.txt
> +		 */
> +	};
> +};

I still don't think this is the way to go. If you can justify that
these sub-devices require their own node, then they should have a
compatible string. The MFD sub-system will then populate the of_node
for you and you can use/request them in the normal way.

To reiterate, Mark's issue was not the existence of the compatible
string, it was with the existence of the child nodes in general.

Personally I think the device should have sub-nodes. It's how  we
dealt with our DB8500 and AB8500 and it works very well. At the end of
the day these all-in-one chips do house very different devices. I see
no harm in describing them that way. I'm sure other OSes can make use
of the sub-devices in similar ways.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
