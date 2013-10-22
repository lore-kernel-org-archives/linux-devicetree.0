From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Ksummit-2013-discuss] ARM topic: Is DT on ARM the solution, or
 is there something better?
Date: Tue, 22 Oct 2013 22:48:12 +0200
Message-ID: <20131022204811.GD8037@mithrandir>
References: <52644A9E.3060007@wwwdotorg.org>
 <20131021085420.GA21518@ulmo.nvidia.com>
 <52658C49.80400@wwwdotorg.org>
 <5265AFED.1040503@roeck-us.net>
 <52665314.2040904@imgtec.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="C1iGAkRnbeBonpVg"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52665314.2040904-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Cc: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org" <ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--C1iGAkRnbeBonpVg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 22, 2013 at 11:27:32AM +0100, James Hogan wrote:
> On 21/10/13 23:51, Guenter Roeck wrote:
> > In my opinion, not being able to describe behavior (or what people refer
> > to as "describe how the hardware is used") is a severe limitation of
> > devicetree usage in Linux. That is not a devicetree limitation per se,
> > though, it is simply a matter of choice (or, in some cases, the ability
> > of those arguing for new bindings to sell those bindings as "hardware
> > description").
>=20
> I agree this is a real problem, and I think it hinders upstream
> submission, since platform data was permitted to describe behaviour as
> well as describe the hardware, and platform data is being replaced with
> DT which is only permitted to describe the hardware. How then should we
> specify the behaviour to the kernel?
>=20
> I've already mentioned specific examples of this on the "Clock DT
> bindings" thread, and would be very interested if anybody has thoughts
> about it:
> http://lkml.kernel.org/r/520E1DF5.4030409-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org

I've certainly run into similar problems. To be specific, one such
instance involved backlight devices. In a nutshell, Linux' backlight
subsystem by default enables a backlight when it is probed (well, the
subsystem doesn't do that, but pretty much every driver does). This
seems to have worked very well, but when you hook up a backlight with
something high-level such as DRM, the fact that you no longer control
when the backlight is turned on becomes a problem. DRM knows very
precisely when a backlight or panel should be turned on, because it's
tightly coupled with when the display controller starts sending data to
the display. If the backlight is turned on by default at some
unpredictable point during the boot process, you end up with a powered
backlight that shows you all sorts of artifacts while the display is
being initialized.

My first attempt at solving this was to add a backlight-boot-off
property to the device tree, which would make the device driver keep the
backlight turned off on boot by default so that the DRM driver would be
able to turn it on only after the display was properly initialized.

Obviously that doesn't represent the hardware but some random bit of
software policy. The bad thing about it is that there's no other place
to put this bit of information. I can't change the default behaviour of
the backlight driver either because it is generic and used by many other
boards. So what's the solution to that? Perhaps duplicate the driver
with only the boot on default changed? Or add a new compatible value
"pwm-backlight-disabled-on-boot"? Guess that won't be acceptable either
because it encodes behaviour. "pwm-backlight-v2" wouldn't encode any
behaviour...

Thierry

--C1iGAkRnbeBonpVg
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSZuSLAAoJEN0jrNd/PrOhPDsP/1+8QbHREccbYuVl/UlAI8Xr
EpnqSHLW+JQSCgcZusE1V/TAwm5K/kHL9+WscB5xukQ+OMprO+VuNDuTjWWd/1N4
PmCvMeS3VJuS7SyDSTYzgKTWgp+fbliJiJad1JNkc8yz9gaHU3COPUSlAZqtSuDe
a/4z9DhGP2kMbMgdPW4GWIXsPafcIRAcn5C8gw2hnIJma9bMO9T/Rhg6dQQfpKLE
/eKMZPHAH6vxqDPrmYuUMt9oxex6MRA3J4IGWTjuiTM8nUidfai1Bc1Fa7dF9PC9
djtNBekegVLRwfOMs2DFUIIj7PQxAyYggb7iYF78TOqgTq9Rkd/ZIDwPSXVBiG+d
0cS2einCPIdh2HoLxRx05wj+wHIKV62YB24Yr+bUcDcbwIdYOFGZw/EkkHuwcihg
Wb2pc0nzWeKM5TUUj/wtjY5gKXB/mGy7ramcMQ9UFVuQYO0x/+HMORHixcL2ZpuL
j78sR77Bk8f/rqjNxheoujDWjpKpdl/DjZGH6IQpnqtKZ8XwmypsuCJUdICxzrNt
4WrQXGsbSlkItt+7BTEXhownfSqd0RoW3Sufzh33tFBNYhh6b4EkVIpUrxgwaGPn
NlPeFQ/LBpO8XaJwicihLjpoT48kaFl3k1xoBfiqniB5yJEnMu/Jar158oalx74D
Y7luA5WcE9i83uefyhwS
=VmMp
-----END PGP SIGNATURE-----

--C1iGAkRnbeBonpVg--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
