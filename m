From: Christian Ruppert <christian.ruppert@abilis.com>
Subject: Re: [PATCH 1/2] pinmux: Add TB10x pinmux driver
Date: Fri, 10 May 2013 10:25:23 +0200
Message-ID: <20130510082521.GA2125@ab42.lan>
References: <1365608728-30494-1-git-send-email-christian.ruppert@abilis.com>
 <516EEAA0.10906@wwwdotorg.org>
 <20130418090310.GA17636@ab42.lan>
 <CACRpkdZd0_W432od5565phhUcJMRWiV9vXX4QVF4osKkxstC0Q@mail.gmail.com>
 <20130429161725.GB30136@ab42.lan>
 <5182B557.4040804@wwwdotorg.org>
 <CACRpkdaxO0q_P2wJFy3zv4F-QM9dZk54qW8ft350XqcBt1Gr1w@mail.gmail.com>
 <20130508164123.GA10248@ab42.lan>
 <518AAF31.8080502@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <518AAF31.8080502@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Patrice CHOTARD <patrice.chotard@st.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Sascha Leuenberger <sascha.leuenberger@abilis.com>, Pierrick Hascoet <pierrick.hascoet@abilis.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, May 08, 2013 at 02:01:53PM -0600, Stephen Warren wrote:
> On 05/08/2013 10:41 AM, Christian Ruppert wrote:
> ...
> > What do you think about the following modification to the pinctrl/G=
PIO
> > frameworks instead (not yet a formal patch, more a request for comm=
ent
> > to illustrate what I mean. If you agree, I will clean it up and sub=
mit a
> > proper patch after discussion).
> >=20
> > It adds a dt_gpiorange_xlate function to the pinctrl callbacks whic=
h
> > defaults to the conventional behaviour using kernel logical pin num=
bers.
> > However, pin controllers which provide more complex mechanisms can
> > define #gpio-range-cells and provide this callback in order to keep
> > Linux pin numbering inside the kernel.
>=20
> Can you provide an example of the DT content, and explain exactly wha=
t
> this patch does with it; what effect it has on the existing GPIO or
> pinctrl code?

The patch does not change the default behaviour of the kernel: In case
no dt_gpiorange_xlate callback is defined for a given driver (e.g. for
pre-existing drivers), the default function simply interprets the first
argument as Linux pin number and the second as pin count, same as now.
New drivers can use the callback to translate device specific pin
references to Linux pin numbers (in the idea of of_xlate in the GPIO
framework or xlate in the irqchip framework).

In the case of TB10x, I was thinking of something in the lines of

iomux: iomux@FF10601c {
	#gpio-range-cells =3D <1>;   /* one cell used for gpiorange phandle */
	compatible =3D "abilis,tb10x-iomux";
	reg =3D <0xFF10601c 0x4>;
	pctl_gpio_a: pctl-gpio-a { /* define phandle to GPIOA I/O function */
		pingrp =3D "gpioa_pins";
	};
	pctl_gpio_b: pctl-gpio-b { /* define phandle to GPIOB I/O function */
		pingrp =3D "gpiob_pins";
	};
	pctl_uart0: pctl-uart0 {   /* define phandle to UART0 I/O function */
		pingrp =3D "uart0_pins";
	};
};
uart@FF100000 {
	compatible =3D "snps,dw-apb-uart";
	reg =3D <0xFF100000 0x100>;
	clock-frequency =3D <166666666>;
	interrupts =3D <25 1>;
	reg-shift =3D <2>;
	reg-io-width =3D <4>;
	pinctrl-names =3D "default";  /* For non-GPIO modules, request I/O */
	pinctrl-0 =3D <&pctl_uart0>;  /* functions normally */
};
gpioa: gpio@FF140000 {
	compatible =3D "abilis,tb10x-gpio";
	reg =3D <0xFF140000 0x1000>;
	gpio-controller;
	#gpio-cells =3D <2>;
	gpio-ranges =3D <&iomux &pctl_gpio_a>; /* (*1) */
};

gpioa: gpio@FF140000 {
	compatible =3D "abilis,tb10x-gpio";
	reg =3D <0xFF140000 0x1000>;
	gpio-controller;
	#gpio-cells =3D <2>;
	pinctrl-names =3D "default"   /* here the GPIO controller requests */
	pinctrl-0 =3D <&pctl_gpio_b>; /* the entire GPIOB port explicitly */
	gpio-ranges =3D <&iomux &pctl_gpio_b>; /* (*2) */
};

(*1) TB100 GPIO ranges are defined as a phandle to the I/O function
     which provides all pins of a given GPIO port. This function is not
     necessarily requested from pinctrl and GPIO ports may overlap with
     other functions. The pin controller knows about this and provides
     whatever GPIO pin is available after mapping other requested
     functions.
(*2) Here, the entire GPIOB port is explicitly requested by the GPIO
     module, i.e. all pins of the port are made available as GPIOs.

The xlate function in pinctrl-tb10x.c would look something like this:

static int tb10x_dt_gpiorange_xlate(struct pinctrl_dev *pctldev,
					struct device_node *np,
					u32 *rangespec, int rangespecsize,
					u32 *pin_offset, u32 *npins)
{
	const char *name;
	int ret;
	struct tb10x_pinfuncgrp *pfg;
	struct device_node *dn;

	if (rangespecsize !=3D 1)
		return -EINVAL;

	dn =3D of_find_node_by_phandle(rangespec[0]);
	if (!dn)
		return -EINVAL;
	of_node_put(dn);

	ret =3D of_property_read_string(dn, "pingrp", &name);
	if (ret)
		return ret;

	pfg =3D tb10x_get_pinfuncgrp(name);
	if (IS_ERR(pfg))
		return PTR_ERR(pfg);

	if (!pfg->isgpio)
		return -EINVAL;

	*pin_offset =3D pfg->pins[0];
	*npins      =3D pfg->pincnt;

	return 0;
}

Other drivers may use physical pin numbers, assign integer identifiers
to each GPIO bank or use some other numbering scheme documented in
Documentation/devicetree/bindings.

Greetings,
  Christian

--=20
  Christian Ruppert              ,          <christian.ruppert@abilis.c=
om>
                                /|
  Tel: +41/(0)22 816 19-42     //|                 3, Chemin du Pr=E9-F=
leuri
                             _// | bilis Systems   CH-1228 Plan-les-Oua=
tes
