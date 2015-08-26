From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/3] ARM: DT: STi: STiH407: Add c8sectpfe LinuxDVB DT
 node.
Date: Wed, 26 Aug 2015 12:57:52 +0100
Message-ID: <20150826115752.GX19409@x1>
References: <1440519730-486-1-git-send-email-peter.griffin@linaro.org>
 <1440519730-486-3-git-send-email-peter.griffin@linaro.org>
 <20150826073041.GT19409@x1>
 <20150826114433.GB1498@griffinp-ThinkPad-X1-Carbon-2nd>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150826114433.GB1498@griffinp-ThinkPad-X1-Carbon-2nd>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 26 Aug 2015, Peter Griffin wrote:
> On Wed, 26 Aug 2015, Lee Jones wrote:
> > On Tue, 25 Aug 2015, Peter Griffin wrote:
> >=20
> > > This patch adds in the required DT node for the c8sectpfe
> > > Linux DVB demux driver which allows the tsin channels
> > > to be used on an upstream kernel.
> > >=20
> > > Signed-off-by: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > > ---
> > >  arch/arm/boot/dts/stihxxx-b2120.dtsi | 38 ++++++++++++++++++++++=
++++++++++++++
> > >  1 file changed, 38 insertions(+)
> > >=20
> > > diff --git a/arch/arm/boot/dts/stihxxx-b2120.dtsi b/arch/arm/boot=
/dts/stihxxx-b2120.dtsi
> > > index 62994ae..1bc018e 100644
> > > --- a/arch/arm/boot/dts/stihxxx-b2120.dtsi
> > > +++ b/arch/arm/boot/dts/stihxxx-b2120.dtsi

[...]

> > How about *-c8sectpfe-demod?
>=20
> That doesn't really make sense, the demod is a seperate device
> typically controlled over I2C bus and connected to this IP block
> via the TS pins. Also although a tsin channel is "normally" connected
> to a demodulator device there is no reason it couldn't be connected
> for example to another STi chipset which is doing tsout.
>=20
> Also this IP block can do more than accept tsin, it can
> also do tsout, and merge TS channels together (some coming from
> DDR, external TS pins). Which are features we hope to add
> to the driver in the future so the name needs to be very generic.
>=20
> So with that in mind I would prefer to leave the compatible as
> the name of the IP block from the SoC datasheet.

Understood.  Thanks for the explanation.

[...]

> > > +				tsin-num =3D <0>;
> > > +				serial-not-parallel;
> > > +				i2c-bus =3D <&ssc2>;
> >=20
> > If you are adding this property, I would get Wolfram or one of the =
DT
> > guys to Ack it.
>=20
> This driver is actually already accepted, I just missed off one patch=
 from
> the v2 series which meant this patch broke the build when Mauro appli=
ed it,
> which is the reason for re-sending it.
>=20
> This binding is the same way the drm display drivers use DT via ddc-i=
2c-bus
> property to get the i2c bus for EDID control, so I think uncontrovers=
ial.

You're still adding a non-vendor property.  If you think it's generic
enough not to require a "<vendor>," prefix, please attempt to document
it in a generic binding document.

> > > +				rst-gpio =3D <&pio15 4 0>;
> >=20
> > Why not use the whole name "reset"?
> >=20
> > "-gpio" should be "-gpios".
> >=20
> > So, in full: "reset-gpios"?
> >=20
> > Flags: GPIO_ACTIVE_HIGH ?
>=20
> Doing a grep, that does seem to be "more standard". Will fix in V2 as=
 a single
> atomic commit.

It's not just 'more standard', it's documented in the GPIO binding.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
