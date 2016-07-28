From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v4] ARM: dts: sun8i: Add dts file for Olimex A33-OLinuXino
Date: Thu, 28 Jul 2016 19:53:30 +0200
Message-ID: <20160728175330.GC6682@lukather>
References: <1469450243-19138-1-git-send-email-stefan.mavrodiev@gmail.com>
 <30014119.IrjfP0xFry@linux-cigu>
 <20160727062146.GA6560@lukather>
 <1604486.mrBvLz4HRZ@linux-cigu>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9Ek0hoCL9XbhcSqy"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBG4N5G6AKGQESE3OF4Y-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <1604486.mrBvLz4HRZ@linux-cigu>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: stefan.mavrodiev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--9Ek0hoCL9XbhcSqy
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Wed, Jul 27, 2016 at 01:02:41PM +0300, stefan.mavrodiev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
> On Wednesday, July 27, 2016 8:21:46 AM EEST Maxime Ripard wrote:
> > On Wed, Jul 27, 2016 at 08:12:29AM +0300, stefan.mavrodiev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
> > > > > +&reg_dcdc1 {
> > > > > +	regulator-always-on;
> > > > > +	regulator-min-microvolt = <3300000>;
> > > > > +	regulator-max-microvolt = <3300000>;
> > > > > +	regulator-name = "vcc-dsi";
> > > > > +};
> > > > 
> > > > What is it used for? Is it really necessary to keep it on at all time?
> > > 
> > > I think so.
> > > This is the supply for the MMC.
> > 
> > Then it's poorly named, and you should tie it to the MMC, and remove
> > the always-on if it's only used by the mmc. always-on is supposed to
> > be for regulators that shouldn't but turned off for the system to stay
> > running. Some MMC regulator doesn't fit that description.
>
> It's named upon the A33 power pin - "VCC-DSI".

Usually, it's based on the name of the output in the schematics,
precisely because, from one board to another, it might have different
usage.

> If I remove "always-on" the board still will work, since dcdc1 is tied to 
> mmc0. 
> vmmc-supply = <&reg_dcdc1>;
> 
> We assume this voltage will be always present and there are some pullups that 
> are tied to it (on i2c0 and i2c1 bus).  In this case should I remove "always-
> on" from the regulator node?

No, you should just tie that regulator to the i2c buses as well.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--9Ek0hoCL9XbhcSqy--
