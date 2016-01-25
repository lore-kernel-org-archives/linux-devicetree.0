From: Jean Delvare <jdelvare-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [lm-sensors] [PATCH 1/3] lm90: separate register accessors from
 sysfs
Date: Mon, 25 Jan 2016 10:41:48 +0100
Message-ID: <20160125104148.1ec28e3a@endymion.delvare>
References: <1453404877-17897-1-git-send-email-stephan@kochen.nl>
	<1453404877-17897-2-git-send-email-stephan@kochen.nl>
	<56A23FD2.9040009@roeck-us.net>
	<20160122220056.GA21534@Stephans-iMac.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160122220056.GA21534-3Ql6wuUqVi7fKcxHm0zdRv8+0UxHXcjY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?U3TDqXBoYW4=?= Kochen <stephan-j6uo2F6POYhmR6Xm/wNWPw@public.gmane.org>
Cc: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jean Delvare <jdelvare-IBi9RG/b67k@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, lm-sensors-GZX6beZjE8VD60Wz+7aTrA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi St=C3=A9phan and Guenter,

On Fri, 22 Jan 2016 23:00:57 +0100, St=C3=A9phan Kochen wrote:
> Guenter,
>=20
> Thanks for the taking the time to review!
>=20
> You are absolutely right. I will split this up, more carefully check
> coding style and simply do away with unnecessary changes.

Yes, thanks Guenter for the initial review.

> Regarding:
>=20
> On Fri, Jan 22, 2016 at 06:42:26AM -0800, Guenter Roeck wrote:
> > On 01/21/2016 11:34 AM, St=C3=A9phan Kochen wrote:
> > >+#define SELECT_REGS(_reg, _channel) { \
> > >+	high =3D LM90_REG_W_##_reg##H; \
> > >+	low =3D LM90_REG_W_##_reg##L; \
> > >+	channel =3D _channel; \
> > >+}
> >=20
> > We have been trying to get rid of function defines such as this one=
=2E
> > Most of the time it increases code size, and reduces readability.
> > Plus, it increases the amount of time we have to spend reviewing
> > the code to ensure it is correct.
> >=20
> > >+	switch (index) {
> > >+	case REMOTE_LOW:    SELECT_REGS(REMOTE_LOW,  0); break;
> > >+	case REMOTE_HIGH:   SELECT_REGS(REMOTE_HIGH, 0); break;
> > >+	case REMOTE_OFFSET: SELECT_REGS(REMOTE_OFFS, 0); break;
> > >+	case REMOTE2_LOW:   SELECT_REGS(REMOTE_LOW,  1); break;
> > >+	case REMOTE2_HIGH:  SELECT_REGS(REMOTE_HIGH, 1); break;
> > >+	default: return;
> >=20
> > ... and, in this case, introduces checkpatch errors.
>=20
> Should I simply unfold the macro here? Another option would be an arr=
ay
> of structs like in set_temp8, but it'd have some gaps here. Or is som=
e
> other construct preferred?

Anything will be better than macro-generated functions.

> I guess this is where I snuck in another change (which I will separat=
e),
> to replace SENSOR_DEVICE_ATTR_2 with regular ATTR. The setter args of
> _ATTR_2 were using literal numbers to point into an array defined in =
the
> setter function. (Maybe to avoid exactly the kind of thing I built
> here.)
>=20
> Would it be an idea to combine temp8 and temp11 variants, and let the
> getters and setters figure out what kind of register access to do bas=
ed
> on register index?

Can't answer that as long as I don't know which problem you are trying
to solve. Hopefully this will become clearer once the changes are
cleanly separated into incremental steps.

--=20
Jean Delvare
SUSE L3 Support
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
