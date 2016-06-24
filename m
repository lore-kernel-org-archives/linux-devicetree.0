From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3] ARM: dts: sun8i: Add dts file for Olimex A33-OLinuXino
Date: Fri, 24 Jun 2016 12:16:42 +0200
Message-ID: <20160624101642.GC3785@lukather>
References: <1466418769-8384-1-git-send-email-stefan.mavrodiev@gmail.com>
 <20160622132222.GX26668@lukather>
 <2618ba96-c3c5-4db6-b860-d212e7045f23@googlegroups.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WplhKdTI2c8ulnbP"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBC4RWS5QKGQEITELUMI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <2618ba96-c3c5-4db6-b860-d212e7045f23-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: stefan.mavrodiev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-AbSShOkvfpQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--WplhKdTI2c8ulnbP
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Thu, Jun 23, 2016 at 04:07:13AM -0700, stefan.mavrodiev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
> > > +&usb_otg {
> > > +	dr_mode = "host";
> > > +	status = "okay";
> > > +};
> > > +
> > > +&usbphy {
> > > +	usb0_vbus-supply = <&reg_vcc5v0>;
> > > +	status = "okay";
> > > +
> > > +};
> > 
> > It doesn't work as USB OTG ?
> > 
> 
> The hardware should work as OTG. In FEL mode it works as device, and
> in current dt configuration - as host. I've spend some time trying
> to make it work as otg, but didn't succeed.
> 
> There are some hardware differences between our board and other a33,
> but if you say that OTG work, I'll spend some additional time
> working on it.

Yes, I've been testing and got it to work on at least two other A33
boards (the R16 Parrot and the Sinlinx SinA33). You can look at the
Parrot DT, you should have everything you need (but you will most
likely need linux-next).

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--WplhKdTI2c8ulnbP--
