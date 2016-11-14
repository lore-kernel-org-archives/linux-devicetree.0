From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: Re: [PATCH 3/3] ARM: dts: sunxi: add support for
 Orange Pi Zero board
Date: Mon, 14 Nov 2016 14:10:46 +0100
Message-ID: <20161114131046.t2iy3imx5ozcgrp6@lukather>
References: <20161111164654.15273-1-icenowy@aosc.xyz>
 <20161111164654.15273-3-icenowy@aosc.xyz>
 <20161114085839.qzu7ebeghoqlqygn@lukather>
 <CAGb2v677zQGihbz1o2izM-y5GJ4VDApf6-WDJAk3UyZdsK-vWQ@mail.gmail.com>
 <cbbf8ae1-ff29-2a83-265b-a9ff5bacf97b@redhat.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rddduspccowvqz4q"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBV7PU3AQKGQEYJZLLOI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <cbbf8ae1-ff29-2a83-265b-a9ff5bacf97b-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>, Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--rddduspccowvqz4q
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Mon, Nov 14, 2016 at 11:00:32AM +0100, Hans de Goede wrote:
> > > > +&usbphy {
> > > > +     /* USB VBUS is always on */
> > > 
> > > You can put the always on regulators (I'm guessing reg_vcc5v0 ?) here.
> > 
> > AFAIK the regulator properties are optional the the USB PHY.
> > So we probably don't need to add it. Hans (CC-ed) could explain
> > his original intent?
> 
> I've made the regulators optional exactly for boards like these,
> where there is no regulator. Likely the Vbus is simply wired
> directly to the 5V DC-in jack. So IMHO adding something like
> the fixed reg_vcc5v0 a supply here just makes the dt
> harder to read.

It also makes the regulator tree more complete and accurate because
you'd list all the devices that are needing those regulators. That
would also make it easier to deal with in the future.

But fair enough.
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--rddduspccowvqz4q--
