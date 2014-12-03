From: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v9 3/8] devicetree: mfd: Add new SKY81452 mfd binding
Date: Wed, 03 Dec 2014 12:39:55 +0900
Message-ID: <001701d00eaa$cdd0d970$69728c50$%han@samsung.com>
References: <1417507529-13654-1-git-send-email-jack.yoo@skyworksinc.com>
 <1417507529-13654-4-git-send-email-jack.yoo@skyworksinc.com>
 <20141202140727.GD22522@x1> <20141203030905.GA4352@jack-ThinkPad-T520>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <20141203030905.GA4352@jack-ThinkPad-T520>
Content-language: ko
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: 'Gyungoh Yoo' <gyungoh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, 'Lee Jones' <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jack.yoo-tjhQNA90jdKqndwCJWfcng@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, florian.vaussard-p8DiymsW2f8@public.gmane.org, trivial-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, 'Jingoo Han' <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wednesday, December 03, 2014 12:09 PM, Gyungoh Yoo wrote:
> On Tue, Dec 02, 2014 at 02:07:27PM +0000, Lee Jones wrote:
> > This requires a DT Ack.
>=20
> I think I need to double-check the recipients.
> Thank you for the comment.

Yes, right.
We should be careful when creating new DT properties.
This is because DT can be handled as ABI. Thus, Ack from
DT maintainers is necessary for merging new DT properties,
even though other subsystem maintainers or reviews gave
Ack for this.

Best regards,
Jingoo Han

>=20
> >
> > > From: Gyungoh Yoo <jack.yoo-tjhQNA90jdKqndwCJWfcng@public.gmane.org>
> > >
> > > Signed-off-by: Gyungoh Yoo <jack.yoo-tjhQNA90jdKqndwCJWfcng@public.gmane.org>
> > > ---
> > > Changes v9:
> > > Nothing
> > >
> > > Changes v8:
> > > Made up the example for backlight DT
> > >
> > > Changes v7:
> > > Nothing
> > >
> > > Changes v6:
> > > Nothing
> > >
> > > Changes v5:
> > > Changed DT for regulator : 'lout' node should be defined under 'r=
egulator'
> > > Removed compatible string from sky81452-regulator driver
> > >
> > > Changes v4:
> > > Nothing
> > >
> > > Changes v3:
> > > Nothing
> > >
> > > Changes v2:
> > > Added reg attribute for I2C slave address
> > >
> > >  Documentation/devicetree/bindings/mfd/sky81452.txt | 36 ++++++++=
++++++++++++++
> > >  1 file changed, 36 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/mfd/sky8145=
2.txt
> > >
> > > diff --git a/Documentation/devicetree/bindings/mfd/sky81452.txt
> b/Documentation/devicetree/bindings/mfd/sky81452.txt
> > > new file mode 100644
> > > index 0000000..ab71473
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/mfd/sky81452.txt
> > > @@ -0,0 +1,36 @@
> > > +SKY81452 bindings
> > > +
> > > +Required properties:
> > > +- compatible	: Must be "skyworks,sky81452"
> > > +- reg		: I2C slave address
> > > +
> > > +Required child nodes:
> > > +- backlight	: container node for backlight following the binding
> > > +		in video/backlight/sky81452-backlight.txt
> > > +- regulator	: container node for regulators following the bindin=
g
> > > +		in regulator/sky81452-regulator.txt
> > > +
> > > +Example:
> > > +
> > > +	sky81452@2c {
> > > +		compatible =3D "skyworks,sky81452";
> > > +		reg =3D <0x2c>;
> > > +
> > > +		backlight {
> > > +			compatible =3D "skyworks,sky81452-backlight";
> > > +			name =3D "pwm-backlight";
> > > +			skyworks,en-channels =3D <0x3f>;
> > > +			skyworks,ignore-pwm;
> > > +			skyworks,phase-shift;
> > > +			skyworks,ovp-level =3D <20>;
> > > +			skyworks,current-limit =3D <2300>;
> > > +		};
> > > +
> > > +		regulator {
> > > +			lout {
> > > +				regulator-name =3D "sky81452-lout";
> > > +				regulator-min-microvolt =3D <4500000>;
> > > +				regulator-max-microvolt =3D <8000000>;
> > > +			};
> > > +		};
> > > +	};
> >
> > --
> > Lee Jones
> > Linaro STMicroelectronics Landing Team Lead
> > Linaro.org =E2=94=82 Open source software for ARM SoCs
> > Follow Linaro: Facebook | Twitter | Blog

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
