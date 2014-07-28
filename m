From: "Ivan T. Ivanov" <iivanov@mm-sol.com>
Subject: Re: [PATCH v2 2/4] pinctrl: qpnp: Qualcomm PMIC pin controller
 driver
Date: Mon, 28 Jul 2014 11:39:34 +0300
Message-ID: <1406536774.2475.36.camel@iivanov-dev>
References: <1405610748-7583-1-git-send-email-iivanov@mm-sol.com>
	 <1405610748-7583-3-git-send-email-iivanov@mm-sol.com>
	 <53D307BB.1020208@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <53D307BB.1020208@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: David Collins <collinsd@codeaurora.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Bjorn Andersson <bjorn.andersson@sonymobile.com>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, 2014-07-25 at 18:43 -0700, David Collins wrote:
> On 07/17/2014 08:25 AM, Ivan T. Ivanov wrote:
> > From: "Ivan T. Ivanov" <iivanov@mm-sol.com>
> >=20
> > This is the pinctrl, pinmux, pinconf and gpiolib driver for the
> > Qualcomm GPIO and MPP sub-function blocks found in the PMIC chips.
> > QPNP_REG_STATUS1_GPIO_EN_REV0_MASK
> > Signed-off-by: Ivan T. Ivanov <iivanov@mm-sol.com>
>=20
> (...)
> > +static int qpnp_conv_to_pin(struct qpnp_pinctrl *qctrl,
> > +			   struct qpnp_padinfo *pad, unsigned param,
> > +			   unsigned val)
> (...)
> > +	switch (param) {
> (...)
> > +	case PIN_CONFIG_OUTPUT:
> > +		nattrs =3D 3;
> > +		attr[0].addr  =3D QPNP_REG_MODE_CTL;
> > +		attr[0].shift =3D QPNP_REG_OUT_SRC_SEL_SHIFT;
> > +		attr[0].mask  =3D QPNP_REG_OUT_SRC_SEL_MASK;
> > +		attr[0].val   =3D !!val;
>=20
> It seems that this patch provides no means to configure the output so=
urce
> select bits to be anything besides 0 (constant low) or 1 (constant hi=
gh).
>  Some non-generic property is needed to configure this for both GPIOs=
 and
> MPPs.  Passing the value in via the output-high property does not see=
m
> like a good approach since that is a generic pin config property that=
 is
> defined to take no value.=20

True.

>  The special functions available for GPIOs (e.g.
> PWM/LPG, clock, keypad, etc.) which are configured via this register =
are
> used by many boards.

I was not sure what those features are and how to connect the numbers t=
o
the function, which is why I have restricted the values =E2=80=8B=E2=80=
=8Bof 0 and 1.

>=20
> Something else to consider is that QPNP_REG_OUT_SRC_SEL_MASK is being
> defined as 0xf which would imply that there are 16 possible output so=
urce
> select options.  While technically true, this makes the situation mor=
e
> complicated since half of those options are the inverted version of t=
he
> other half.  In the GPIO hardware this corresponds to an 8-way mux
> followed by an XOR gate to conditionally invert the mux output.  If o=
utput
> source select is handled this way, then the following values would ne=
ed to
> be supported in device tree for GPIOs:
> 	* 0:  constant low (already supported via output-low;)
> 	* 1:  constant high (already supported via output-high;)
> 	* 2:  paired GPIO
> 	* 3:  inverted paired GPIO
> 	* 4:  special function 1
> 	* 5:  inverted special function 1
> 	* 6:  special function 2
> 	* 7:  inverted special function 2
> 	* 8:  dtest1
> 	* 9:  inverted dtest1
> 	* 10: dtest2
> 	* 11: inverted dtest2
> 	* 12: dtest3
> 	* 13: inverted dtest3
> 	* 14: dtest4
> 	* 15: inverted dtest4
> The same options are supported by MPPs except for special function 1,
> inverted special function 1, special function 2, and inverted special
> function 2.

<snip>

I am working on proposal from Stephen Boyd to encode GPIO/MPP mode and=20
source select into combined function. Something like this one:

#define PM8XXX_DIGITAL_IN		0
#define PM8XXX_DIGITAL_OUT		1
#define PM8XXX_DIGITAL_IN_OUT		2

=2E..

/* mode and source select */
#define PM8XXX_FUNCTION(m,s)		((m) << 16 | (s))

#define PM8921_GPIO1_14_KYPD_SNS	PM8XXX_FUNCTION(PM8XXX_DIGITAL_IN, 1)
#define PM8921_GPIO9_14_KYPD_DRV	PM8XXX_FUNCTION(PM8XXX_DIGITAL_OUT, 1)
#define PM8921_GPIO33_35_PWM		PM8XXX_FUNCTION(PM8XXX_DIGITAL_OUT, 3)

=2E.

<snip>

> There is an off-by-one issue with the indexing between the hardware G=
PIO
> numbers (1-based) and the gpiolib gpio offsets (0-based).  Do you agr=
ee
> that the indexing used within the device tree gpiospecs should match =
the
> hardware numbering scheme?  I feel like this would be much less confu=
sing
> for users to work with. =20


Yep, will fix it. Thank you for review.

Regards,
Ivan
