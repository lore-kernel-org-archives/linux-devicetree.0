From: =?iso-8859-1?Q?St=E9phan?= Kochen <stephan-j6uo2F6POYhmR6Xm/wNWPw@public.gmane.org>
Subject: Re: [PATCH 3/3] lm90: register with thermal zones
Date: Sat, 23 Jan 2016 00:02:40 +0100
Message-ID: <20160122230239.GA22301@Stephans-iMac.lan>
References: <1453404877-17897-1-git-send-email-stephan@kochen.nl>
 <1453404877-17897-4-git-send-email-stephan@kochen.nl>
 <20160122224542.GA26117@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160122224542.GA26117@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Jean Delvare <jdelvare-IBi9RG/b67k@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, lm-sensors-GZX6beZjE8VD60Wz+7aTrA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Jan 22, 2016 at 04:45:42PM -0600, Rob Herring wrote:
> On Thu, Jan 21, 2016 at 08:34:37PM +0100, St=E9phan Kochen wrote:
> > +- #thermal-sensor-cells: Should be 1. See ../../thermal/thermal.tx=
t for a
> > +                         description of this property. Use the fol=
lowing
> > +                         values to refer to a specific sensor:
> > +                         0: chip internal sensor
> > +                         1: external sensor
> > +                         2: second external sensor, if present
>=20
> From my read of an LM90 datasheet, there is only an onchip sensor and=
 a=20
> single external one.

MAX6695 and MAX6696 have two external sensors, and also use the lm90
driver. (The LM90_HAVE_TEMP3 flag in the code.)

--=20
St=E9phan Kochen
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
