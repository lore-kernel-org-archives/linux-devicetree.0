From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: properties to describe a rotary encoder
Date: Fri, 16 Oct 2015 11:59:51 +0200
Message-ID: <20151016095951.GA6533@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Daniel Mack <daniel-cYrQPVfZoowdnm+yROfE0A@public.gmane.org>
Cc: kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello,

there is already a driver for rotary encoders described in
Documentation/devicetree/bindings/input/rotary-encoder.txt. This howeve=
r
is not suitable to describe the device I have here for two reasons:

=46irst the driver can only make use of 2 gpio lines, while the device
here has 4 lines, so I have 16 sectors instead of only 4. And the
second difference is that my encoder has a detend for each sector while
the driver only supports "half-period" and "full-period" (default) mode=
=2E
These names really only make sense for the 2 line case and mean the
encoder has detends in 2 or 1 sector respectively.

So I'm thinking about how to generalize the description to allow to add
support for "my" device.

=46or the added gpio lines it's easy, that's just allowing more than tw=
o
gpios for the "gpios" property.

Currently there is a property "rotary-encoder,steps" that describes the
number of detends in a full turnaround. So if we stick to "steps" to
describe detends, maybe something like "sectors-per-step" (with a
default of 4) would be needed to describe what "half-period" is now.
Does this make sense? Maybe someone has a better suggestion?

I'll start implementing that now, but give you time to think about a
good name/scheme already. :-)

=46eedback welcome.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
